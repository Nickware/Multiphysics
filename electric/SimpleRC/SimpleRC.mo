model SimpleRC "Simple RC Circuit"
  parameter Real R = 1000.0 "Resistance in Ohms";
  parameter Real C = 1e-6 "Capacitance in Farads";
  parameter Real V_source = 5.0 "Source voltage";
  
  Real capacitor_v(start = 0.0, fixed = true) "Capacitor voltage";
  Real current(start = 0.0) "Circuit current";
  
equation
  current = C * der(capacitor_v);
  V_source = R * current + capacitor_v;
end SimpleRC;
