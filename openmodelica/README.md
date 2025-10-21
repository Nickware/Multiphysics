# Script de Instalación de OpenModelica

Este script automatiza la preparación, instalación y configuración de OpenModelica en sistemas basados en Debian/Ubuntu (probado en Deepin 15.10), incluyendo la gestión de claves, fuentes de paquetes y la instalación de componentes principales y librerías.

## Descripción

El script facilita la instalación de OpenModelica y sus dependencias, permitiendo elegir la arquitectura de CPU, el sistema operativo y la rama de lanzamiento preferida. También cubre la instalación de librerías Modelica y el entorno de ejecución C++.

## Requisitos

- Sistema operativo basado en Debian/Ubuntu (probado en Zorin 17.3)
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

# Pruebas para Evaluar la Instalación de OMShell y OMShell-terminal

A continuación se describe un conjunto completo de pruebas para verificar que OMShell y OMShell-terminal estén correctamente instalados en OpenModelica:

## 1. Verificación Básica de Acceso

### Para OMShell (GUI):

```bash
# En Windows
OMShell

# En Linux
OMShell
```

**Resultado esperado:** Debe abrirse una ventana gráfica con el prompt `>>>`

### Para OMShell-terminal:

```bash
# En Windows (Command Prompt o PowerShell)
OMShell-terminal

# En Linux/Mac (Terminal)
omc
```

**Resultado esperado:** Debe aparecer el prompt interactivo de OpenModelica

## 2. Pruebas de Comandos Básicos

Una vez dentro de OMShell o OMShell-terminal, ejecutar estos comandos:

### Prueba 1: Verificar versión

```modelica
getVersion()
```

**Resultado esperado:** Algo como `"v1.21.0"` o similar

### Prueba 2: Obtener configuración

```modelica
getSettings()
```

**Resultado esperado:** Una lista con las configuraciones del sistema

### Prueba 3: Listar librerías disponibles

```modelica
getAvailableLibraries()
```

**Resultado esperado:** Lista de librerías como Modelica, ModelicaServices, etc.

## 3. Prueba de Carga de Librería

```modelica
loadModel(Modelica)
```

**Resultado esperado:** `true`

```modelica
getClassNames()
```

**Resultado esperado:** Lista de clases disponibles incluyendo Modelica

## 4. Prueba de Modelo Simple

Ejecutar este script completo para crear y simular un modelo básico:

```modelica
// Crear un modelo simple
model TestModel
  Real x(start=1);
equation
  der(x) = -x;
end TestModel;

// Guardar y compilar
loadString("
model TestModel
  Real x(start=1);
equation
  der(x) = -x;
end TestModel;
")

// Verificar que el modelo existe
list(TestModel)

// Simular el modelo
simulate(TestModel, stopTime=1.0)

// Obtener resultado
val(x, 1.0)
```

**Resultados esperados:**

- `loadString()` debe retornar `true`
- `list(TestModel)` debe mostrar el código del modelo
- `simulate()` debe retornar información de éxito
- `val(x, 1.0)` debe retornar aproximadamente `0.367879` (e^-1)

## 5. Prueba de Funciones Matemáticas

```modelica
// Operaciones básicas
1+1
10*5
sqrt(16)
sin(0)
```

**Resultados esperados:**

- `2`
- `50`
- `4.0`
- `0.0`

## 6. Prueba de Manejo de Errores

```modelica
// Intentar cargar un modelo inexistente
loadModel(ModeloInexistente)
```

**Resultado esperado:** `false` con mensaje de error

## 7. Verificación de Paths y Directorios

```modelica
cd()  // Muestra directorio actual
getInstallationDirectoryPath()  // Ruta de instalación
getTempDirectoryPath()  // Directorio temporal
```

**Resultado esperado:** Rutas válidas del sistema

## 8. Prueba de Scripting Desde Archivo

Crear un archivo `test.mos` con el siguiente contenido:

```modelica
loadModel(Modelica);
getVersion();
quit();
```

Luego ejecutar:

```bash
# Desde la terminal del sistema (no desde OMShell)
omc test.mos
```

**Resultado esperado:** Debe ejecutar los comandos y mostrar la versión

## 9. Checklist de Funcionalidad

Marcar cada punto si funciona correctamente:

- [ ] OMShell GUI abre correctamente (si aplica)
- [ ] OMShell-terminal/omc responde en línea de comandos
- [ ] `getVersion()` retorna versión
- [ ] `loadModel(Modelica)` carga exitosamente
- [ ] Modelo simple compila y simula
- [ ] Operaciones matemáticas funcionan
- [ ] Comandos de archivo (cd, paths) responden
- [ ] Scripts .mos se pueden ejecutar desde terminal

## 10. Solución de Problemas Comunes

Si alguna prueba falla:

**Problema:** Comando no reconocido

- **Solución:** Verificar que OpenModelica esté en el PATH del sistema

**Problema:** No se puede cargar Modelica

- **Solución:** Reinstalar OpenModelica o verificar la instalación de librerías

**Problema:** Errores de simulación

- **Solución:** Verificar compiladores C (gcc en Linux, MinGW en Windows)

## Comando Rápido de Verificación Integral

Ejecutar este script completo de una vez:

```modelica
print("=== Test de Instalación OpenModelica ===\n");
print("Versión: " + getVersion() + "\n");
print("Directorio: " + cd() + "\n");
loadModel(Modelica);
print("Modelica cargado: " + String(loadModel(Modelica)) + "\n");
loadString("model T Real x=1; end T;");
print("Modelo de prueba cargado\n");
print("=== Todas las pruebas completadas ===\n");
```

Si todos estos comandos se ejecutan sin errores críticos, la instalación está funcionando correctamente.

---

# OMPython 
### (taken from the source)

OMPython is a Python interface that uses ZeroMQ to
communicate with OpenModelica.

## Dependencies

-   Python 3.x supported
-   PyZMQ is required

## Installation

Installation using `pip` is recommended.

### Via pip

```bash
pip install OMPython
```

### Via source

Clone the repository and run:

```
cd <OMPythonPath>
python -m pip install -U .
```

## Usage

Running the following commands should get you started

```python
import OMPython
help(OMPython)
```

```python
from OMPython import OMCSessionZMQ
omc = OMCSessionZMQ()
omc.sendExpression("getVersion()")
```

or read the [OMPython documentation](https://openmodelica.org/doc/OpenModelicaUsersGuide/latest/ompython.html)
online.
