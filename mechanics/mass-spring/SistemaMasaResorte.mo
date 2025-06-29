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