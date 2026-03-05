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

## Curva de aprendizaje

Para sacarle todo el provecho necesitas cierta comodidad con C++ y con formulaciones en elementos finitos, aunque hay tutoriales que muestran cómo correr ejemplos de difusión y otros problemas simples sólo tocando archivos de entrada. Comparado con paquetes puramente GUI, la curva de entrada es más empinada, pero a cambio obtienes un entorno muy flexible para investigación y desarrollo de nuevos modelos multifísicos.youtube+2

(En construcción)