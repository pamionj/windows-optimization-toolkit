# 🛠 Troubleshooting — Windows Optimization Toolkit

Guía de resolución de problemas basada en escenarios reales encontrados durante soporte técnico en Windows 10 / 11.

Este documento complementa el workflow principal.

---

## 🟥 Caso 1 — Disco al 100% constantemente

### Síntomas

- PC extremadamente lento
- Task Manager muestra Disk 100%
- Arranque lento
- Aplicaciones congeladas

### Diagnóstico

- CrystalDiskInfo muestra HDD
- Estado puede ser Good o Caution

### Acción

- Desactivar SysMain
- Desactivar Windows Search
- Ejecutar optimize.ps1
- Informar al cliente que HDD limita rendimiento

### Recomendación

Migrar a SSD.

---

## 🟥 Caso 2 — CrystalDiskInfo muestra Caution o Bad

### Síntomas

- Lentitud
- Archivos corruptos
- Errores aleatorios

### Diagnóstico

SMART warnings activos.

### Acción

- Detener optimización
- Respaldar archivos críticos
- Informar al cliente

### Recomendación

Reemplazo inmediato del disco.

NO invertir tiempo en optimización.

---

## 🟥 Caso 3 — Temperaturas altas CPU (>85°C)

### Síntomas

- Apagados repentinos
- Throttling
- Bajo rendimiento

### Diagnóstico

HWiNFO muestra temperaturas elevadas.

### Acción

- No ejecutar stress
- Recomendar limpieza física interna
- Cambiar pasta térmica si corresponde

---

## 🟥 Caso 4 — Malware persistente

### Síntomas

- Publicidad reaparece
- Procesos desconocidos
- Navegador secuestrado

### Diagnóstico

ADWCleaner y HitmanPro siguen detectando amenazas.

### Acción

- Ejecutar nuevamente limpieza
- Defender Full Scan
- Si persiste: recomendar formateo

---

## 🟥 Caso 5 — optimize.ps1 falla al ejecutarse

### Síntomas

- Error ExecutionPolicy
- Script bloqueado

### Acción

Abrir PowerShell como administrador:

```powershell
Set-ExecutionPolicy Bypass -Scope Process
```
## 🟥 Caso 6 — optimize.ps1 no genera archivos

### Diagnóstico

Script ejecutado fuera de carpeta scripts.

### Acción
cd scripts
.\optimize.ps1


Confirmar creación:

- optimize_log.txt

- hardware_report.txt

## 🟥 Caso 7 — RAM constantemente al 90%+

### Síntomas

- Lags

- Congelamientos

- Swap frecuente

### Diagnóstico

Menos de 8GB RAM en Windows 10/11.

### Acción

- Reducir startup apps

- Optimizar visuales

### Recomendación

Upgrade a 8GB mínimo (16GB ideal).

## 🟥 Caso 8 — Cliente pide respaldo completo

### Riesgo

Posible traslado de malware.

### Acción

Respaldar solo:

- Documents

- Desktop

- Pictures

Nunca:

- AppData

- Program Files

- Descargas

## 🟥 Caso 9 — Windows inestable pero disco sano

### Síntomas

- Errores del sistema

- Pantallazos

- Servicios corruptos

### Acción

Ejecutar:

optimize.ps1

DISM (incluido en script)

Si continúa:

Recomendar formateo.

## 🟥 Caso 10 — Equipo mejora poco tras optimización

### Diagnóstico

Hardware limitado:

- HDD

- 4GB RAM

- CPU antiguo

### Acción

Explicar limitaciones técnicas.

### Recomendación

SSD + RAM.

---
## Limpieza y Optimización manual fina (Cuando el equipo es demasiado antiguo /se quiere optimizar lo más posible):

Limpieza:

W+R

cleanmgr
mrt para buscar virus con el antivirus nativo.
%temp%

Cmd Administrador:
sfc /scannow

### **Servicios que puedes desactivar:**

