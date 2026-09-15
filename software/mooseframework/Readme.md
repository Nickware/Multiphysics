# MOOSE

MOOSE (Multiphysics Object-Oriented Simulation Environment) es un framework de elementos finitos para construir aplicaciones científicas multifísicas. No es un programa FEA monolítico: proporciona mallas, ensamblaje, solvers, paralelización y componentes reutilizables para que cada aplicación defina su física.

## Áreas de aplicación

MOOSE resulta especialmente útil cuando varias ecuaciones deben resolverse de forma acoplada:

- transferencia de calor y termo-mecánica;
- mecánica de sólidos, plasticidad y fractura;
- transporte reactivo y difusión-reacción;
- flujo en medios porosos y geomecánica;
- combustibles, reactores nucleares y daño de materiales;
- electroquímica, corrosión y baterías;
- crecimiento, remodelación y mecanobiología;
- problemas transitorios grandes ejecutados en paralelo.

La aplicación se configura normalmente con archivos de entrada. Cuando los kernels, materiales o condiciones disponibles no son suficientes, se implementan componentes C++ que extienden las clases de MOOSE.

## Arquitectura y conceptos básicos

MOOSE se apoya en PETSc para la solución de sistemas lineales y no lineales y en libMesh para elementos finitos. Un caso típico combina:

- `Mesh`: geometría o malla;
- `Variables`: campos desconocidos;
- `Kernels`: términos de las ecuaciones débiles;
- `Materials`: propiedades constitutivas;
- `BCs`: condiciones de contorno;
- `Executioner`: solución estacionaria o transitoria;
- `Postprocessors` y `Outputs`: magnitudes y archivos de salida.

## Instalación y configuración en Linux

La ruta exacta depende de la versión de MOOSE y de la distribución Linux. Se recomienda usar el procedimiento oficial de la [documentación de instalación de MOOSE](https://mooseframework.inl.gov/getting_started/installation/index.html) y registrar la revisión del repositorio utilizada.

### 1. Dependencias y entorno Conda

En una instalación nueva de Ubuntu o Debian, instalar herramientas básicas:

```bash
sudo apt update
sudo apt install -y git curl build-essential cmake gcc g++
```

Instalar Miniforge para disponer de Conda sin modificar el Python del sistema:

```bash
curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh -b -p "$HOME/miniforge3"
source "$HOME/miniforge3/etc/profile.d/conda.sh"
conda init bash
```

Abrir una nueva terminal o cargar el entorno y verificar:

```bash
conda --version
```

### 2. Obtener MOOSE

Clonar el repositorio oficial en una ruta de trabajo:

```bash
git clone https://github.com/idaholab/moose.git "$HOME/moose"
cd "$HOME/moose"
```

Usar el archivo de entorno y las instrucciones asociadas a la revisión elegida. Como patrón general, la configuración se realiza con Conda y después se compila el framework o una aplicación hija. No conviene mezclar dependencias de dos revisiones distintas.

```bash
conda env create -f environment.yml
conda activate moose
```

Si la revisión no contiene `environment.yml` o usa otro nombre de entorno, seguir el archivo de instalación incluido por esa revisión. El nombre `moose` del entorno es ilustrativo y puede variar.

### 3. Configuración de una aplicación

MOOSE se usa normalmente desde una aplicación, no desde el repositorio del framework de forma aislada. Un flujo habitual es:

```bash
cd "$HOME/moose"
make -j2
```

Después, entrar en una aplicación compatible, revisar su `Makefile` y compilarla con los comandos indicados por esa aplicación. Para ejecuciones paralelas se puede usar MPI cuando esté configurado:

```bash
mpirun -n 2 ./mi_aplicacion-opt -i input.i
```

El ejecutable, el nombre del entorno Conda y la disponibilidad de MPI dependen de la aplicación y de la versión de MOOSE.

## Pruebas después de instalar

### Prueba 1: entorno y compilador

```bash
conda info --envs
which g++
git -C "$HOME/moose" rev-parse --short HEAD
```

Resultado esperado: el entorno activo aparece en Conda, se encuentra un compilador C++ y se muestra la revisión de MOOSE.

### Prueba 2: pruebas del framework

Desde el repositorio de MOOSE, ejecutar el objetivo disponible en la revisión instalada:

```bash
cd "$HOME/moose"
make -j2
./run_tests -j2
```

En algunas revisiones el lanzador de pruebas o sus opciones pueden variar. Si `run_tests` no existe, consultar `make help` y la documentación de esa revisión en lugar de asumir que la compilación fue correcta.

Resultado esperado: compilación sin errores y pruebas reportadas como aprobadas. Los fallos de infraestructura deben separarse de los fallos físicos de una aplicación.

### Prueba 3: caso de difusión

La prueba más útil para una aplicación nueva es un problema pequeño de difusión o calor con solución conocida. El archivo de entrada debe definir una malla simple, una variable, un `Diffusion` kernel, condiciones de contorno, un `Executioner` estacionario y un postprocesador.

```bash
./mi_aplicacion-opt -i test_diffusion.i
```

Comprobar que se generan los archivos de salida y que la solución respeta las condiciones de contorno. Comparar el resultado con la solución analítica antes de añadir acoplamientos no lineales.

### Prueba 4: paralelización

Cuando la aplicación esté configurada con MPI:

```bash
mpirun -n 2 ./mi_aplicacion-opt -i test_diffusion.i
```

Comparar la solución de uno y dos procesos dentro de una tolerancia definida. Esta prueba verifica la ejecución distribuida, pero no demuestra por sí misma la validez del modelo físico.

## Casos de uso para implementar

### Termomecánica de un freno de disco

Reproducir el caso de [termomecánica](../../termomechanics/Readme.md) con un campo de temperatura acoplado a desplazamientos. Empezar con conducción estacionaria, añadir expansión térmica y terminar con fricción o generación de calor dependiente del tiempo.

### Flujo y transporte en un medio poroso

Implementar presión, velocidad y transporte de una especie en una muestra porosa. El caso debe incluir permeabilidad, difusión, fuente o reacción y una comparación con un problema unidimensional conocido.

### Daño o fractura de un material

Modelar una probeta sometida a tracción con una variable de daño o fase. El objetivo es estudiar carga máxima, localización y sensibilidad a la malla, dejando explícitas la ley constitutiva y la regularización utilizadas.

### Transferencia de calor en un componente electrónico

Resolver conducción con fuentes volumétricas y convección en la frontera. Después, acoplar deformación térmica y comparar temperatura máxima y desplazamiento con un modelo reducido.

### Modelo mecanobiológico

Acoplar deformación, difusión de nutrientes y una ley de crecimiento o remodelación. Es un caso adecuado para una aplicación propia porque requiere materiales y términos de ecuación específicos.

## Buenas prácticas

- Fijar la revisión de MOOSE y de la aplicación antes de comparar resultados.
- Mantener archivos de entrada, mallas, parámetros y scripts de ejecución en control de versiones.
- Validar primero cada física por separado y después el acoplamiento.
- Reportar solver, tolerancias, paso de tiempo, número de procesos y criterios de convergencia.
- Ejecutar estudios de sensibilidad de malla y de paso temporal.
- No interpretar una simulación convergida como una simulación validada físicamente.

## Referencias

- [Documentación oficial de MOOSE](https://mooseframework.inl.gov/)
- [Instalación de MOOSE](https://mooseframework.inl.gov/getting_started/installation/index.html)
- [Repositorio oficial](https://github.com/idaholab/moose)