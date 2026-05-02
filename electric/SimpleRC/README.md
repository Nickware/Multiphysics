# Circuito simple RC con OpenModelica

Proceso paso a paso para ejecutar un ejemplo en OpenModelica. Se crea un circuito eléctrico RC compuesto de  un (1) resistencia y un (1) condensador, luego se carga en OpenModelica para finalmente observar la simulación.

### Paso 1.Crear el modelo OpenModelica

**Opción A: Usando OMEdit (Interfaz gráfica)**

1. Abrir OMEdit
2. File → New → Model
3. Nombre: SimpleRC
4. Copiar el codigo
5. Guardar como: SimpleRC.mo

```modelica
model SimpleRC "Simple RC Circuit"
  parameter Real R = 1000 "Resistance in Ohms";
  parameter Real C = 1e-6 "Capacitance in Farads";
  parameter Real V_source = 5 "Source voltage";
  
  Real capacitor_v(start=0) "Capacitor voltage";
  Real current "Circuit current";
  
equation
  current = C * der(capacitor_v);
  V_source = R * current + capacitor_v;
  
end SimpleRC;
```
**Opción B: Usando editor de texto**

1. Crear archivo SimpleRC.mo con el código anterior
2. Guardarlo en un directorio de trabajo


### Paso 2.Verificar el modelo

**En línea de comandos:**

```bash
# Navegar al directorio del modelo
cd /ruta/a/tu/modelo

# Compilar y generar C++ (opcional)
omc --target=cpp SimpleRC.mo

# O usando el simulador directo
omc -s SimpleRC.mo
```

### Paso 3. Revisar archivos generados

En la carpeta de trabajo revisar los siguientes archivos: 

```bash
SimpleRC/
├── SimpleRC.cpp          # Código C++ principal
├── SimpleRC.h            # Headers
├── SimpleRC_functions.cpp # Funciones auxiliares
├── SimpleRC_info.json    # Información del modelo
├── Makefile              # Para compilación
└── SimpleRC              # Ejecutable (después de compilar)
```

### Paso 4. Examinar el código generado

```bash
# Ver el código C++ generado
cat SimpleRC.c | head -50

# Ver las funciones del modelo
grep -A 10 "eqFunction" SimpleRC.c
```

Nota: Puede que en algunas versiones (dependiendo el SO o la distribución) el archivo fuente (SimpleRC) sea en formato cpp.

### Paso 5. Ejecutar la simulación

**Método 1: Desde OMEdit**

1. Simulation → Simulate
2. Configurar parámetros:
- Start Time: 0
- Stop Time: 0.005
- Number of Intervals: 1000
3. Clic en "Simulate"

### Paso 6. Ver Resultados
**Visualización en OMEdit**
1. Después de simular, aparece automáticamente el plotting
2. Variables disponibles: capacitor_v, current, time
**Archivos de Resultados**

```bash
# Ver archivo de resultados (formato MAT o CSV)
ls SimpleRC_res.*

# Si es CSV, ver con:
head SimpleRC_res.csv
```

### Paso 7. Personalizar la simulación
**Cambiar parámetros:**
```modelica
simulate(SimpleRC, 
         stopTime=0.01,
         numberOfIntervals=2000,
         variableFilter="capacitor_v|current");
```
**Modificar parámetros del modelo**
```modelica
simulate(SimpleRC, 
         stopTime=0.005,
         simflags="-override R=2000,C=2e-6");
```

--------------------------------------------

**Notas importantes**

1. **Dependencias**: Asegurarse de tener instalado GCC/MinGW y las bibliotecas de OpenModelica
2. **Rutas**: Las rutas pueden variar según la instalación y SO
3. **Permisos**: En Linux, puede requerir permisos de escritura en /tmp
4. **Memoria**: Simulaciones largas pueden requerir ajustar límites de memoria
5. **Mejoras**: Se puede complementar el tutorial incorporando rutinas vía OMShell.

**Troubleshooting común**

- **Error de compilación**: Verificar que GCC esté en PATH
- **Archivos no encontrados**: Verificar rutas de instalación de OpenModelica

### OpenModelica y su relacion con otros software

OpenModelica es un entorno de modelado y simulación de código abierto basado en el lenguaje Modelica, compatible con el estándar Modelica Language Specification (MLS), lo que permite portabilidad entre herramientas. [en.wikipedia](https://en.wikipedia.org/wiki/OpenModelica)

## Relación con el ecosistema Modelica
OpenModelica sigue estrictamente el estándar Modelica, evitando vendor lock-in y permitiendo usar modelos en múltiples herramientas para simulación, generación de FMUs, optimización y control. Desarrollado por el Open Source Modelica Consortium (OSMC) en colaboración con Linköping University, soporta la mayoría del lenguaje Modelica, incluyendo ecuaciones, algoritmos, eventos y paquetes. [modelica](https://modelica.org/tools/)

## Integraciones clave
- **OMEdit**: Interfaz gráfica propia (basada en Qt/C++) para modelado, simulación y notebooks interactivos (OMNotebook). [openmodelica](https://openmodelica.org/free-and-open-source-software/omeditintegration/)
- **Enterprise Architect**: Integración con SysML para simulación de sistemas físicos mediante SysPhS. [sparxsystems](https://sparxsystems.com/enterprise_architect_user_guide/17.1/model_simulation/sysml_sim_install_openmodelica.html)
- **Python/Julia**: API para análisis avanzado, como optimización y control, superando limitaciones de herramientas como MATLAB en DAEs. [ep.liu](https://ep.liu.se/ecp/153/025/ecp18153025.pdf)
- **OpenModelica.jl**: Framework en Julia para compilación Modelica, compatible con ModelingToolkit.jl y extensiones para variable structure systems. [pdfs.semanticscholar](https://pdfs.semanticscholar.org/01b3/64e1b4326b895cc701973fd07e951e786730.pdf)

## Comparación con otras herramientas
| Herramienta | Relación con OpenModelica | Ventajas compartidas |
|-------------|---------------------------|----------------------|
| Dymola     | Ambas usan Modelica estándar | Portabilidad de modelos  [openmodelica](https://openmodelica.org/doc/OpenModelicaUsersGuide/latest/backwardscompatibility.html) |
| MATLAB/Simulink | OpenModelica maneja DAEs nativamente | Mejor soporte para ecuaciones acausales  [ep.liu](https://ep.liu.se/ecp/153/025/ecp18153025.pdf) |
| Wolfram SystemModeler | Competidor comercial | OpenModelica es gratuito y extensible  [modelica](https://modelica.org/tools/) |

OpenModelica se integra con bibliotecas como Modelica Standard Library y soporta FMU para interoperabilidad con software propietario. [build.openmodelica](https://build.openmodelica.org/Documentation/)
- **Errores de simulación**: Revisar que el modelo no tenga ecuaciones inconsistentes

