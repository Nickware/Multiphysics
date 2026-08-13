# Termomecánica

## Introducción teórica

La termomecánica es una rama de la multifísica que estudia la estrecha relación entre los estados térmicos (temperatura) y la respuesta mecánica (deformación, tensiones, fatiga) de un sistema. En el mundo de la ingeniería, rara vez un sólido experimenta cambios de temperatura sin que esto altere sus dimensiones o su integridad estructural.

### El corazón de la termomecánica: el acoplamiento

Lo que hace que la termomecánica sea una disciplina de "multifísica" es el **acoplamiento bidireccional**:

1. **Efecto térmico sobre la mecánica:** la mayoría de los materiales se expanden al calentarse y se contraen al enfriarse. Si esta expansión está restringida (por ejemplo, una viga empotrada entre dos paredes), se generan **tensiones térmicas** masivas que pueden superar la resistencia del material y causar deformaciones permanentes o fracturas.
2. **Efecto mecánico sobre lo térmico:** la deformación plástica (cuando un metal se deforma más allá de su límite elástico) genera calor interno. Además, los cambios en la geometría del componente debido a la carga mecánica pueden alterar su capacidad para disipar calor, cambiando así su distribución de temperatura.

Conviene precisar además *cómo* se resuelve numéricamente este acoplamiento, porque afecta directamente la interpretación de los resultados. Existen dos estrategias:

- **Acoplamiento fuerte (monolítico):** las ecuaciones térmicas y mecánicas se ensamblan en un único sistema y se resuelven simultáneamente en cada paso de tiempo. Es más preciso pero computacionalmente más costoso.
- **Acoplamiento débil (particionado):** se resuelve primero el problema térmico, se pasan los resultados al problema mecánico, y se itera entre ambos (típicamente con un esquema tipo Gauss-Seidel) hasta que los campos convergen dentro de una tolerancia. Es el enfoque que usa CalculiX en la mayoría de configuraciones estándar para contacto con fricción y generación de calor, y es el que se emplea en el caso de estudio de este documento.

### Factores determinantes

Para modelar estos sistemas, los ingenieros deben considerar tres parámetros físicos fundamentales, junto con valores de referencia típicos para los materiales del caso de estudio (hierro fundido gris para el disco, material compuesto para las pastillas):

| Parámetro | Símbolo | Rol físico | Hierro fundido (disco) | Pastilla (compuesto) |
|---|---|---|---|---|
| Coeficiente de expansión térmica | $\alpha$ | Dilatación por grado de temperatura; responsable directo de las deformaciones geométricas | $\approx 11\times10^{-6}\ K^{-1}$ | $\approx 15$–$20\times10^{-6}\ K^{-1}$ |
| Conductividad térmica | $k$ | Velocidad de propagación del calor; baja conductividad genera grandes gradientes térmicos, caldo de cultivo del **choque térmico** | $\approx 50\ W/(m\cdot K)$ | $\approx 0.5$–$5\ W/(m\cdot K)$ |
| Módulo de Young | $E$ | Rigidez del material; disminuye con la temperatura, aumentando la propensión a fallar bajo carga | $\approx 100$–$140\ GPa$ (cae con T) | $\approx 1$–$10\ GPa$ |

*(Valores orientativos de literatura estándar de materiales; deben verificarse contra la ficha técnica del material específico usado en la simulación.)*

### Aplicaciones de la termomecánica

Esta rama es crítica en industrias donde el calor extremo es parte del funcionamiento normal:

- **Motores de combustión y turbinas:** las palas de una turbina de gas operan a temperaturas altísimas mientras rotan a altas velocidades. El análisis termomecánico es necesario para asegurar que la expansión térmica no haga que las palas toquen la carcasa del motor.
- **Electrónica de potencia:** los procesadores y chips se calientan y enfrían constantemente. La diferencia de expansión térmica entre los componentes electrónicos (silicio) y la placa de circuito (cobre/fibra de vidrio) provoca que las soldaduras fallen con el tiempo por **fatiga térmica**.
- **Diseño de frenos:** la fricción entre la pastilla y el disco genera un pico de calor súbito. Si el disco no puede disipar el calor o acomodar la expansión térmica, se deforma (frenado con vibración) o se agrieta.
- **Estructuras aeroespaciales:** durante la reentrada atmosférica, el rozamiento con el aire genera temperaturas extremas. La estructura debe mantenerse íntegra mecánicamente a pesar de la drástica reducción de resistencia del material causada por el calor.

