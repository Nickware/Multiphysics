# Tutorial: Circuito simple RC con OpenModelica

### Resumen

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

Nota: Puede que en algunas versiones (dependiendo el SO o la distribución (en el caso del SO Linux) el archivo fuente (SimpleRC) sea en formato cpp.

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

1. **Dependencias**: Asegúrate de tener instalado GCC/MinGW y las bibliotecas de OpenModelica
2. **Rutas**: Las rutas pueden variar según la instalación y SO
3. **Permisos**: En Linux, puede requerir permisos de escritura en /tmp
4. **Memoria**: Simulaciones largas pueden requerir ajustar límites de memoria
5. **Mejoras**: Se puede complementar el tutorial incorporando rutinas via OMShell.

**Troubleshooting común**

- **Error de compilación**: Verificar que GCC esté en PATH
- **Archivos no encontrados**: Verificar rutas de instalación de OpenModelica
- **Errores de simulación**: Revisar que el modelo no tenga ecuaciones inconsistentes

