# Simulación Termo-mecánica



Este caso de estudio se centra en el **análisis de un freno de disco durante el frenado**, un fenómeno clásico donde la fricción genera calor (fenómeno térmico) que, a su vez, provoca la expansión y deformación del disco (fenómeno mecánico).

------



## Metodología de Simulación con Software Libre

Para llevar a cabo esta simulación se utiliza un flujo de trabajo que combina varias herramientas de código abierto:

- **FreeCAD:** Utilizado para la creación del modelo geométrico 3D de los componentes.
- **PrePoMax:** Una interfaz gráfica de usuario (GUI) que facilita la configuración del análisis de elementos finitos (FEA).
- **CalculiX:** El motor de cálculo subyacente que resuelve las ecuaciones termo-mecánicas de forma acoplada.



### 1. Modelo Geométrico y Pre-procesamiento

Primero, se crea el modelo 3D del freno de disco y las pastillas en **FreeCAD**. Es fundamental que las geometrías de los componentes en contacto estén correctamente definidas para modelar la fricción. El modelo se exporta a un formato compatible (como `STEP`) y luego se importa en **PrePoMax** para el pre-procesamiento.

En PrePoMax, se realiza el mallado de los componentes y se definen las propiedades del material. Para el disco (generalmente de hierro fundido) y las pastillas, es necesario especificar las siguientes propiedades:

- **Propiedades térmicas:** Conductividad térmica, calor específico y coeficiente de convección.
- **Propiedades mecánicas:** Módulo de Young, coeficiente de Poisson y **coeficiente de expansión térmica**.



### 2. Configuración de Cargas y Condiciones de Contorno

En esta etapa, se configuran las cargas que simulan el proceso de frenado:

- **Carga de Presión:** Se aplica una presión sobre las pastillas de freno para simular la fuerza de apriete.
- **Coeficiente de Fricción:** Se define un coeficiente de fricción entre las superficies de contacto del disco y las pastillas. Esta fricción es la principal fuente de generación de calor.
- **Velocidad Angular:** Se establece una velocidad de rotación inicial para el disco, la cual disminuirá a lo largo del tiempo de la simulación.
- **Condiciones Térmicas:** Se define la temperatura ambiente y las condiciones de convección en las superficies expuestas del disco, simulando el enfriamiento por aire.



### 3. Análisis Transitorio y Cálculos

El análisis se configura como **transitorio**, lo que permite estudiar la evolución del sistema a lo largo del tiempo. **CalculiX** resolverá las ecuaciones de forma acoplada, calculando en cada paso de tiempo:

- La cantidad de calor generada por la fricción.
- Cómo se propaga ese calor a través del material del disco.
- La expansión térmica y las deformaciones resultantes.
- Las tensiones mecánicas que surgen de la deformación.



### 4. Resultados y Post-procesamiento

Una vez que la simulación ha finalizado, los resultados se visualizan en **PrePoMax**. Es posible analizar y post-procesar la información para entender el comportamiento del sistema:

- **Distribución de Temperatura:** Se pueden generar mapas de colores para identificar las zonas del disco que alcanzan las temperaturas más altas.
- **Deformación:** Se visualiza cómo el disco se deforma debido a la expansión térmica, lo que puede influir en la eficacia del frenado.
- **Tensiones Mecánicas:** Se analiza la distribución de tensiones, un factor crítico para evaluar la integridad estructural y el riesgo de fallo por fatiga o agrietamiento.

Este ejemplo demuestra cómo la simulación termomecánica, utilizando software de código abierto, permite a los ingenieros y científicos predecir con precisión los fenómenos acoplados. La interacción entre el calor y la deformación es vital para diseñar sistemas de frenado que sean seguros y eficientes.