Experiencias de usuario conectadas y telemetría
Cliente de seguimiento de vínculos distribuidos
Geolocalización
Servicio Biometrico
Administración remota de Windows
Configuración de escritorio remoto
Administrador de mapas descargados
Xbox Game DVR y servicios relacionados
Administrador de pagos y NFC
Control parental
Datos de contactos
Diagnostic Execution service
Host de sistema de diagnóstico
Host del servicio de diagnóstico
Servicio de directiva de diagnóstico
Directiva de extracción de tarjetas inteligentes
Enrutamiento y acceso remoto
Hora de la red de telefonía movil
Fax (si no usas fax)
Windows Insider Service
Agente de conexión de red (si no usas Microsoft Store)
Extensiones y notificaciones de impresora (si no usas impresora)
cola de impresion
Print Spooler 
Acceso a datos de usuarios_37f581 manual
HP analytics service deshabilitado
redirector de puerto de escritorio remoto
Interfaz de servicio invitado de Hyper-V (si no usas máquina virtual o VM)
Windows Search (si no usas mucho la búsqueda)
Servicio telefónico
Servicio Volumetric Audio Compositor
Servidor
Para desactivar servicios:

Presiona Win + R
Escribe "services.msc"
Busca el servicio
Haz clic derecho → Propiedades
Cambia "Tipo de inicio" a "Manual" o "Deshabilitado"

### **Aplicaciones de inicio:**

Presiona Ctrl + Shift + Esc
Ve a la pestaña "Inicio"
Desactiva programas que no necesites iniciar con Windows

Configuración>privacidad> desactivar aplicaciones en segundo plano y practicamente todo lo de telemetria.
Configuración>accesibilidad>animaciones y transparencia off
rendimiento>personalizar>solo activo "Suavizar bordes para las fuentes de pantalla"
Configuración>Búsqueda Clásico y desactivar lo que no se necesita
Configuración>Juegos>Desactivar lo de game bar y capturas
Seguridad de Windows>Seguridad del dispositivo verificar que esté desactivado detalles de aislamiento del núcleo

Procesos en segundo plano que puedes limitar:

OneDrive (si no lo usas)
Teams (cuando no lo necesites)
Aplicaciones de terceros que se ejecutan automáticamente



https://old.reddit.com/r/Windows11/comments/zc36z2/brand_new_to_win11_id_be_thrilled_if_some_of_you/iyw4959/

In Settings:

Personalization > Background - don't use slideshow or Windows spotlight.

Personalization > Lock screen - don't get fun facts. No one wants fun facts.

Personalization > Taskbar - switch off everything you don't use.

Personalization > Device usage - turn off everything.

Apps > Installed apps - go down every app, select the 3-dot ... menu > Advanced options (where applicable) > set apps to never run in the background if you don't want them to, and/or uninstall what you don't want.

Apps > Advanced app settings > Share across devices - turn off if you don't do that.

Apps > Startup - turn off what you don't want starting with Windows. Leave the hardware apps on.

Accounts > Windows backup - turn that stuff off if you don't use it.

Time & language > Typing - go through everything there, turn off what you don't use or want.

Accessibility > Visual effects - always show scrollbars but turn off transparency and animation effects.

Accessibility > Hearing > Captions - turn off if you don't need or want them.

Privacy & security > Windows permissions and App permissions - go through all 32 categories and turn off everything you don't want or need.

Windows Update > Advanced options > Additional options > Delivery Optimization - turn it off.

Press Windows key + R > sysdm.cpl or Open: SystemPropertiesPerformance.exe > Visual Effects tab > set it like this.

Go through each category in Edge settings and turn off the things you don't need or want - if Edge is not your primary browser, turn off 'startup boost' and 'continue running background extensions and apps when Microsoft Edge is closed' in the System and performance section.

When setting up the machine for the first time, you have the option during the OOBE. "Only store files on this device". Select this if you're not planning on using OneDrive.

---

### 🧠 Principio técnico

No todos los PCs se pueden “salvar”.

Optimizar no reemplaza hardware.

La transparencia con el cliente es parte del trabajo profesional.

Fin del documento.
---