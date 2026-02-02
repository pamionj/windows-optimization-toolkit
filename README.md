# 🧰 Windows Optimization Toolkit (Win10 / Win11)

Toolkit personal de diagnóstico inicial, limpieza y optimización segura para equipos con Windows 10 y 11.

Este proyecto está orientado como laboratorio práctico de soporte técnico y automatización IT Support / Junior SysAdmin.

Incluye un script PowerShell profesional más documentación de workflow, checklist y troubleshooting.

---

## 🎯 Objetivo

Proveer un flujo repetible para:

- Diagnosticar problemas comunes de rendimiento
- Detectar automáticamente HDD / SSD
- Verificar RAM instalada
- Limpiar archivos temporales
- Ejecutar limpieza DISM
- Aplicar optimizaciones seguras
- Ejecutar TRIM en SSD
- Realizar escaneo de malware con herramientas portables
- Generar logs y reportes de hardware
- Documentar resultados

Todo usando herramientas gratuitas y/o portables.

---

## ✅ Características principales del script — optimize.ps1

- Compatible Windows 10 / 11
- Detección automática HDD / SSD
- Detección de RAM (<8GB warning)
- Creación de punto de restauración
- Limpieza de carpetas temporales
- DISM Component Cleanup
- Desactivación de SysMain solo en HDD
- Activación plan Alto Rendimiento
- TRIM automático en SSD
- Eliminación básica de Xbox bloatware
- Exportación de hardware report
- Medición básica de último boot
- Log completo del proceso

El script NO:

❌ toca el registro  
❌ desactiva Windows Defender  
❌ realiza debloat agresivo  
❌ borra archivos personales  

---


## 📁 Estructura del repositorio

````text
windows-optimization-toolkit/
│
├── README.md
├── scripts/
│   └── optimize.ps1
│
├── tools/
│   └── tools.md
│
└── docs/
    ├── workflow.md
    ├── checklist.md
    └── troubleshooting.md


````
---
## 🛠 Herramientas utilizadas

### 🔹 CrystalDiskInfo

Verificación SMART del disco:

- 🟢 Good
- 🟡 Caution
- 🔴 Bad

---

### 🔹 HWiNFO

Chequeo de temperaturas CPU/GPU.

---
### 🛡️ Herramientas de detección y limpieza de malware
Este toolkit usa enfoque profesional: antivirus integrado + escáneres de segunda opinión portables.

🔹 Microsoft Defender (integrado)
Primer escaneo siempre:

Windows Security → Virus & Threat Protection → Full Scan
También se recomienda Offline Scan en casos sospechosos.

🔹 Microsoft Safety Scanner (MSERT)
Escáner portable oficial de Microsoft.

Uso típico:

msert.exe → Full Scan
Ideal cuando el sistema podría estar comprometido. Se puede correr desde USB y entorno de recuperación

### 🔹 AdwCleaner

Elimina adware, PUPs y spyware.

Uso:

Scan → Clean → Reboot

Muy efectivo contra publicidad y navegadores infectados.

### 🔹 HitmanPro

Escaneo completo.

Detecta amenazas que otros antivirus pueden pasar por alto

🔹 ESET Online Scanner
Escáner bajo demanda con motor ESET.

Excelente como segunda opinión:

Run → Full Scan → Clean detected threats

🔹 ClamAV / ClamWin (open-source)
Antivirus open-source para Windows.

Útil como escáner adicional, no reemplaza motores comerciales modernos.

🔹 Kaspersky Virus Removal Tool (KVRT)

Otra opción portable bastante potente.

🔹 Herramientas complementarias
Autoruns (Sysinternals): revisión de startup sospechoso

TDSSKiller / GMER: detección de rootkits (casos avanzados)

---
## 🧹 Limpieza del sistema

### Se utiliza BleachBit portable.

Opciones seguras:

- Cache

- Temp

- Browser cache

Más lento:

- System files

- Wipe free space

## ▶️ Uso del Script de optimización — optimize.ps1

 1. Abrir PowerShell como Administrador

### 2. Permitir ejecución temporal:

```powershell
Set-ExecutionPolicy Bypass -Scope Process
```

### 3. Ejecutar el script:

```powershell
cd scripts
.\optimize.ps1
```

## 📦 Archivos generados

Después de ejecutar el script:

````text
scripts/
├── optimize_log.txt
└── hardware_report.txt
````
optimize_log.txt → log completo del proceso

hardware_report.txt → información detallada del sistema

Estos archivos sirven como evidencia del trabajo realizado.

## 🧭 Flujo de trabajo

El proceso completo está documentado en el [manual de flujo de trabajo](docs/workflow.md).

Resumen:

1. Preparación y seguridad USB

2. Diagnóstico hardware

3. Limpieza malware

4. Limpieza sistema

5. Optimización (script)

6. Validación

7. Recomendaciones


🚨 **Cuándo recomendar formateo**

Solo si:

- Malware persistente

- Windows inestable

- Archivos del sistema corruptos

- Cliente acepta respaldo + reinstalación

- Disco está sano

---

📋 **Checklist técnico**

Disponible en: [checklist](docs/checklist.md).

Incluye:

- hardware

- malware

- limpieza

- optimización

- validación final

---

## 🛠 Casos reales

Escenarios técnicos documentados en:

[troubleshooting](docs/troubleshooting.md)

Incluye:

- disco al 100%

- SMART warnings

- temperaturas altas

- malware persistente

- fallas del script

- RAM insuficiente

- cuándo formatear
---

**Importante**

Este toolkit:

NO reemplaza hardware defectuoso

NO intenta “salvar” discos dañados

prioriza diagnóstico antes de optimización

evita respaldos inseguros

documenta cada paso

---

## 📌 Disclaimer

Este toolkit está diseñado para uso educativo y portfolio personal.

No está pensado para despliegues masivos ni ambientes empresariales.

Usar bajo responsabilidad del operador.

---

## 👤 Autor

**Pablo Amion**  
Ingeniería Informática | Cybersecurity, QA & Automation Enthusiast  

---

📄 Licencia

MIT

Uso educativo y profesional permitido.