### ¿Por qué es un desafío de simulación?

Resolver esto manualmente es casi imposible porque las ecuaciones diferenciales están **acopladas**: la solución de la parte térmica depende de la geometría mecánica, y la geometría mecánica depende de la solución térmica. Por ello, se utiliza software de **elementos finitos (FEA)** que resuelve iterativamente ambos problemas en pequeños pasos de tiempo, asegurando que, al final de cada iteración, el campo de temperaturas y el campo de deformaciones sean físicamente coherentes entre sí.

---

## Caso de estudio: simulación de un freno de disco durante el frenado

Este caso de estudio se centra en el análisis de un freno de disco durante el frenado, un fenómeno clásico donde la fricción genera calor (fenómeno térmico) que, a su vez, provoca la expansión y deformación del disco (fenómeno mecánico).

### Metodología con software libre

Para llevar a cabo esta simulación se utiliza un flujo de trabajo que combina tres herramientas de código abierto:

- **FreeCAD:** creación del modelo geométrico 3D de los componentes.
- **PrePoMax:** interfaz gráfica que facilita la configuración del análisis de elementos finitos (FEA).
- **CalculiX:** motor de cálculo que resuelve las ecuaciones termomecánicas de forma acoplada.

### 1. Modelo geométrico y preprocesamiento

Se crea el modelo 3D del freno de disco y las pastillas en FreeCAD. Es fundamental que las geometrías de los componentes en contacto estén correctamente definidas para modelar la fricción. El modelo se exporta en formato `STEP` y se importa en PrePoMax para el preprocesamiento.

En PrePoMax se realiza el mallado de los componentes y se definen las propiedades del material (ver tabla de la sección anterior):

- **Propiedades térmicas:** conductividad térmica, calor específico y coeficiente de convección.
- **Propiedades mecánicas:** módulo de Young, coeficiente de Poisson y coeficiente de expansión térmica.

### 2. Configuración de cargas y condiciones de contorno

- **Carga de presión:** se aplica sobre las pastillas para simular la fuerza de apriete.
- **Coeficiente de fricción:** se define entre las superficies de contacto del disco y las pastillas; es la principal fuente de generación de calor.
- **Velocidad angular:** se establece una velocidad de rotación inicial para el disco, que disminuye a lo largo de la simulación.
- **Condiciones térmicas:** temperatura ambiente y condiciones de convección en las superficies expuestas, simulando el enfriamiento por aire.

### 3. Análisis transitorio y cálculos

El análisis se configura como **transitorio**, lo que permite estudiar la evolución del sistema en el tiempo. CalculiX resuelve, en cada paso de tiempo:

- La cantidad de calor generada por la fricción.
- La propagación de ese calor a través del material del disco.
- La expansión térmica y las deformaciones resultantes.
- Las tensiones mecánicas que surgen de la deformación.

### 4. Resultados y postprocesamiento

Los resultados se visualizan en PrePoMax:

- **Distribución de temperatura:** mapas de colores para identificar las zonas del disco que alcanzan las temperaturas más altas.
- **Deformación:** cómo el disco se deforma debido a la expansión térmica, lo que puede influir en la eficacia del frenado.
- **Tensiones mecánicas:** distribución de tensiones, factor crítico para evaluar la integridad estructural y el riesgo de fallo por fatiga o agrietamiento.

### 5. Validación de resultados

Antes de aceptar los resultados como físicamente representativos, conviene contrastarlos contra referencias independientes:

- **Rango de temperatura pico:** en frenados severos, la superficie del disco típicamente alcanza entre 300 °C y 700 °C, dependiendo de la masa del vehículo, la velocidad inicial y la intensidad del frenado. Un resultado muy fuera de ese rango sugiere un error en la carga de presión, el coeficiente de fricción o la malla.
- **Conservación de energía:** el trabajo disipado por fricción ($\int \mu \cdot P \cdot v \, dt$, integrado sobre el contacto) debe ser aproximadamente igual a la energía térmica total generada en el disco menos las pérdidas por convección. Una discrepancia grande indica un problema numérico (paso de tiempo demasiado grande, malla insuficiente en la zona de contacto).
- **Sensibilidad de malla:** repetir el análisis con un refinamiento de malla mayor en la zona de contacto disco-pastilla y verificar que la temperatura pico y las tensiones no cambien más de un pequeño porcentaje (criterio de convergencia de malla).
