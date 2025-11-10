# Efectos aerodinámicos de las llantas de un camión Kenworth sobre un ciclista

Simular los efectos aerodinámicos de las llantas de un camión Kenworth sobre un ciclista es un desafío complejo de **multifísica** que se aborda principalmente mediante la **Mecánica de Fluidos Computacional (CFD)**, acoplada a un análisis de dinámica de cuerpos rígidos o elementos finitos para el ciclista.

Aquí se detalla la metodología, las herramientas y el enfoque necesario:

------

## 1. Metodología de Simulación: CFD Acoplada

La simulación requiere un enfoque de dos o tres vías:

1. **Análisis CFD (Flujo de Aire):** Es el paso central, donde se calcula el campo de velocidades y presiones alrededor del camión y el ciclista.
2. **Cálculo de Fuerzas Aerodinámicas:** Los resultados de la CFD (presión y esfuerzo cortante en la superficie del ciclista) se integran para obtener las fuerzas netas (arrastre, sustentación y fuerza lateral).
3. **Análisis Dinámico (Mecánica):** Estas fuerzas aerodinámicas se aplican a un modelo dinámico del ciclista para predecir el movimiento, el momento de volteo y la estabilidad.

------

## 2. Herramientas y Software (Enfoque Multifísico)

Aunque se puede usar software comercial (como ANSYS Fluent + Mechanical, o Abaqus/CFD), en el ámbito académico y de código abierto se utilizaría:

| **Componente**             | **Software / Metodología**                   | **Función en la Simulación**                                 |
| -------------------------- | -------------------------------------------- | ------------------------------------------------------------ |
| **Modelado 3D**            | **FreeCAD**                                  | Creación precisa de las geometrías del camión, ruedas y ciclista. |
| **CFD (Motor)**            | **OpenFOAM**                                 | Solucionador de código abierto para resolver las ecuaciones de Navier-Stokes. |
| **Mallado**                | **Salome, Gmsh**                             | Generación de una malla computacional de alta calidad en el dominio del aire, incluyendo capas límite finas cerca de las superficies. |
| **Pre/Post-procesamiento** | **ParaView**                                 | Visualización de los campos de presión, velocidad y turbulencia. |
| **Dinámica**               | **Modelos de Código Propio (Python/Matlab)** | Aplicación de las fuerzas CFD al modelo dinámico del ciclista. |

------

## 3. Pasos Detallados de la Simulación CFD

### A. Dominio y Geometría

1. **Geometría:** Se importan los modelos 3D del camión (incluyendo el detalle de las llantas) y el ciclista. Es crucial simular la **rotación de las ruedas** y el **movimiento del suelo** (condiciones de contorno deslizantes).
2. **Dominio Computacional:** Se define una caja de aire grande alrededor del conjunto para asegurar que las condiciones de contorno no interfieran con el flujo de aire alrededor de los objetos.

### B. Mallado (Discretización)

1. **Malla:** Se crea una malla de elementos finitos/volúmenes finitos en el dominio del aire.
2. **Refinamiento:** Se utiliza **refinamiento de malla** intensivo en las áreas críticas:
   - **Capas Límite:** Se crean capas de celdas prismáticas muy finas *pegadas* a las superficies del camión y el ciclista para capturar los esfuerzos viscosos y la **fricción** correctamente.
   - **Estela (Wake):** Se refina la malla detrás del camión, donde se forman las **turbulencias** más intensas.
   - **Zona de Contacto:** Se refina la zona entre las ruedas del camión y el ciclista.

### C. Configuración del Solucionador (OpenFOAM)

1. **Modelo de Turbulencia:** Dado que la estela y la turbulencia son esenciales, se selecciona un modelo de turbulencia robusto, como **$k-\epsilon$** o **$k-\omega$ SST**, para capturar la separación del flujo y los vórtices.
2. **Condiciones de Contorno Dinámicas:**
   - **Entrada (Inlet):** Velocidad constante (ej. $100 \text{ km/h}$) y turbulencia baja.
   - **Salida (Outlet):** Presión constante.
   - **Paredes:** Se aplica la condición de **"Moving Wall"** (pared móvil) al suelo y a las llantas para simular la velocidad de la carretera y la rotación.

### D. Extracción de Resultados y Acoplamiento

1. **Integración de Presión:** Se ejecuta la simulación (generalmente un análisis **transitorio** para capturar la naturaleza inestable del flujo).
2. **Cálculo de Fuerzas:** Se integra la presión y los esfuerzos cortantes calculados sobre toda la superficie del ciclista para obtener la **Fuerza Lateral** neta.

------

## 4. Análisis Dinámico de la Estabilidad

Una vez obtenida la fuerza lateral (el empuje y la succión), se utiliza esta fuerza como **entrada** a un modelo de dinámica de cuerpos rígidos del sistema ciclista-bicicleta.

- El modelo de la bicicleta y el ciclista calculará la **reacción angular** (cuánto se debe inclinar el ciclista) y la **aceleración lateral** resultante de la fuerza aerodinámica.
- Esto permite cuantificar el peligro: si la fuerza lateral es mayor que la capacidad del ciclista para corregir el equilibrio (inclinarse), la simulación predecirá la **pérdida de control** o la caída.

Este enfoque **multifísico** (fluido-estructura simplificada) permite no solo visualizar las turbulencias, sino también cuantificar su impacto físico directo sobre la estabilidad del ciclista.