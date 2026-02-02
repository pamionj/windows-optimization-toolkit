# ==========================================
# Windows Optimization Toolkit - v2 Professional
# Compatible Windows 10 / 11
# ==========================================

$root = $PSScriptRoot
$log = "$root\optimize_log.txt"
$hw = "$root\hardware_report.txt"

Start-Transcript -Path $log -Append

Write-Host "=== Windows Optimization Toolkit v2 ==="

# ---------------------------
# System Info
# ---------------------------

$os = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor
$ramBytes = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory
$ramGB = [math]::Round($ramBytes / 1GB,2)

Write-Host "OS:" $os.Caption
Write-Host "CPU:" $cpu.Name
Write-Host "RAM:" $ramGB "GB"

if ($ramGB -lt 8) {
    Write-Host "WARNING: Low RAM detected (<8GB)"
}

# Export hardware report
Get-ComputerInfo | Out-File $hw

# ---------------------------
# Restore Point
# ---------------------------

Write-Host "Creating restore point..."
Enable-ComputerRestore -Drive "C:\"
Checkpoint-Computer -Description "PreOptimization_v2" -RestorePointType MODIFY_SETTINGS

# ---------------------------
# Disk Detection
# ---------------------------

$disk = Get-PhysicalDisk -ErrorAction SilentlyContinue

if (!$disk) {
    $media = Get-WmiObject Win32_DiskDrive | Select MediaType -First 1
    $diskType = if ($media.MediaType -like "*SSD*") {"SSD"} else {"HDD"}
} else {
    $diskType = ($disk | Where MediaType -ne "Unspecified" | Select -First 1).MediaType
}

Write-Host "Disk type detected:" $diskType

# ---------------------------
# Temp Cleanup
# ---------------------------

Write-Host "Cleaning temp folders..."
Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

# ---------------------------
# DISM Component Cleanup
# ---------------------------

Write-Host "Running DISM cleanup..."
DISM /Online /Cleanup-Image /StartComponentCleanup

# ---------------------------
# HDD Optimization
# ---------------------------

if ($diskType -eq "HDD") {
    Write-Host "HDD detected - disabling SysMain"
    Stop-Service SysMain -Force -ErrorAction SilentlyContinue
    Set-Service SysMain -StartupType Manual
}

# ---------------------------
# Power Plan
# ---------------------------

Write-Host "Setting High Performance power plan..."
powercfg -setactive SCHEME_MIN

# ---------------------------
# Remove Xbox bloat
# ---------------------------

Write-Host "Removing Xbox packages..."
Get-AppxPackage *xbox* | Remove-AppxPackage -ErrorAction SilentlyContinue

# ---------------------------
# SSD Optimization
# ---------------------------

if ($diskType -eq "SSD") {
    Write-Host "Running TRIM on SSD..."
    Optimize-Volume -DriveLetter C -ReTrim -ErrorAction SilentlyContinue
}

# ---------------------------
# Boot Time Info
# ---------------------------

Write-Host "Last boot performance event:"
Get-WinEvent -FilterHashtable @{LogName='System';ID=100} -MaxEvents 1 |
Select TimeCreated, Message

# ---------------------------
# Finish
# ---------------------------

Write-Host "Optimization completed."
Write-Host "Log file:" $log
Write-Host "Hardware report:" $hw

Stop-Transcript
