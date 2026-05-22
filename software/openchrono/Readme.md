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

# Instalación y configuración **Project Chrono** en **Linux** con soporte CUDA

Instalación y configuración **Project Chrono** en **Linux** con soporte **CUDA** (para aprovechar las simulaciones aceleradas por GPU) es un proceso que requiere varios pasos, principalmente utilizando **CMake** para la configuración y compilación.

Aquí se detallo los pasos principales:

## Requisitos Previos (Prerequisites)

Antes de empezar, se debe asegurar de tener instalados los siguientes componentes en tu sistema Linux:

1. **Herramientas de Compilación:**
   - **Compilador C++:** Generalmente **GCC/G++** (versión 9 o superior es recomendada).
   - **CMake:** El sistema de construcción (build system) (versión 3.16 o superior).
   - **Make/Ninja:** Una herramienta para ejecutar la compilación.
2. **Tecnología NVIDIA CUDA:**
   - **Controladores (Drivers) de NVIDIA:** La última versión estable para tu tarjeta gráfica.
   - **CUDA Toolkit:** El kit de desarrollo de CUDA (incluyendo el compilador `nvcc`). Es crucial que la versión de tu **CUDA Toolkit** sea compatible con la versión de GCC que estés usando.
3. **Dependencias Opcionales pero Recomendadas:**
   - **Python 3:** Si deseas usar la interfaz **PyChrono**.
   - **Módulos de Visualización:** Como **irrlicht** (para visualización 3D simple) o **Panda3D/OpenGL** para visualizaciones más avanzadas.

------

##  Pasos de Instalación y Configuración

El proceso estándar implica descargar el código fuente, usar CMake para configurar las opciones de compilación (activando CUDA), y luego compilar.

### 1. Obtener el Código Fuente

Clonar el repositorio oficial de Project Chrono.

Bash

```
git clone https://github.com/project-chrono/chrono.git
cd chrono
```

### 2. Configuración con CMake (Activando CUDA)

Crear un directorio de compilación separado y ejecuta `cmake`. Este es el paso más crucial donde se activa el soporte para CUDA y otros módulos deseados.

Bash

```
mkdir build
cd build
```

Ejecutar `cmake` con las banderas (flags) necesarias:

Bash

```
cmake .. \
    -DCHRONO_INSTALL=ON \
    -DENABLE_MODULE_IRRLICHT=ON \
    -DENABLE_MODULE_CUDA=ON \
    -DENABLE_MODULE_GPU=ON \
    -DENABLE_MODULE_VSG=ON \
    -DCMAKE_BUILD_TYPE=Release
```

#### Explicación de las Banderas Clave:

| **Bandera**                   | **Descripción**                                              |
| ----------------------------- | ------------------------------------------------------------ |
| `-DCHRONO_INSTALL=ON`         | Permite que Chrono sea instalado como una biblioteca del sistema. |
| `-DENABLE_MODULE_CUDA=ON`     | **ACTIVA** el soporte para CUDA en los módulos que lo usan (base y utilidades). |
| `-DENABLE_MODULE_GPU=ON`      | **ACTIVA** el módulo **Chrono::Gpu**, el cual es crucial para simulaciones de dinámica granular masiva aceleradas por GPU. |
| `-DENABLE_MODULE_IRRLICHT=ON` | Activa el módulo de visualización básico (Irrlicht).         |
| `-DENABLE_MODULE_VSG=ON`      | Activa el módulo de visualización moderno (Vulkan Scene Graph). |
| `-DCMAKE_BUILD_TYPE=Release`  | Compila una versión optimizada para rendimiento.             |

> **Nota:** Si se tiene problemas con el compilador CUDA (`nvcc`) y GCC, podría necesitar especificar explícitamente la ruta al compilador CUDA con la bandera `-DCUDA_TOOLKIT_ROOT_DIR=/path/to/cuda`.

### 3. Compilación (Build)

Una vez que `cmake` ha configurado el proyecto sin errores, puedes compilar la biblioteca y los módulos:

Bash

```
make -j$(nproc)
```

El parámetro `-j$(nproc)` utiliza todos los núcleos de tu CPU para acelerar la compilación.

### 4. Instalación

Finalmente, instalar Chrono en el sistema (esto podría requerir privilegios de `sudo` si lo instalas en `/usr/local`):

Bash

```
sudo make install
```

Esto copiará los binarios, bibliotecas (`.so`) y archivos de cabecera (`.h`) al sistema, haciéndolos accesibles para otros proyectos.

## Verificación del Soporte CUDA

Para verificar que la configuración con CUDA fue exitosa:

1. **Revisar la Salida de CMake:** Cuando se ejecuta `cmake` (Paso 2), la salida debe mostrar que los módulos **CUDA** y **GPU** están siendo incluidos. Buscar líneas como:

   ```
   -- Found CUDA: /usr/local/cuda (found version 12.x)
   -- Configuring done
   -- Generating done
   ```

2. **Ejecutar un Ejemplo con GPU:** Una vez instalado, buscar y compilar uno de los ejemplos de demostración que utilizan el módulo **Chrono::Gpu** (por ejemplo, una simulación de dinámica granular masiva) para confirmar que se está ejecutando la lógica en tu tarjeta NVIDIA.
