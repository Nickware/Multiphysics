# termo-mecánica

Es una rama de la multifísica que se dedica a estudiar la estrecha relación entre los estados térmicos (temperatura) y la respuesta mecánica (deformación, tensiones, fatiga) de un sistema. En el mundo de la ingeniería, rara vez un sólido experimenta cambios de temperatura sin que esto altere sus dimensiones o su integridad estructural.

### El Corazón de la Termo-mecánica: El Acoplamiento

Lo que hace que la termo-mecánica sea una disciplina de "multifísica" es el **acoplamiento bidireccional**:

1. **Efecto Térmico sobre la Mecánica:** La mayoría de los materiales se expanden al calentarse y se contraen al enfriarse. Si esta expansión está restringida (por ejemplo, una viga empotrada entre dos paredes), se generan **tensiones térmicas** masivas que pueden superar la resistencia del material y causar deformaciones permanentes o fracturas.
2. **Efecto Mecánico sobre lo Térmico:** La deformación plástica (cuando un metal se deforma más allá de su límite elástico) genera calor interno. Además, los cambios en la geometría del componente debido a la carga mecánica pueden alterar su capacidad para disipar calor, cambiando así su distribución de temperatura.

---

### Factores Determinantes

Para modelar estos sistemas, los ingenieros deben considerar tres parámetros físicos fundamentales que definen el comportamiento de los materiales:

* **Coeficiente de Expansión Térmica ($\alpha$):** Indica cuánto se dilata el material por cada grado de incremento de temperatura. Es el responsable directo de las deformaciones geométricas.
* **Conductividad Térmica ($k$):** Determina qué tan rápido se mueve el calor a través del sólido. Un material con baja conductividad tendrá grandes gradientes térmicos (partes muy calientes cerca de una fuente y partes frías lejos), lo cual es el "caldo de cultivo" para el **choque térmico**.
* **Módulo de Young ($E$):** La rigidez del material. A medida que la temperatura aumenta, la mayoría de los materiales pierden rigidez ($E$ disminuye), lo que los hace más propensos a fallar bajo cargas mecánicas.
---

### Aplicaciones de la Termo-mecánica

Esta rama es crítica en industrias donde el calor extremo es parte del funcionamiento normal:

* **Motores de Combustión y Turbinas:** Las palas de una turbina de gas operan a temperaturas altísimas mientras rotan a altas velocidades. El análisis termo-mecánico es necesario para asegurar que la expansión térmica no haga que las palas toquen la carcasa del motor.
* **Electrónica de Potencia:** Los procesadores y chips se calientan y enfrían constantemente. La diferencia de expansión térmica entre los componentes electrónicos (silicio) y la placa de circuito (cobre/fibra de vidrio) provoca que las soldaduras fallen con el tiempo por **fatiga térmica**.
* **Diseño de Frenos:** Como se discutió anteriormente, la fricción entre la pastilla y el disco genera un pico de calor súbito. Si el disco no puede disipar el calor o acomodar la expansión térmica, se deforma (frenado con vibración) o se agrieta.
* **Estructuras Aeroespaciales:** Durante la reentrada atmosférica, el rozamiento con el aire genera temperaturas extremas. La estructura debe mantenerse íntegra mecánicamente a pesar de la drástica reducción de resistencia del material causada por el calor.

### ¿Por qué es un desafío de simulación?

Resolver esto manualmente es casi imposible debido a que las ecuaciones diferenciales están **acopladas**: la solución de la parte térmica depende de la geometría mecánica, y la geometría mecánica depende de la solución térmica.

Por ello, se utilizan softwares de **elementos finitos (FEA)** que resuelven iterativamente ambos problemas en pequeños pasos de tiempo, asegurando que, al final de cada iteración, el campo de temperaturas y el campo de deformaciones sean físicamente coherentes entre sí.

# Simulación Termo-mecánica

Este caso de estudio se centra en el **análisis de un freno de disco durante el frenado**, un fenómeno clásico donde la fricción genera calor (fenómeno térmico) que, a su vez, provoca la expansión y deformación del disco (fenómeno mecánico).

## Metodología de Simulación con Software Libre

Para llevar a cabo esta simulación se utiliza un flujo de trabajo que combina varias herramientas de código abierto:

- **FreeCAD:** Utilizado para la creación del modelo geométrico 3D de los componentes.
- **PrePoMax:** Una interfaz gráfica de usuario (GUI) que facilita la configuración del análisis de elementos finitos (FEA).
- **CalculiX:** El motor de cálculo subyacente que resuelve las ecuaciones termo-mecánicas de forma acoplada.



### 1. Modelo Geométrico y Preprocesamiento

Primero, se crea el modelo 3D del freno de disco y las pastillas en **FreeCAD**. Es fundamental que las geometrías de los componentes en contacto estén correctamente definidas para modelar la fricción. El modelo se exporta a un formato compatible (como `STEP`) y luego se importa en **PrePoMax** para el preprocesamiento.

En PrePoMax, se realiza el mallado de los componentes y se definen las propiedades del material. Para el disco (generalmente de hierro fundido) y las pastillas, es necesario especificar las siguientes propiedades:

- **Propiedades térmicas:** conductividad térmica, calor específico y coeficiente de convección.
- **Propiedades mecánicas:** módulo de Young, coeficiente de Poisson y **coeficiente de expansión térmica**.



### 2. Configuración de Cargas y Condiciones de Contorno

En esta etapa, se configuran las cargas que simulan el proceso de frenado:

- **Carga de Presión:** Se aplica una presión sobre las pastillas de freno para simular la fuerza de apriete.
- **Coeficiente de Fricción:** Se define un coeficiente de fricción entre las superficies de contacto del disco y las pastillas. Esta fricción es la principal fuente de generación de calor.
- **Velocidad Angular:** Se establece una velocidad de rotación inicial para el disco, la cual disminuirá a lo largo del tiempo de la simulación.
- **Condiciones Térmicas:** Se definen la temperatura ambiente y las condiciones de convección en las superficies expuestas del disco, simulando el enfriamiento por aire.



### 3. Análisis Transitorio y Cálculos

El análisis se configura como **transitorio**, lo que permite estudiar la evolución del sistema a lo largo del tiempo. **CalculiX** resolverá las ecuaciones de forma acoplada, calculando en cada paso de tiempo:

- La cantidad de calor generada por la fricción.
- ¿Cómo se propaga ese calor a través del material del disco?.
- La expansión térmica y las deformaciones resultantes.
- Las tensiones mecánicas que surgen de la deformación.



### 4. Resultados y postprocesamiento

Una vez que la simulación ha finalizado, los resultados se visualizan en **PrePoMax**. Es posible analizar y postprocesar la información para entender el comportamiento del sistema:

- **Distribución de Temperatura:** Generar mapas de colores para identificar las zonas del disco que alcanzan las temperaturas más altas.
- **Deformación:** Visualizar cómo el disco se deforma debido a la expansión térmica, lo que puede influir en la eficacia del frenado.
- **Tensiones Mecánicas:** Analizar la distribución de tensiones, un factor crítico para evaluar la integridad estructural y el riesgo de fallo por fatiga o agrietamiento.

Este ejemplo demuestra cómo la simulación termomecánica, utilizando software de código abierto, permite a los ingenieros y científicos predecir con precisión los fenómenos acoplados. La interacción entre el calor y la deformación es vital para diseñar sistemas de frenado que sean seguros y eficientes.
