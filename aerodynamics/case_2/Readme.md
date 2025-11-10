# Dinámica de un ciclista

Este abordaje requiere establecer **criterios de estabilidad o seguridad** para un ciclista. Este estudio aerodinámico (CFD) no solo debe simular el flujo, sino que debe acoplarse a un modelo de la **dinámica del ciclista** para determinar qué distancia es necesaria para que las fuerzas de aire sean manejables.

A continuación, se describe la metodología para un estudio aerodinámico que busca determinar estas distancias límite, aplicable tanto a la distancia berma-vía como a la distancia camión-ciclista.

------

## 1. Criterios de Estabilidad y Seguridad (La Métrica Clave)

El estudio debe enfocarse en cuantificar la **Fuerza Lateral Máxima Permisible ($F_{lat, max}$)** que un ciclista promedio puede tolerar antes de perder el equilibrio.

- **Fuerza de Recuperación del Ciclista:** Un ciclista se mantiene estable inclinándose (girando el manillar) para crear un contramomento. La fuerza crítica es aquella que produce un **momento de volteo** superior al que el ciclista puede contrarrestar en el tiempo de reacción.

- Métrica a Determinar: El objetivo del CFD es encontrar la distancia horizontal ($D$) a la cual la Fuerza Lateral Aerodinámica ($F_{lat, aero}$) generada por el camión es menor o igual al 80% del umbral de seguridad del ciclista:

  $$D \text{ tal que } F_{lat, aero}(D) \leq 0.8 \times F_{lat, max}$$

------

## 2. Metodología de Simulación Aerodinámica (CFD)

El proceso sigue la metodología de CFD descrita anteriormente, pero con un enfoque paramétrico en la distancia.

### A. Definición de Escenarios de Distancia (Parametrización)

Se ejecuta una serie de simulaciones CFD variando la distancia lateral ($D$) entre el eje del camión (o el borde de la vía) y el centro de masa del ciclista.

- **Variables Fijas:** Velocidad del camión (ej. 80-100 km/h) y configuración del camión (Kenworth con remolque estándar).
- **Variables a Variar:**
  - **Distancia ($D$):** Se simula un rango de distancias desde un valor cercano (ej. 1.0 m) hasta distancias mayores (ej. 3.0 m, 4.0 m) hasta que la fuerza lateral converja a un valor bajo.
  - **Ángulo de Adelantamiento:** Se simula el momento más crítico: cuando el camión y el ciclista están lado a lado.

### B. Ejecución de la CFD (OpenFOAM / Solucionador)

1. **Modelo de Turbulencia:** Es crucial usar modelos de turbulencia avanzados (como **Large Eddy Simulation - LES** o $k-\omega$ SST) en las zonas de mezcla (la estela del camión) para capturar la naturaleza inestable y oscilatoria de la fuerza lateral.
2. **Transitorio:** El análisis debe ser **transitorio** (dependiente del tiempo), ya que la fuerza lateral no es constante; varía dramáticamente cuando el frente y la cola del camión pasan por el ciclista. La métrica importante es el **pico de fuerza lateral** y la **tasa de cambio de esa fuerza**.

### C. Post-procesamiento Crítico

El enfoque se centra en la fuerza ejercida sobre el ciclista a lo largo del tiempo para cada distancia simulada:

1. **Fuerza Lateral Pura:** Se extrae el componente de fuerza perpendicular a la dirección de movimiento para cada instante.
2. **Cálculo del Ponderado de Riesgo:** Se analiza el **pico de succión** (fuerza hacia el camión) y el **pico de empuje** (fuerza lejos del camión) para cada distancia.

------

## 3. Determinación de las Distancias Límite

### Caso 1: Distancia entre Grupo de Ciclistas y Camión (Carretera sin Berma)

1. **Umbral de Estabilidad:** Se establece un valor conservador para la **Fuerza Lateral Máxima Permisible ($F_{lat, max}$)**, basándose en estudios biomecánicos o normativas de estabilidad de vehículos de dos ruedas.
2. **Curva $F$ vs $D$:** Se traza una gráfica que muestra el **pico de fuerza lateral máxima** (el valor más crítico de la simulación transitoria) en función de la distancia de separación ($D$).
3. **Determinación de $D_{seguro}$:** Se identifica el punto en esta curva donde el pico de fuerza aerodinámica desciende por debajo del umbral de seguridad ($0.8 \times F_{lat, max}$). Esa distancia es la **Distancia Mínima Segura** requerida en la vía.

### Caso 2: Distancia Berma-Vía (Diseño de Infraestructura)

Este caso es idéntico al anterior, pero el resultado de la simulación ($\text{Distancia Mínima Segura}$) se convierte en un requisito de diseño:

$$\text{Distancia Berma-Vía} \geq D_{seguro}$$

El estudio de CFD permite así cuantificar un fenómeno físico para establecer una **regla de diseño de infraestructura o una normativa vial** basada en la estabilidad real de los usuarios vulnerables.