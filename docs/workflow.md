# 🔄 Workflow Técnico — Windows Optimization Toolkit

Este documento describe el procedimiento estándar para diagnóstico, limpieza, optimización y validación de PCs con Windows 10 / 11.

Está diseñado para uso en soporte técnico presencial y como laboratorio práctico IT Support.

Objetivo:

- Mantener un proceso ordenado
- Minimizar riesgos
- Evitar infecciones cruzadas
- Documentar resultados
- Aplicar solo optimizaciones seguras

---

# 🛑 REGLA DE ORO (ANTES DE TODO)

NUNCA conectes tu pendrive antes de desactivar reproducción automática.

En el PC del cliente:

### Opción ideal (si existe):

Win + R → gpedit.msc
Computer Configuration → Administrative Templates → Windows Components → AutoPlay Policies → Disable AutoPlay

---

### Opción mínima:

Configuración → Dispositivos → Reproducción automática → DESACTIVAR


Esto previene infecciones automáticas desde USB.

Conecta el pendrive manteniendo presionada la tecla SHIFT.

---

# 🧭 Visión general del flujo

Preparación y seguridad USB
↓
Diagnóstico inicial
↓
Chequeo hardware
↓
Limpieza malware
↓
Limpieza sistema
↓
Optimización (script)
↓
Validación
↓
Recomendaciones


---

# 🧪 FASE 1 — Diagnóstico inicial (15–20 min)

Primero entender el problema antes de tocar nada.

Preguntar directamente:

- ¿Qué problema tiene exactamente?

Identificar síntomas:

- Lento
- Se congela
- Pantallazos
- Publicidad
- Internet lento
- Juegos con bajo rendimiento
- Arranque lento

Registrar mentalmente o por escrito.

---

## 1️⃣ Revisión hardware (CRÍTICO)

### Disco — CrystalDiskInfo

Estados:

🟢 Good  
🟡 Caution  
🔴 Bad  

Si es amarillo o rojo:

- Disco en falla
- Informar al cliente
- NO continuar optimización
- Recomendar reemplazo

---

### Temperaturas — HWiNFO

Valores normales:

- CPU idle < 50°C
- CPU carga < 85°C

Si están altos:

- Probable acumulación de polvo
- Recomendar limpieza física

---

## 2️⃣ Uso de recursos — Task Manager

Abrir:

Ctrl + Shift + Esc


Revisar:

- Startup impact
- RAM usage
- Disk usage

Si disco está al 100% constantemente:

- HDD lento o degradado
- Anotar observación

---

# 🦠 FASE 2 — Limpieza malware (OBLIGATORIA)

Incluso si el usuario dice que “no tiene virus”.

Orden exacto:

---

### 1. ADWCleaner

Scan → Clean → Reboot


---

### 2. HitmanPro

Escaneo completo.

Detecta amenazas que Defender no siempre ve.

---

### 3. Windows Defender Full Scan

Windows Security → Virus & Threat Protection → Full Scan

---

# 🧹 FASE 3 — Limpieza del sistema

Recién después del malware.

---

### BleachBit (como administrador)

Seleccionar solo:

✅ Cache  
✅ Temp  
✅ Browser cache  

NO marcar:

❌ System files  
❌ Wipe free space  

---

# 🚀 FASE 4 — Optimización del sistema

### 🔹 Momento de ejecutar el script

Desde PowerShell como administrador:

```powershell
Set-ExecutionPolicy Bypass -Scope Process
cd scripts
.\optimize.ps1
```

El script realiza:

Restore point

Limpieza temp

DISM cleanup

Detección HDD / SSD

SysMain solo HDD

TRIM SSD

RAM check

Hardware report

Boot info

Log del proceso

Genera:

scripts/optimize_log.txt
scripts/hardware_report.txt

---

**Optimización visual (manual)**

Sistema → Configuración avanzada → Rendimiento:

Ajustar para mejor rendimiento

Reactivar suavizado de fuentes

---

**Servicios (solo si HDD)**
Win + R → services.msc


Poner en Manual:

SysMain

Windows Search

---
**Startup apps**

Desde Task Manager:

Deshabilitar:

Updaters

Launchers

Adobe helpers

Edge updater

---

# 📦 FASE 5 — Eliminación de software basura

Configuración → Apps

Desinstalar:

Antivirus de prueba (McAfee, Avast, etc.)

Toolbars

Launchers innecesarios

Software desconocido

---

# 💾 FASE 6 — Backup (SOLO si es necesario)

Respaldar únicamente:

- Documents

- Desktop

- Pictures

NO copiar:

- AppData

- Program Files

- Descargas

Evita arrastrar malware.

---

🚨 Cuándo recomendar formateo

Solo si:

- Malware reaparece

- Sistema corrupto con disco sano

- Windows no arranca

- Cliente autoriza

---

# ✅ FASE 7 — Validación final

Reiniciar el equipo.

Verificar:

- Tiempo de arranque

- Uso CPU / RAM / Disco

- Ausencia de ventanas emergentes

- Respuesta general del sistema

Comparar con estado inicial.

---

## 📄 Entrega de recomendaciones

Informar al cliente:

- Estado del disco

- Temperaturas

- RAM instalada

- Software eliminado

- Mejoras aplicadas

Recomendar si corresponde:

- Cambio a SSD

- Aumento RAM

- Limpieza física

- Backups periódicos

---

🧠 Flujo resumido profesional

Diagnóstico hardware
↓
Malware cleanup
↓
Limpieza sistema
↓
Optimización (script)
↓
Prueba rendimiento
↓
Recomendaciones

---
Fin del workflow.
