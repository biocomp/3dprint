G91                ; relative mode
G1 Z-240 F3000 S1  ; move 240mm in the -Z direction, stopping if the homing switch is triggered
G1 Z4 F600         ; move slowly 4mm in the +Z direction
G1 Z-10 S1         ; move slowly 10mm in the -Z direction, stopping at the homing switch
G90                ; back to absolute mode