# La Multifísica

La **multifísica** es un campo de la ingeniería y la ciencia que estudia la interacción de múltiples fenómenos físicos de diferentes dominios. En lugar de analizar cada fenómeno por separado (como la mecánica de fluidos o la transferencia de calor de forma aislada), la multifísica se centra en cómo estos fenómenos se influyen mutuamente, regularmente en **diferentes escalas**. 

---

## Conceptos Clave y Ejemplos

En la mayoría de los casos, la multifísica se aborda a través de la **simulación numérica** y el empleo de múltiples **métodos y técnicas**, ya que las interacciones complejas suelen ser difíciles de resolver analíticamente. Algunos ejemplos comunes de acoplamientos multifísico:

* **Termo-mecánica:** Estudia la interacción entre la temperatura y la deformación de un material. Por ejemplo, cómo el calentamiento de un motor diésel provoca la expansión térmica de sus componentes y los esfuerzos resultantes.
* **Termo-fluidodinámica:** Analiza la interacción entre el flujo de fluidos y la transferencia de calor. Esto es crucial en el diseño de intercambiadores de calor, sistemas de refrigeración de motores, y en la aerodinámica de aviones donde el calentamiento por fricción es significativo.
* **Electromecánica:** Combina la electricidad y la mecánica. Un ejemplo clásico es un motor eléctrico, donde los campos magnéticos creados por la corriente eléctrica generan un par de torsión que provoca el movimiento mecánico. Otro ejemplo es la vibración de un altavoz, donde las señales eléctricas mueven un diafragma que produce sonido.
* **Aeroelasticidad:** Es la interacción entre las fuerzas aerodinámicas (el aire que fluye sobre un ala), las fuerzas inerciales (la masa del ala) y las fuerzas elásticas (la rigidez del ala). Este fenómeno es crucial en el diseño de aeronaves para prevenir la fatiga de materiales y la resonancia.
* **Electro-química:** Estudia la relación entre la corriente eléctrica y las reacciones químicas, fundamental para el diseño de baterías, celdas de combustible y procesos de corrosión.

---

## Aplicaciones de la Multifísica

La comprensión de la multifísica es vital en el diseño y la optimización de una amplia gama de productos y sistemas en diversas industrias:

* **Industria aeroespacial:** Diseño de motores de cohetes, análisis de fatiga en alas de aviones y simulación de la reentrada atmosférica.
* **Automoción:** Simulación de la combustión en motores, diseño de sistemas de refrigeración y análisis de baterías en vehículos eléctricos.
* **Electrónica:** Diseño de sistemas de disipación de calor para chips, análisis de MEMS (sistemas microelectromecánicos) y modelado de transductores.
* **Medicina:** Diseño de stents, simulación del flujo sanguíneo, y análisis de implantes ortopédicos.
* **Energía:** Diseño de turbinas eólicas, reactores nucleares, y celdas de combustible.

En esencia, la multifísica permite predecir y optimizar el rendimiento de sistemas complejos de una manera mucho más precisa que si se analizaran los fenómenos por separado.

---

## Índice de proyectos

Los contenidos del repositorio se organizan en cuatro tipos. La clasificación indica el propósito principal del README actual; un proyecto puede evolucionar posteriormente hacia otra categoría.

### Teoría y contexto

- [Aerodinámica](aerodynamics/Readme.md): conceptos, aplicaciones y textos de referencia.
- [Física del efecto de succión y turbulencias](aerodynamics/physics/Readme.md): contexto físico y recomendaciones para ciclistas.
- [Analogías entre sistemas dinámicos](analogy/Readme.md): comparación entre mecánica, fluidos y electricidad.
- [Biomecánica](biomechanics/Readme.md): fundamentos, aplicaciones y software libre.
- [Biomecánica deportiva y clínica](biomechanics/sport_biomechanics/Readme.md): herramientas para movimiento, señales y análisis clínico.

### Tutoriales ejecutables

- [Circuito RC con OpenModelica](electric/SimpleRC/README.md): modelo Modelica y script de simulación.
- [Tanque con flujo en OpenModelica](fluids/Readme.md): tutorial de modelado y simulación de un tanque.
- [Sistema masa-resorte con OpenModelica](mechanics/mass-spring/README.md): modelo con amortiguamiento y fuerza sinusoidal.

### Casos de estudio

- [Efectos aerodinámicos de un camión sobre un ciclista](aerodynamics/case_1/Readme.md): propuesta de CFD acoplada con dinámica.
- [Distancia segura para un ciclista](aerodynamics/case_2/Readme.md): estudio paramétrico de fuerza lateral y estabilidad.
- [Freno de disco termomecánico](termomechanics/Readme.md): flujo FreeCAD, PrePoMax y CalculiX.

### Documentación de software

- [Bullet Physics](software/bullet_physics/Readme.md): motor de física 3D y guía de instalación.
- [MOOSE](software/mooseframework/Readme.md): framework para aplicaciones multifísicas con elementos finitos.
- [Project Chrono](software/openchrono/Readme.md): simulación mecánica, vehículos, GPU y PyChrono.
- [OpenModelica](software/openmodelica/README.md): instalación y pruebas de OMShell y `omc`.
- [PrePoMax](software/PrePoMax/Readme.md): pre y postprocesador para CalculiX.
- [ReactPhysics3D](software/reactphysics3d/Readme.md): motor de cuerpos rígidos y detección de colisiones.

## Mejoras de documentación

Las oportunidades de mejora de cada proyecto están reunidas en [docs/README.md](docs/README.md). El documento distingue entre contenido conceptual, tutoriales reproducibles, casos de estudio y fichas de software.
