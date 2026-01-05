

# Biomecánica deportiva y clínica

Más allá del análisis multifísico avanzado, en **biomecánica deportiva y clínica** el enfoque suele estar en la **cinemática y cinética del movimiento humano**, el **procesamiento de señales fisiológicas** (EMG, fuerza, presión plantar, etc.) y la **visualización/retroalimentación para el entrenamiento o rehabilitación**. Para estos fines, existen varias herramientas de **software libre y de código abierto** que han ganado relevancia en entornos académicos, clínicos y de investigación.

Aquí se presentan las más relevantes:

---

### 1. **OpenCap**
- **Propósito**: Reconstrucción 3D del movimiento humano a partir de videos de teléfonos móviles (usando visión por computadora y modelos musculoesqueléticos).
- **Ámbito**: Biomecánica clínica y del deporte (análisis de marcha, salto, sentadilla, etc.).
- **Tecnología**: Combina **OpenPose** (detección de poses) con el modelo **OpenSim**.
- **Licencia**: MIT (libre).
- **Relevancia**: Permite análisis 3D sin laboratorio, ideal para contextos con recursos limitados.
- **Web**: https://www.opencap.ai/

> Es una herramienta emergente y muy prometedora, desarrollada en la Universidad de Stanford, con enfoque en accesibilidad y democratización del análisis biomecánico.

---

### 2. **OpenSim**
- **Propósito**: Simulación y análisis de la dinámica musculoesquelética humana.
- **Funcionalidades**: Cálculo de fuerzas articulares, activación muscular, análisis inverso/directo, optimización de control neuromuscular.
- **Entrada**: Puede usar datos de marcadores de movimiento (Motion Capture) o integrarse con OpenCap.
- **Licencia**: Apache 2.0 (libre y de código abierto).
- **Interfaz**: GUI amigable + API en Python/MATLAB.
- **Uso**: Muy extendido en biomecánica clínica (ej. cirugía ortopédica, parálisis cerebral) y deportiva (optimización del rendimiento).
- **Web**: https://opensim.stanford.edu/

> Es, sin duda, la plataforma más consolidada en biomecánica del movimiento humano dentro del software libre.

---

### 3. **Mokka (Movement and Clinical Kinematics Analysis)**
- **Propósito**: Visualización y análisis de datos de captura de movimiento (C3D, etc.).
- **Características**: Permite visualizar trayectorias, ángulos articulares, gráficos temporales.
- **Licencia**: GPL (libre).
- **Desarrollo**: Menos activo en los últimos años, pero aún funcional.
- **Web**: https://biomechanics.stanford.edu/mokka/ (archivo histórico)

> Aunque su desarrollo se ha ralentizado, sigue siendo útil para enseñanza y análisis básico de datos de laboratorio.

---

### 4. **pyCGM2**
- **Propósito**: Procesamiento de datos de gait (marcha) y análisis clínico según protocolos estandarizados (Helen Hayes, etc.).
- **Base**: Python.
- **Licencia**: GPL.
- **Fortalezas**: Altamente modular, orientado a laboratorios clínicos de análisis de la marcha.
- **Integración**: Puede exportar a OpenSim, generar reportes clínicos, calibrar modelos.
- **Web**: https://github.com/pyCGM2/pyCGM2

> Es una excelente opción si trabajas en entornos universitarios o hospitalarios que requieren reproducibilidad y adaptación a protocolos locales.

---

### 5. **BioSig** y **SigUtil** (para procesamiento de señales)
- **BioSig**: Librería para procesamiento de señales biomédicas (EMG, EEG, ECG, fuerza, etc.), con soporte en MATLAB, Octave y Python.
- **Licencia**: GPL.
- **Web**: http://biosig.sourceforge.net/
- **SigUtil**: Herramientas complementarias en Python para EMG y cinética.

> Útiles si combinas análisis de movimiento con activación muscular o fuerzas de reacción en el suelo.

---

### 6. **DeepLabCut** (aunque no es exclusivo de biomecánica)
- **Propósito**: Tracking de puntos anatómicos en video usando redes neuronales (deep learning).
- **Licencia**: BSD (libre).
- **Aplicación**: Muy usado en investigación del movimiento animal y humano en entornos no controlados.
- **Web**: https://www.deeplabcut.org/

> No es un "software de biomecánica" per se, pero es una herramienta clave para obtener datos cinemáticos sin marcadores, ideal para estudios en campo (deporte real, terapia domiciliaria, etc.).

---

### Recomendaciones generales

Estas herramientas —especialmente **OpenSim**, **OpenCap** y **pyCGM2**— representan más que alternativas técnicas: son **infraestructuras comunes del conocimiento**, desarrolladas en entornos académicos con lógicas colaborativas, que permiten **descentralizar el acceso al análisis biomecánico** y **fortalecer la autonomía científica** en universidades públicas.

Además, su naturaleza abierta permite **modificar, auditar y adaptar** los algoritmos a necesidades locales (por ejemplo, modelos antropométricos propios, protocolos clínicos regionales o integración con sensores de bajo costo), algo fundamental en contextos donde los paquetes comerciales (Vicon, Qualisys, Nexus, etc.) son prohibitivos o cerrados.
