# Project Chrono y su motor de física.

Project Chrono es un **paquete de simulación multifísica de alto rendimiento, de código abierto y multiplataforma**. Está diseñado para modelar y simular sistemas mecánicos complejos, robótica, interacción vehículo-terreno, dinámica de cuerpos flexibles y más, con un enfoque en la precisión a nivel de ingeniería.

## Características Principales

El núcleo de Project Chrono es la biblioteca **Chrono::Engine**, que se implementa principalmente en **C++**, pero cuenta con interfaces para otros lenguajes:

- **Multicuerpos Rígidos (Multibody Dynamics):** Permite simular mecanismos complejos compuestos de cuerpos rígidos conectados mediante una amplia gama de articulaciones (joints), motores y actuadores.
- **Dinámica Multifísica:** No se limita solo a cuerpos rígidos. Puede modelar y simular:
  - **Cuerpos Deformables/Flexibles (FEA):** Utilizando el Método de Elementos Finitos (FEA) para simular vigas, cascarones, cables y sólidos con grandes deformaciones.
  - **Interacción Fluido-Sólido (FSI):** Para simular escenarios donde hay acoplamiento entre fluidos y estructuras.
  - **Dinámica Granular:** Simulación de sistemas con un gran número de partículas (como arena o grava), a menudo utilizando paralelización en **GPU** (por ejemplo, con Chrono::Gpu).
- **Detección de Colisiones y Contacto:** Utiliza algoritmos avanzados para calcular fuerzas de contacto y fricción entre geometrías complejas. Utiliza integradores de dinámica no suave (Non-Smooth Dynamics) para un manejo robusto y rápido de los contactos.
- **Simulación de Vehículos (Chrono::Vehicle):** Ofrece módulos especializados para el modelado y simulación detallada de vehículos con ruedas o de oruga, incluyendo la interacción con el suelo y diferentes modelos de neumáticos.
- **Robótica e Inteligencia Artificial:** Se puede integrar con marcos de **IA** basados en Python (como TensorFlow) para tareas de **Deep Reinforcement Learning (Aprendizaje por Refuerzo Profundo)**, permitiendo entrenar a robots simulados.

## Entorno y Usabilidad

- **Lenguajes:** Originalmente en **C++**, pero su capa **PyChrono** es muy popular. **PyChrono** es un *wrapper* de la biblioteca C++ que permite a los usuarios acceder a todas las funcionalidades desde **Python**, integrándose con otras bibliotecas de Python como NumPy y Matplotlib. También ofrece una API en C#.
- **Licencia:** Es de **código abierto** y se distribuye bajo una licencia permisiva **BSD-3**, lo que facilita su uso e integración en proyectos académicos e industriales.
- **Rendimiento:** Está diseñado para el alto rendimiento, con partes del código que pueden ejecutarse en **GPU**, CPUs multinúcleo y arquitecturas de memoria distribuida a través de **MPI** para simulaciones a gran escala.

## Aplicaciones

Project Chrono se utiliza en una amplia gama de áreas de ingeniería y ciencia:

- **Robótica:** Diseño y prueba de robots articulados y bípedos.
- **Ingeniería Automotriz:** Simulación detallada de la dinámica de vehículos, incluyendo la interacción con el suelo. Es utilizado por entidades como el **Ejército de EE. UU.** para simular vehículos con ruedas y orugas.
- **Investigación Científica:** Dinámica de materiales granulares, biomecánica y sistemas mecánicos complejos.
- **Exploración Espacial:** Se ha utilizado en proyectos patrocinados por la **NASA** para simular rovers (como el rover VIPER para la misión lunar).

## Historia

La primera versión de Chrono::Engine fue desarrollada en **1998** por el **Prof. Alessandro Tasora** en el Politécnico de Milán. Con el tiempo, se convirtió en un proyecto colaborativo, con el **Simulation-Based Engineering Lab (SBEL)** de la Universidad de Wisconsin-Madison, liderado por el Prof. Dan Negrut, desempeñando un papel clave en su desarrollo y expansión, especialmente en el manejo de contactos friccionales grandes.