# Tutorial: Sistema Masa Resorte con OpenModelica

### Resumen

Proceso paso a paso para ejecutar un ejemplo en OpenModelica. Se el sistema masa resorte compuesto de  una (1) masa y un (1) resorte. Finalmente se observará las gráficas asociadas a la simulación.

### Paso 1.Crear el modelo OpenModelica

1. Abrir OMEdit
2. File → New → Model
3. Nombre: SistemaMasaResorte
4. Tipo: Model
5. Click en "OK"

### Paso 2.Escribir el Modelo

**1. Ubicar el área de edición**

- Después de crear el nuevo modelo en el Paso 1, se observará una ventana con pestañas
- Buscar pestaña que indica o "Text View"

**2. Encontrar el editor de código**

- Se observará un área grande y blanca (editor de texto)
- Puede que ya tenga algo como esto: 

```modelica
model SistemaMasaResorte

end SistemaMasaResorte;
```
**3. Reemplazar todo el contenido**

- Seleccionar TODO el texto que aparece (Ctrl+A)
- Borrar el contenido existente
- Pegar el código completo:
  
```modelica
model SistemaMasaResorte "Sistema masa-resorte-amortiguador"
  
  // Parámetros del sistema
  parameter Real m = 1.0 "Masa (kg)";
  parameter Real k = 10.0 "Constante del resorte (N/m)";
  parameter Real c = 0.5 "Coeficiente de amortiguamiento (N⋅s/m)";
  parameter Real F0 = 5.0 "Fuerza externa (N)";
  parameter Real omega = 2.0 "Frecuencia de excitación (rad/s)";
  
  // Variables de estado
  Real x(start = 0.0) "Posición (m)";
  Real v(start = 0.0) "Velocidad (m/s)";
  Real a "Aceleración (m/s²)";
  Real F_ext "Fuerza externa aplicada (N)";
  Real F_resorte "Fuerza del resorte (N)";
  Real F_amortiguador "Fuerza del amortiguador (N)";
  
equation
  // Cinemática
  der(x) = v;
  der(v) = a;
  
  // Fuerzas
  F_ext = F0 * sin(omega * time);
  F_resorte = -k * x;
  F_amortiguador = -c * v;
  
  // Segunda ley de Newton: F = m⋅a
  m * a = F_ext + F_resorte + F_amortiguador;
  
  annotation(experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.01));
end SistemaMasaResorte;
```
### Paso 3.Verificar la Sintaxis

**Comprobar errores**

- Tools → Check Model
- O usar Ctrl+Shift+C
- Si hay errores, aparecerán en la ventana de mensajes

**Corregir errores si los hay**

- Revisar la sintaxis de Modelica
- Verificar que todas las variables estén declaradas
- Asegúrarse que las ecuaciones estén balanceadas

### Paso 4.Verificar el modelo (opcional), 

```bash
# Navegar al directorio del modelo
cd /ruta/al/modelo

# Compilar y generar C++ (opcional)
omc --target=cpp SistemaMasaResorte.mo

# O usando el simulador directo
omc -s SistemaMasaResorte.mo
```

### Paso 5. Revisar archivos generados (opcional)

En la carpeta de trabajo revisar los siguientes archivos: 

```bash
SimpleRC/
├── SistemaMasaResorte.cpp          # Código C++ principal
├── SistemaMasaResorte.h            # Headers
├── SistemaMasaResorte.cpp # Funciones auxiliares
├── SistemaMasaResorte.json    # Información del modelo
├── Makefile              # Para compilación
└── SistemaMasaResorte              # Ejecutable (después de compilar)
```
Nota: Aparecerán mas archivos, solo que revisar los mencionar los indicados en el listado.

### Paso 6. Examinar el código generado (opcional)

```bash
# Ver el código C++ generado
cat SistemaMasaResorte.c | head -50

# Ver las funciones del modelo
grep -A 10 "eqFunction" SistemaMasaResorte.c
```

Nota: Puede que en algunas versiones (dependiendo el SO o la distribución) el archivo fuente (SistemaMasaResorte) sea en formato cpp.

### Paso 7. Ejecutar la simulación 

**Configurar la simulación**

- Click en el botón "Simulate" (icono de play verde) - Barra superior
- O ir a Simulation → Simulate - Panel izquierdo - click derecho

**Parámetros de simulación**

- Start Time: 0
- Stop Time: 10
- Number of Intervals: 1000
- Tolerance: 1e-6

**Ejecutar simulación**

- Click "OK" para iniciar
- Esperar a que termine el proceso

### Paso 8. Visualizar Resultados

**Ventana de ploteo**

- Después de la simulación, se abre automáticamente
- Si no se abre: Tools → Plot

**Seleccionar variables**

- En el panel izquierdo, expande las variables
- Click en las variables que se desea graficar:
  - x (posición)
  - v (velocidad)
  - F_ext (fuerza externa)

**Personalizar gráficos**

- Se pueden crear múltiples gráficos
- Cambiar colores y estilos de línea
- Agregar títulos y etiquetas

**Archivos de Resultados (opcional)** (Solo si se hizo el paso 4, 5, 6)

- Se pueden ver los archivos en la carpeta de trabajo

```bash
# Ver archivo de resultados (formato MAT o CSV)
ls SistemaMasaResorte.*

# Si es CSV, ver con:
head SistemaMasaResorte.csv
```

### Paso 9.  Análisis de Resultados
**Interpretación física**

- Posición (x): Muestra el desplazamiento de la masa
- Velocidad (v): Derivada de la posición
- Fuerza externa: Entrada sinusoidal al sistema
- Comportamiento: Observar la respuesta del sistema amortiguado

**Experimentos adicionales**

- Cambiar parámetros
- Modificar k, c, m para ver diferentes comportamientos
Cambiar F0 y omega para diferentes excitaciones

**Condiciones iniciales**

- Modificar x(start = ...) y v(start = ...)

### Paso 10.  Guardar y Exportar

**Guardar modelo**

- File → Save (Ctrl+S)
- Guarda con extensión .mo

**Exportar resultados**

- File → Export → CSV (para datos)
- File → Export → Image (para gráficos)

--------------------------------------------

**Notas importantes**

1. **Dependencias**: Asegúrarse de tener instalado GCC/MinGW y las bibliotecas de OpenModelica
2. **Rutas**: Las rutas pueden variar según la instalación y SO
3. **Permisos**: En Linux, puede requerir permisos de escritura en /tmp
4. **Memoria**: Simulaciones largas pueden requerir ajustar límites de memoria
5. **Mejoras**: Se puede complementar el tutorial incorporando rutinas via OMShell.

**Troubleshooting común**

- **Error de compilación**: Verificar que GCC esté en PATH
- **Archivos no encontrados**: Verificar rutas de instalación de OpenModelica
- **Errores de simulación**: Revisar que el modelo no tenga ecuaciones inconsistentes

