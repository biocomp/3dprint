G91                ; relative mode

G1 Z4 F200 S2      ; raise head to avoid dragging nozzle over the bed (ignore homing)
G1 Y-240 F3000 S1  ; move up to 240mm in the -Y direction, stopping if the homing switch is triggered
G1 Y4 F600         ; move slowly 4mm in the +Y direction
G1 Y-10 S1         ; move slowly 10mm in the -Y direction, stopping at the homing switch

M208 Y0:240        ; Now set real limits, so that head won't go below 0

G91                ; relative mode
G1 Z-4 F200 S2     ; lower the head again (ignore homing)

G90                ; back to absolute mode