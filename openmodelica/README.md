# Script de Instalación de OpenModelica

Este script automatiza la preparación, instalación y configuración de OpenModelica en sistemas basados en Debian/Ubuntu (probado en Deepin 15.10), incluyendo la gestión de claves, fuentes de paquetes y la instalación de componentes principales y librerías.

## Descripción

El script facilita la instalación de OpenModelica y sus dependencias, permitiendo elegir la arquitectura de CPU, el sistema operativo y la rama de lanzamiento preferida. También cubre la instalación de librerías Modelica y el entorno de ejecución C++.

## Autores y Contacto

- **Autor:** N. Torres
- **Correo:** naturalezacomputacional@gmail.com
- **Versión:** 0.2
- **Última actualización:** 13-06-2025

## Requisitos

- Sistema operativo basado en Debian/Ubuntu (probado en Deepin 15.10)
- Acceso a la terminal y permisos de administrador

## Instalación

1. **Actualiza los paquetes e instala dependencias necesarias:**. 
2. **Agrega la clave GPG de OpenModelica:**. 
3. **Añade el repositorio de OpenModelica a tus fuentes:**
4. **Actualiza nuevamente los paquetes e instala OpenModelica:**
5. **Para una instalación mínima (solo el compilador)** 
6. **Instala el gestor de librerías Modelica:**
7. **Opcional: Instala el entorno de ejecución C++:** 

## Configuración

No se requiere configuración adicional tras la instalación. El gestor de librerías Modelica está integrado en la interfaz de scripting y en OMEdit.

## Uso

Tras la instalación, se puede utilizar OpenModelica desde la terminal con el comando `omc` o a través de la interfaz gráfica OMEdit.

## Contribución

Script en desarrollo. Si desea mejorar este script, puede enviar sugerencias o solicitar permisos para hacer el pull requests al repositorio correspondiente.

## Licencia

Este script se distribuye bajo la licencia abierta MIT.
