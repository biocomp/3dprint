G91                ; relative mode

G1 Z10 F200 S2 ; raise head to avoid dragging nozzle over the bed (ignore homing)
G1 X70 Y120 F3000 ; Center the probe
G30; Single z-probe to establish 0 height.