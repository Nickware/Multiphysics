# Tutorial: Tanque con flujo en OpenModelica

### 1. Instalación de OpenModelica

- Descargar OpenModelica desde [openmodelica.org](https://openmodelica.org/download/)
- Instalar la versión completa que incluye OMEdit (el entorno gráfico)
- Asegúrarse de instalar también las librerías estándar

### 2. Configuración inicial

- Abrir **OMEdit** (OpenModelica Connection Editor)
- Ir a **Tools → Options → Libraries**
- Verificar que esté cargada la librería **Modelica Standard Library** que incluye componentes de fluidos

### 3. Crear un modelo básico de fluidos

Crear un ejemplo simple de un tanque con flujo:

**a) Nuevo modelo:**

- Archivo → Nuevo → Modelo
- Nombrar el modelo: `TanqueSimple`

**b) Código del modelo:**

```modelica
model TanqueSimple
  // Importar librería de fluidos
  import Modelica.Fluid.*;
  
  // Parámetros del sistema
  parameter Real altura_inicial = 2.0 "Altura inicial del líquido (m)";
  parameter Real area_tanque = 1.0 "Área del tanque (m²)";
  parameter Real coef_descarga = 0.6 "Coeficiente de descarga";
  parameter Real area_orificio = 0.01 "Área del orificio (m²)";
  parameter Real g = 9.81 "Aceleración gravitacional (m/s²)";
  
  // Variables de estado
  Real altura(start = altura_inicial) "Altura del líquido (m)";
  Real flujo_salida "Flujo de salida (m³/s)";
  Real velocidad_salida "Velocidad de salida (m/s)";
  
equation
  // Ecuación de continuidad (conservación de masa)
  area_tanque * der(altura) = -flujo_salida;
  
  // Ecuación de Torricelli para flujo por orificio
  velocidad_salida = coef_descarga * sqrt(2 * g * altura);
  flujo_salida = area_orificio * velocidad_salida;

end TanqueSimple;
```

### 4. Verificar y simular

**a) Verificar sintaxis:**

- Clic derecho en el modelo → **Check Model**
- Debe mostrar "Check of TanqueSimple completed successfully"

**b) Configurar simulación:**

- Clic derecho → **Simulate**
- En la ventana de simulación:
  - Start Time: 0
  - Stop Time: 100 (segundos)
  - Tolerance: 1e-6

**c) Ejecutar simulación:**

- Clic en **Simulate**

### 5. Visualizar resultados

Después de la simulación:

- En el 

  Plotting Perspective

  , seleccionar las variables:

  - `altura` (altura del líquido vs tiempo)
  - `flujo_salida` (flujo de salida vs tiempo)

- Hacer doble clic en las variables para graficarlas

### 6. Ejemplo más avanzado con componentes gráficos

Para un ejemplo más complejo usando componentes visuales:

**a) Nuevo modelo gráfico:**

- Archivo → Nuevo → Modelo
- Cambiar a vista **Diagram**

**b) Agregar componentes:** Desde la **Libraries Browser**, navega a:

- `Modelica.Fluid.Vessels` → Arrastrar un `OpenTank`
- `Modelica.Fluid.Sources` → Arrastrar un `Boundary_pT` (fuente de presión)
- `Modelica.Fluid.Pipes` → Arrastrar un `StaticPipe`

**c) Conectar componentes:**

- Usar la herramienta de conexión para unir los puertos de fluido
- Configurar los parámetros de cada componente

### 7. Solución de problemas comunes

- **Error de librerías:** Verificar que Modelica Standard Library esté cargada
- **Problemas de convergencia:** Reducir la tolerancia o ajusta los valores iniciales
- **Unidades inconsistentes:** Revisar que todas las unidades sean coherentes

### 8. Notas adicionales

- Usar **Tools → Options → Simulation** para ajustar el solver (prueba con DASSL o Euler)
- Para modelos complejos, considerar usar `Modelica.Fluid.Examples` como referencia
- Guardar trabajo con **Ctrl+S**
