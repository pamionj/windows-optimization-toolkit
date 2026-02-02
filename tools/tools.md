# 🧰 External Tools

Este proyecto utiliza herramientas externas gratuitas (o freemium) portables para diagnóstico, limpieza y seguridad.

Ningún ejecutable se incluye en el repositorio.  
Solo se documentan las dependencias y su uso.

Todas las herramientas deben descargarse desde sus sitios oficiales.

---

## 🦠 Antimalware

### 🔹 ADWCleaner (Malwarebytes)

Especializado en:

- Adware
- Browser hijackers
- PUPs (Potentially Unwanted Programs)

Uso principal dentro del workflow:

Scan → Clean → Reboot

Se ejecuta como primera capa de limpieza.

Sitio oficial:

https://www.malwarebytes.com/adwcleaner

---

### 🔹 HitmanPro (Sophos)

Escáner secundario bajo demanda.

Detecta amenazas que Windows Defender puede pasar por alto.

Se utiliza después de ADWCleaner como segunda capa.

Sitio oficial:

https://www.hitmanpro.com

---

### Otros scáner antivirus portables:

🔹  **Kaspersky Virus Removal tool**

https://latam.kaspersky.com/downloads/free-virus-removal-tool

🔹 **Microsoft Safety Scanner (MSERT)**

https://learn.microsoft.com/en-us/defender-endpoint/safety-scanner-download

---

## 🧹 Limpieza del sistema

### BleachBit

Herramienta open-source para limpieza de:

- Cache del sistema
- Archivos temporales
- Cache de navegadores

Configuración recomendada:

Marcar:

- Cache
- Temp
- Browser cache

NO marcar:

- System files
- Wipe free space

Se ejecuta como administrador.

Sitio oficial:

https://www.bleachbit.org

---

## 🔍 Diagnóstico de hardware

### CrystalDiskInfo

Permite revisar el estado SMART del disco:

- 🟢 Good
- 🟡 Caution
- 🔴 Bad

Fundamental para decidir si continuar optimización o recomendar reemplazo.

Sitio oficial:

https://crystalmark.info/en/software/crystaldiskinfo/

---

### HWiNFO

Monitoreo avanzado de sensores:

- Temperaturas CPU / GPU
- Voltajes
- Estado térmico
- Throttling

Usado para detectar sobrecalentamiento y problemas físicos.

Sitio oficial:

https://www.hwinfo.com

---

## 🧠 Nota técnica

Estas herramientas se usan manualmente como parte del flujo documentado en:

docs/workflow.md

No están automatizadas dentro del script PowerShell por razones de seguridad y para mantener control humano del proceso.

---

Fin del documento.
