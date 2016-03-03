; This file should obviously be a combination of homex/y/z.
; It has small optimizations though like not raising z axis twice for x and y homing.

G91                ; relative mode

; Home Z first, then we can safely lift it a bit for x and y homing
G1 Z-240 F3000 S1  ; move 240mm in the -Z direction, stopping if the homing switch is triggered
G1 Z4 F600         ; move slowly 4mm in the +Z direction
G1 Z-10 S1         ; move slowly 10mm in the -Z direction, stopping at the homing switch

; Raize z a bit
G1 Z4 F200         ; raise head to avoid dragging nozzle over the bed

; Home X
G1 X-240 F3000 S1  ; move up to 240mm in the -X direction, stopping if the homing switch is triggered
G1 X4 F600         ; move slowly 4mm in the +X direction
G1 X-10 S1         ; move slowly 10mm in the -X direction, stopping at the homing switch

; Home Y
G1 Y-240 F3000 S1  ; move up to 240mm in the -Y direction, stopping if the homing switch is triggered
G1 Y4 F600         ; move slowly 4mm in the +Y direction
G1 Y-10 S1         ; move slowly 10mm in the -Y direction, stopping at the homing switch

; Home Z back
G1 Z-10 S1         ; move slowly 10mm in the -Z direction, stopping at the homing switch

G90                ; back to absolute mode