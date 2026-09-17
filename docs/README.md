# Perspectivas de mejora por proyecto

Este documento propone mejoras concretas para que la documentación evolucione desde apuntes y propuestas metodológicas hacia proyectos reproducibles. La prioridad sugerida es:

- **Alta:** necesaria para poder ejecutar, interpretar o verificar el contenido.
- **Media:** mejora la claridad, el aprendizaje o la mantenibilidad.
- **Baja:** mejora editorial o de contexto, pero no bloquea el uso.

## Teoría y contexto

### [Aerodinámica](../aerodynamics/Readme.md)

- **Alta:** añadir una ruta de aprendizaje y enlazar los casos CFD relacionados.
- **Media:** sustituir enlaces heterogéneos por referencias bibliográficas estables y verificables.
- **Media:** incorporar ejemplos cuantitativos, como número de Reynolds, coeficientes de sustentación y arrastre.

### [Física del efecto de succión y turbulencias](../aerodynamics/physics/Readme.md)

- **Alta:** distinguir con precisión entre presión, estela, separación y el uso simplificado del término “efecto Venturi”.
- **Alta:** justificar las recomendaciones de seguridad con normativa o estudios identificables.
- **Media:** añadir un esquema del flujo y definir las magnitudes que luego se usarán en los casos CFD.

### [Analogías entre sistemas dinámicos](../analogy/Readme.md)

- **Alta:** corregir las ecuaciones, la notación vectorial y los errores de formato matemático.
- **Media:** explicar el ámbito de validez de cada analogía y separar equivalencias exactas de comparaciones pedagógicas.
- **Baja:** añadir referencias introductorias y ejercicios para comprobar cada correspondencia.

### [Biomecánica](../biomechanics/Readme.md)

- **Alta:** añadir una tabla que relacione problema, datos de entrada, herramienta, salida y validación.
- **Media:** incluir un ejemplo reproducible, como análisis de marcha o poroelasticidad de un tejido.
- **Media:** especificar versiones, licencias y plataformas de las herramientas mencionadas.

### [Biomecánica deportiva y clínica](../biomechanics/sport_biomechanics/Readme.md)

- **Alta:** definir criterios de selección entre OpenSim, OpenCap, pyCGM2 y DeepLabCut.
- **Media:** documentar un conjunto de datos de ejemplo y un flujo mínimo de procesamiento.
- **Baja:** revisar el estado de proyectos antiguos y marcar cuáles siguen activos.

## Tutoriales ejecutables

### [Circuito RC con OpenModelica](../electric/SimpleRC/README.md)

- **Alta:** unificar el README con [SimpleRC.mo](../electric/SimpleRC/SimpleRC.mo) y [simulate.mos](../electric/SimpleRC/simulate.mos).
- **Alta:** documentar un comando de ejecución probado y el archivo de resultados esperado.
- **Media:** añadir la curva analítica $V_C(t)=V(1-e^{-t/(RC)})$ y una comprobación numérica.

### [Tanque con flujo en OpenModelica](../fluids/Readme.md)

- **Alta:** añadir el modelo `.mo` y un script `.mos` ejecutable desde el repositorio.
- **Alta:** documentar qué solver, tolerancia y versión de Modelica fueron utilizados.
- **Media:** controlar el caso de altura nula o negativa y comparar la solución con la expresión analítica.

### [Sistema masa-resorte con OpenModelica](../mechanics/mass-spring/README.md)

- **Alta:** corregir el listado de archivos generados y las referencias heredadas del ejemplo RC.
- **Alta:** añadir un script de simulación y un resultado de referencia para los parámetros por defecto.
- **Media:** incluir frecuencia natural, razón de amortiguamiento y un experimento de resonancia.

## Casos de estudio

### [Efectos aerodinámicos de un camión sobre un ciclista](../aerodynamics/case_1/Readme.md)

- **Alta:** incorporar geometrías, malla, condiciones de contorno y archivos de OpenFOAM.
- **Alta:** definir métricas, casos de validación y resultados esperados antes de ejecutar el acoplamiento dinámico.
- **Media:** justificar el modelo de turbulencia y documentar la rotación de ruedas y el movimiento del suelo.

### [Distancia segura para un ciclista](../aerodynamics/case_2/Readme.md)

- **Alta:** justificar el umbral del 80 % y definir cómo se obtiene $F_{lat,max}$.
- **Alta:** especificar una matriz de escenarios para velocidad, distancia, geometría y ángulo de adelantamiento.
- **Media:** añadir curvas de fuerza-tiempo y fuerza-distancia con incertidumbre y sensibilidad de malla.

### [Freno de disco termomecánico](../termomechanics/Readme.md)

- **Alta:** añadir geometría, materiales, malla, cargas y archivos de PrePoMax/CalculiX.
- **Alta:** documentar un balance energético y un estudio de convergencia reproducibles.
- **Media:** enlazar fuentes para las propiedades de los materiales y separar valores orientativos de valores usados.

## Documentación de software

### [Bullet Physics](../software/bullet_physics/Readme.md)

- **Alta:** reemplazar el ejemplo C++ incompleto por un programa compilable y un `CMakeLists.txt` mínimo.
- **Media:** verificar los nombres de paquetes Linux, las versiones y las integraciones descritas.
- **Baja:** reducir la lista de enlaces y conservar únicamente referencias oficiales o técnicamente relevantes.

### [MOOSE](../software/mooseframework/Readme.md)

- **Alta:** completar la instalación con clonado, configuración, compilación y ejecución de una aplicación de ejemplo.
- **Alta:** indicar versiones compatibles de Conda, compilador, MPI y PETSc.
- **Media:** enlazar una aplicación MOOSE concreta que demuestre un acoplamiento multifísico.

### [Project Chrono](../software/openchrono/Readme.md)

- **Alta:** separar instalación básica de módulos opcionales como CUDA, GPU y visualización.
- **Alta:** añadir un ejemplo mínimo de compilación y ejecución posterior a la instalación.
- **Media:** documentar compatibilidad entre CUDA, GCC, CMake y la GPU disponible.

### [OpenModelica](../software/openmodelica/README.md)

- **Alta:** completar los pasos de instalación del README o enlazar explícitamente al script de instalación.
- **Alta:** corregir y probar el comando de verificación integral y sus resultados esperados.
- **Media:** aclarar las diferencias entre Debian, Ubuntu, Zorin y Deepin, y fijar una versión soportada.

### [PrePoMax](../software/PrePoMax/Readme.md)

- **Alta:** terminar la edición y retirar artefactos de enlaces o referencias incompletas.
- **Media:** añadir un caso mínimo con geometría, malla, CalculiX y visualización de resultados.
- **Media:** indicar la versión de Windows, .NET Framework y la versión de CalculiX probadas.

### [ReactPhysics3D](../software/reactphysics3d/Readme.md)

- **Alta:** corregir los bloques de shell y probar la secuencia completa de CMake.
- **Alta:** añadir un ejemplo mínimo que cree un `PhysicsWorld`, un cuerpo y ejecute varios pasos.
- **Media:** distinguir dependencias de la biblioteca de dependencias necesarias únicamente para el testbed.

## Mejoras transversales

1. Añadir una plantilla común con requisitos, instalación, ejecución, resultados esperados, validación y limitaciones.
2. Fijar versiones de software y registrar el sistema operativo utilizado.
3. Mantener ejemplos ejecutables junto al README y añadir una prueba rápida para cada uno.
4. Revisar enlaces, ortografía, notación matemática y nombres de archivos.
5. Añadir una sección de estado: `conceptual`, `en desarrollo`, `ejecutable` o `validado`.