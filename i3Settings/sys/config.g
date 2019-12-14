; ### General ###
M111 S0                             ; Debug off
M550 PTema3d                         ; Machine name (can be anything you like)
M551 Preprap                        ; Machine password (currently not used)
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xED ; MAC Address
M552 P192.168.137.2                       ; IP address (0 = use DHCP)
;M554 P192.168.1.1                  ; Gateway (not used yet)
M553 P255.255.255.0                 ; Netmask


; ### Movement ###
G21                                 ; Work in millimetres
G90                                 ; Send absolute coordinates...
M83                                 ; ...but relative extruder moves
M569 P0 S0                          ; Drive 0 (X) goes backwards (change to S0 to reverse it)
M569 P1 S0                          ; Drive 1 (Y) goes backwards
M569 P2 S1                          ; Drive 2 (Z) goes forwards
M569 P3 S0                          ; Drive 3 (extruder 1) goes backwards
M569 P4 S1                          ; Drive 4 (extruder 2) goes forwards
M574 X1 Y1 Z1 S1                    ; set homing switch configuration (X,Y,Z homing switch only, at low end, active low)

M906 X1000 Y1000 Z800 E500:500 30 ; Set motor currents (mA)
M906 X800 Y800 Z800 E500:500 30 H1; Set motor currents (mA) for homing

M201 X700 Y700 Z15 E1000            ; Accelerations (mm/s^2)
M203 X15000 Y15000 Z150 E350        ; Maximum speeds (mm/min)
M566 X600 Y600 Z30 E20              ; Maximum jerk speeds mm/minute

; !!!!These are also set in homex.g, homey.g, homeall.g
; M208 X2:156 Y36:276 Z200  ; Set axis max and min (adjusted to fit my bed)

M92 X80 Y80 Z4000                   ; set axis steps/mm

; e_steps_per_mm = (motor_steps_per_rev * driver_microstep) * (big_gear_teeth / small_gear_teeth) / (hob_effective_diameter * pi)
; e_steps_per_mm = (200 * 16) * (3/1) / (hob_effective_diameter * pi)
M92 E415:415                        ; set extruder 0 and 1 steps/mm; Need reduce to to 95%?

; ### Heater and thermistor ###
; Heaters:
M307 H1 A436.8 C165.1 D3.5 S1.00 V0.0 B0; PID setup for the main heater (after auto-tuning)
; M307 H1 A421.1 C181.1 D3.7 S1.00 V0.0 B0 ; PID setup for the main heater (after auto-tuning)
; M301 H1 P10 I0.10 D100 T0.50 S1.0	; PID settings for heater 0 (bed)

;M301 H1 P10 I0.10 D100 T0.50 S1.0	; PID settings for heater 1 (extruder)

; Avoiding bed heater fault workaround:
M570 H0 P20 T20 ; Allow anomaly of temperature for 20 seconds, and temperature disparity of 20C.
M143 H0 S140 ; Set max bed temperature to 140

; Thermistors:
M305 P0 T100000 B3950 R4700 H-2           ; Bed thermistor (generic chinese)
M305 P1 T100000 B4725 C7.06e-8 R4700 H5 ; Extruder thermistor (e3d thermistor)

M570 S120; Increase to allow extra heating time if needed

; ### Tool definition ###
M563 P0 D0 H1         ; tool 0 uses extruder drive 0 and heater 1
G10 P0 S0 R0 X0 Y0    ; set tool 0 temperatures and offsets

; ### Epilogue ###
T0                  ; Select the first tool

; ### Config Z-probe (BLTouch) ###
M307 H3 A-1 C-1 D-1; We're using "Heater 3" as control for BLTouch. We're disabling it here.
M558 P9 H10 F100 T2000; Set Z-probe mode to 9 (BLTouch). 'H' = Dive height (5mm). F100 (probing speed mm/min) T2000 (Tnnn Travel speed to and between probe points (mm/min))
G31 X31.5 Y1.4 Z3.24 P25 ; Configure probe offsets from nozzle. P is signal threshold.
; Trigger height1: 3.36
; Trigger height2: 3.364

; ### Mesh bed probing ### 
M557 X32:154 Y5:235 S30.5:40 ; probe from X=0 to 100, Y=0 to 230mm with 5x5 points in x and y directions.

; ### Fans ###
M106 P1 T45 H1; heat breaker fan is thermostatic, turn it on only if temp > 45c.

