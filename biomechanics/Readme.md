#  Software libre Multifísica en Biomecánica

Existen varias alternativas de **software libre y de código abierto** que permiten abordar **fenómenos multifísicos en biomecánica**, es decir, acoplamiento entre mecánica estructural, fluidos, transporte, electromagnetismo, crecimiento tisular, etc.

A continuación se presentan algunas opciones destacadas:

---

### 1. **FEBio**
- **Enfoque**: Simulación biomecánica avanzada, especialmente para tejidos blandos, cartílago, hueso, interacción fluido-estructura, poroelasticidad, etc.
- **Multifísica**: Sí, con módulos para sólidos no lineales, multiphysics coupling (sólido-fluido, difusión-reacción, etc.).
- **Licencia**: BSD (software libre).
- **Interfaz**: Tiene una GUI llamada **FEBio Studio** (también libre), que incluye pre- y post-procesamiento.
- **Lenguaje de entrada**: XML (ficheros `.feb`).
- **Comunidad**: Muy activa en biomecánica computacional.
- **Web**: https://febio.org/

> Es probablemente la opción más especializada en biomecánica dentro del ecosistema de software libre.

---

### 2. **Code_Aster + Salome-Meca**
- **Enfoque**: Mecánica de sólidos, térmica, acústica, y ciertos acoplamientos multifísicos (termomecánico, poroelasticidad).
- **Multifísica**: Limitada en comparación con FEBio, pero poderosa en mecánica estructural no lineal.
- **Licencia**: GNU GPL (libre).
- **Interfaz**: Salome-Meca (entorno integrado de pre/post-procesamiento y ejecución).
- **Fortalezas**: Muy robusto en no linealidades geométricas y materiales complejos.
- **Limitación**: Menos específico en fenómenos biológicos (ej. crecimiento, remodelación, transporte en tejidos).
- **Web**: https://www.salome-platform.org/ y https://code-aster.org/

---

### 3. **MOOSE (Multiphysics Object-Oriented Simulation Environment)**
- **Enfoque**: Plataforma general para simulaciones multifísicas altamente acopladas.
- **Multifísica**: Altamente flexible; se han desarrollado módulos para biomecánica (crecimiento tumoral, mecanobiología, etc.).
- **Licencia**: LGPL (libre).
- **Lenguaje**: C++ (basado en objetos); se definen "kernels" para ecuaciones físicas.
- **Interfaz**: Requiere programación, aunque existen aplicaciones específicas como **BISON** (nuclear) o **RAT** (reactores); para biomecánica, normalmente se crea una aplicación a medida.
- **Web**: https://mooseframework.inl.gov/

> Es más adecuado si tienes capacidad de desarrollo o colaboras con un equipo de computación científica.

---

### 4. **Elmer FEM**
- **Enfoque**: Multifísica general: mecánica estructural, dinámica de fluidos, electromagnetismo, transferencia de calor, acústica.
- **Multifísica**: Sí, con acoplamientos predefinidos (FSI, termomecánico, etc.).
- **Licencia**: GPL.
- **Interfaz**: GUI integrada (ElmerGUI) y posibilidad de usar con Paraview.
- **Uso en biomecánica**: Menos común que FEBio, pero viable para problemas como flujo sanguíneo, interacción con paredes vasculares, etc.
- **Web**: https://www.csc.fi/elmer

---

### 5. **OpenFOAM**
- **Enfoque**: Dinámica de fluidos computacional (CFD), pero con capacidades estructurales y acoplamiento FSI.
- **Multifísica**: Sí, especialmente fluido-estructura (a través de módulos como **foam-extend** o **Precice**).
- **Licencia**: GPL.
- **Uso en biomecánica**: Muy usado en hemodinámica (flujo en aneurismas, válvulas cardíacas, etc.).
- **Limitación**: Menos intuitivo para sólidos no lineales complejos (como tejidos biológicos hiperelásticos).
- **Web**: https://openfoam.org/



