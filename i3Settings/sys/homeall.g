; This file should obviously be a combination of homex/y/z except it could have small optimizations
;G28 X Y
;G32

G91                ; relative mode

M208 X-2 Y-36 S1   ; Set X,Y min so that S1 mode below will set current position to them

G1 Z10 F200 S2      ; raise head to avoid dragging nozzle over the bed (ignore homing)

; ## Homing X
G1 X-240 F3000 S1  ; move up to 240mm in the -X direction, stopping if the homing switch is triggered
G1 X4 F600         ; move slowly 4mm in the +X direction
G1 X-10 S1         ; move slowly 10mm in the -X direction, stopping at the homing switch

; ## Homing y
G1 Y-240 F3000 S1  ; move up to 240mm in the -Y direction, stopping if the homing switch is triggered
G1 Y4 F600         ; move slowly 4mm in the +Y direction
G1 Y-10 S1         ; move slowly 10mm in the -Y direction, stopping at the homing switch

G90                ; back to absolute mode
G1 X0; Go to 0
G1 Y0; Move to y = 0
M208 X0:154 Y0:240 ; Set X, Y min and max so that it won't go below 0

; ## Homing Z
G1 X70 Y120 F3000 ; Center the probe
G30; Single z-probe to establish 0 height.

G91                ; relative mode
G1 Z-4 F200 S2     ; lower the head again (ignore homing)

G90                ; back to absolute mode
