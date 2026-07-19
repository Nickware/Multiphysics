# MOOSE

MOOSE (Multiphysics Object-Oriented Simulation Environment) es un framework de elementos finitos y simulación multifísica desarrollado principalmente en Idaho National Laboratory, pensado para construir códigos de simulación acoplada de forma relativamente rápida y modular.youtube+1

## Qué es MOOSE

MOOSE no es un “programa FEA” monolítico tipo Abaqus o Ansys, sino una **plataforma** para desarrollar aplicaciones científicas basadas en el método de elementos finitos. Proporciona infraestructura numérica, gestión de mallas, paralelización y un sistema de componentes reutilizables (kernels, materiales, BCs, etc.) sobre los que construyes el código de tu problema físico.youtube+1

## Arquitectura y tecnologías

El framework está escrito en C++ moderno, usando PETSc para el ensamblaje y resolución de sistemas lineales/no lineales y libMesh para la parte de elementos finitos. La definición de problemas se hace vía archivos de entrada de texto estructurados, mientras que la extensión de física nueva típicamente requiere implementar clases C++ que heredan de las bases de MOOSE (por ejemplo, kernels para términos de la ecuación, materiales, postprocesadores).youtube+1

## Enfoque multifísica

Una de las ideas centrales de MOOSE es el acoplamiento “plug-and-play” de diferentes ecuaciones y campos (difusión, mecánica, transferencia de calor, fluido, etc.) en el mismo dominio o dominios acoplados. Esto lo hace especialmente atractivo para problemas complejos en ingeniería nuclear, geomecánica, reactores, flujo en medios porosos y otros sistemas donde varias físicas interactúan fuertemente.youtube+1

## Flujo de trabajo básico

En un caso típico, el usuario define malla, variables, ecuaciones y condiciones de contorno en un archivo de entrada, y la aplicación basada en MOOSE se encarga de montar y resolver el problema. Para tareas más avanzadas, se generan nuevas clases C++ que representan diferentes piezas de la formulación débil (kernels), propiedades de materiales dependientes de campo, fuentes, etc., que luego se activan desde el archivo de entrada.youtube+2

## Capacidades numéricas

MOOSE soporta formulaciones estacionarias y transitorias, esquemas implícitos para EDP acopladas, refinamiento adaptativo de malla y ejecución paralela de alta escala mediante MPI. Su diseño permite aprovechar hardware de cómputo intensivo en clusters y supercomputadores para simulaciones 3D grandes y de larga duración.[[youtube](https://www.youtube.com/watch?v=QPuK6OdF2hM)]

## Casos de uso típicos

Aunque se ha usado mucho en contexto nuclear (deformación y daño de combustibles, transferencia de calor, acople termo-mecánico-hidráulico-químico), el framework es genérico y se ha aplicado a difusión, transporte reactivo, mecánica de sólidos, flujo en medios porosos y otros. Existen aplicaciones “hijas” especializadas (por ejemplo, para geociencias o corrosión) construidas encima de MOOSE que reutilizan su infraestructura numérica pero añaden física y modelos específicos.youtube+1

# Instalación de MOOSE en Linux

Método preferido para obtener las dependencias necesarias para el desarrollo de aplicaciones basadas en MOOSE es a través del amplio conjunto de bibliotecas disponibles en Conda. Siga estos pasos para crear un entorno en su máquina utilizando Conda.


```bash
curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh -b -p ~/miniforge
```

Siga los pasos siguientes según su plataforma para instalar Miniforge. Si tiene problemas durante estos pasos, visite nuestro guía de Solución de Problemas de Conda.

Con Miniforge instalado en su directorio personal, exporte el PATH para poder utilizarlo:

```bash
export PATH=$HOME/miniforge/bin:$PATH
```

Ahora que puede ejecutar conda, inicialícelo y luego salga del terminal:

```bash
conda init --all
exit
```

Al reiniciar su terminal, debería ver un prefijo (base) en su línea de comandos. Esto indica que está en el entorno base y Conda está listo para operar:

```bash
(base) ~>
```

La próxima acción después de una instalación fresca es realizar una actualización del entorno base de Conda:

```bash
conda update --all --yes
```

Agregue la canala pública de INL para tener acceso a la biblioteca de paquetes de Conda de INL:

```bash
conda config --add channels https://conda.software.inl.gov/public
```