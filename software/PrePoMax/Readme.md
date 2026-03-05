# PrePoMax 

PrePoMax es un pre y post-procesador de código abierto para el solver de elementos finitos CalculiX, con una interfaz gráfica moderna orientada a facilitar el flujo de trabajo FEA en Windows.prepomax.um+1

## Qué es PrePoMax

PrePoMax se apoya en CalculiX CrunchiX como solucionador FEA de propósito general, encargándose él mismo de todo el preprocesado (modelado) y postprocesado (visualización de resultados). Está desarrollado principalmente por Matej Borovinšek en la Universidad de Maribor y se distribuye como software gratuito y open source.prepomax.fs.um+2

## Plataforma y requisitos

El programa funciona únicamente en **Windows** y está basado en Microsoft .NET Framework 4.8, que debe estar instalado para poder ejecutarlo. No requiere una instalación compleja: existen versiones empaquetadas listas para usar que muchos usuarios ejecutan como aplicación “portable”.[[prepomax.fs.um](https://prepomax.fs.um.si/downloads/)]youtube+1

## Capacidades de preprocesado

PrePoMax permite importar geometrías CAD en múltiples formatos de intercambio (por ejemplo STEP) y también archivos STL típicos de impresión 3D, usando la plataforma Open Cascade para el soporte geométrico. Sobre esa geometría puedes definir materiales, secciones, condiciones de contorno, cargas, mallas y conjuntos de nodos/elementos desde una interfaz gráfica similar en filosofía a Abaqus/CAE.[[youtube](https://www.youtube.com/watch?v=SNhaWzv8gY8)]prepomax.um+1

## Mallado y definición del modelo

Incluye herramientas para generar la malla de elementos finitos directamente dentro del entorno, con control de tamaño global y parámetros avanzados (tamaño absoluto o relativo, refinamiento, etc.). El usuario puede crear node sets, element sets y superficies tanto desde la geometría como desde la propia malla, lo que facilita definir contactos, apoyos, cargas distribuidas, etc.prepomax.um+1

## Tipos de análisis soportados

A través de CalculiX, PrePoMax se orienta a análisis estructurales: estáticos lineales y no lineales, contactos, problemas 2D de tensión plana, flexión de vigas, estructuras tipo auxéticas y otros casos típicos de resistencia de materiales. La interfaz expone las opciones más usadas de CalculiX, aunque ciertos tipos de declaraciones avanzadas (por ejemplo algunas opciones *DYNAMIC) todavía se manejan mejor editando el archivo .inp externamente.youtube+2calculix.discourse+1

## Postprocesado y visualización

El postprocesador permite visualizar campos escalares 3D (desplazamientos, tensiones, etc.) con animaciones, así como generar gráficas 2D de resultados de historia (por ejemplo curvas carga–desplazamiento). También puede leer y mostrar los archivos de resultados .frd de CalculiX, ofreciendo una alternativa gráfica más amigable que el posprocesado puramente textual.youtube+1calculix.discourse+1

## Integración en un flujo FEA open source

PrePoMax se integra naturalmente en un ecosistema open source: puedes generar mallas en Salome y exportarlas como .unv para luego importarlas en PrePoMax, montar el modelo y lanzar CalculiX. Su código está disponible en repositorios como GitLab/GitHub, donde se describen los módulos principales (CaeMesh, CaeModel, CaeResults, etc.) para quien quiera extender o compilar el programa.github+2[[youtube](https://www.youtube.com/watch?v=nGUzVGwSUrk)]

(En edición)