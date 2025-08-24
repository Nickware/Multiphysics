# Comparación de Modelos en Sistemas Dinámicos

## 1. Mecánica Clásica

### Variables Fundamentales
- **Posición** (x, y, z): Ubicación en el espacio
- **Velocidad** (v): Derivada temporal de la posición
- **Aceleración** (a): Derivada temporal de la velocidad
- **Masa** (m): Propiedad intrínseca del objeto
- **Fuerza** (F): Agente de cambio del movimiento

### Ecuaciones Principales
- **Segunda Ley de Newton**: F = ma
- **Ecuación de movimiento**: d²x/dt² = F(x,ẋ,t)/m
- **Conservación de energía**: E = ½mv² + U(x)
- **Conservación de momento**: p = mv

### Características del Sistema
- **Determinista**: Estado futuro completamente determinado por condiciones iniciales
- **Reversible**: Las ecuaciones son simétricas en el tiempo
- **Espacio de fases**: Coordenadas (posición, momento)
- **Grados de libertad**: Típicamente 3N para N partículas

### Aplicaciones Típicas
- Péndulos y osciladores
- Sistemas planetarios
- Colisiones de partículas
- Sistemas mecánicos complejos

---

## 2. Mecánica de Fluidos

### Variables Fundamentales
- **Densidad** (ρ): Masa por unidad de volumen
- **Velocidad del fluido** (v⃗): Campo vectorial de velocidades
- **Presión** (P): Fuerza normal por unidad de área
- **Viscosidad** (μ): Resistencia interna al flujo
- **Temperatura** (T): Estado térmico del fluido

### Ecuaciones Principales
- **Ecuación de continuidad**: ∂ρ/∂t + ∇·(ρv⃗) = 0
- **Ecuaciones de Navier-Stokes**: ρ(∂v⃗/∂t + v⃗·∇v⃗) = -∇P + μ∇²v⃗ + ρg⃗
- **Ecuación de Bernoulli**: P + ½ρv² + ρgh = constante
- **Ecuación de estado**: P = ρRT (gases ideales)

### Características del Sistema
- **Campos continuos**: Variables definidas en cada punto del espacio
- **No linealidad**: Término convectivo (v⃗·∇v⃗) introduce complejidad
- **Múltiples escalas**: Desde molecular hasta macroscópica
- **Disipación**: Irreversibilidad por viscosidad

### Aplicaciones Típicas
- Flujo en tuberías y canales
- Aerodinámica y hidrodinámica
- Meteorología y oceanografía
- Turbulencia y mezcla

---

## 3. Sistemas Eléctricos

### Variables Fundamentales
- **Corriente** (I): Flujo de carga eléctrica
- **Voltaje** (V): Diferencia de potencial eléctrico
- **Resistencia** (R): Oposición al flujo de corriente
- **Capacitancia** (C): Capacidad de almacenar carga
- **Inductancia** (L): Oposición al cambio de corriente

### Ecuaciones Principales
- **Ley de Ohm**: V = IR
- **Leyes de Kirchhoff**: 
  - ΣI = 0 (nodos)
  - ΣV = 0 (mallas)
- **Ecuaciones diferenciales**:
  - Capacitor: I = C(dV/dt)
  - Inductor: V = L(dI/dt)

### Características del Sistema
- **Linealidad**: La mayoría de componentes básicos son lineales
- **Superposición**: Válida para sistemas lineales
- **Respuesta transitoria y permanente**: Comportamiento temporal característico
- **Impedancia compleja**: Representación en dominio frecuencial

### Aplicaciones Típicas
- Circuitos RC, RL, RLC
- Filtros y amplificadores
- Sistemas de control eléctrico
- Redes de distribución eléctrica

---

## Análisis Comparativo

### Similitudes Matemáticas

| Aspecto | Mecánica Clásica | Mecánica de Fluidos | Sistemas Eléctricos |
|---------|------------------|---------------------|---------------------|
| **Ecuación tipo** | F = ma | ρ(Dv/Dt) = -∇P + F | L(dI/dt) + RI = V |
| **Variable de estado** | Posición/velocidad | Velocidad/presión | Corriente/voltaje |
| **Principio de conservación** | Energía/momento | Masa/energía/momento | Energía/carga |
| **Respuesta temporal** | Segunda derivada | Derivadas parciales | Primera derivada |

### Diferencias Fundamentales

#### Naturaleza del Sistema
- **Mecánica clásica**: Sistemas de partículas discretas
- **Mecánica de fluidos**: Medios continuos
- **Sistemas eléctricos**: Redes de componentes discretos

#### Complejidad Matemática
- **Mecánica clásica**: EDOs, generalmente solubles analíticamente
- **Mecánica de fluidos**: EDPs no lineales, requieren métodos numéricos
- **Sistemas eléctricos**: EDOs lineales, métodos de transformada

#### Predictibilidad
- **Mecánica clásica**: Altamente determinista (excepto sistemas caóticos)
- **Mecánica de fluidos**: Determinista pero computacionalmente complejo
- **Sistemas eléctricos**: Muy predecible para sistemas lineales

### Analogías Entre Sistemas

| Mecánica | Fluidos | Eléctrico |
|----------|---------|-----------|
| Fuerza (F) | Gradiente de presión (∇P) | Voltaje (V) |
| Masa (m) | Densidad × volumen (ρV) | Inductancia (L) |
| Velocidad (v) | Velocidad del fluido (v⃗) | Corriente (I) |
| Fricción | Viscosidad (μ) | Resistencia (R) |
| Elasticidad | Compresibilidad | Capacitancia (C) |

### Métodos de Análisis Comunes

1. **Análisis dimensional**: Verificación de consistencia en las tres áreas
2. **Métodos variacionales**: Principios de mínima acción
3. **Análisis de estabilidad**: Estudio de perturbaciones pequeñas
4. **Teoría de control**: Aplicable a los tres sistemas
5. **Simulación numérica**: CFD, integración de EDOs, SPICE

### Aplicaciones Interdisciplinarias

- **Biomecánica**: Combina mecánica clásica y fluidos
- **Electrohidrodinámica**: Interacción fluidos-electricidad
- **Mecatrónica**: Integración mecánica-eléctrica
- **Sistemas micro-electro-mecánicos (MEMS)**: Los tres dominios a escala microscópica