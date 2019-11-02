G91                ; relative mode

G1 Z4 F200 S2      ; raise head to avoid dragging nozzle over the bed (ignore homing)
G1 X-240 F3000 S1  ; move up to 240mm in the -X direction, stopping if the homing switch is triggered
G1 X4 F600         ; move slowly 4mm in the +X direction
G1 X-10 S1         ; move slowly 10mm in the -X direction, stopping at the homing switch

M208 X0:154        ; Set X min and max so that it won't go below 0

G91                ; relative mode
G1 Z-4 F200 S2     ; lower the head again (ignore homing)

G90                ; back to absolute mode

