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
M569 P0 S0                         ; Drive 0 (X) goes backwards (change to S0 to reverse it)
M569 P1 S0                         ; Drive 1 (Y) goes backwards
M569 P2 S1                         ; Drive 2 (Z) goes forwards
M569 P3 S1                         ; Drive 3 (extruder 1) goes forwards
M569 P4 S1                         ; Drive 4 (extruder 2) goes forwards
M574 X1 Y1 Z1 S1		            ; set homing switch configuration (X,Y,Z homing switch only, at low end, active low)
M906 X1000 Y1000 Z800 E500:800 30         ; Set motor currents (mA)
M906 X800 Y800 Z800 E500:800 30 H1      ; Set motor currents (mA) for homing
M201 X700 Y700 Z15 E1000            ; Accelerations (mm/s^2)
M203 X15000 Y15000 Z100 E3600       ; Maximum speeds (mm/min)
M566 X600 Y600 Z30 E20              ; Maximum jerk speeds mm/minute
M208 X159 Y250 Z200                 ; set axis maxima and high homing switch positions (adjust to suit your machine)
M208 X0 Y0 Z0.0 S1                  ; set axis minima and low homing switch positions (adjust to make X=0 and Y=0 the edges of the bed)
M92 X80 Y80 Z4000                   ; set axis steps/mm
M92 E451:451                        ; set extruder 0 and 1 steps/mm; Need reduce to to 95%?

; ### Heater and thermistor ###
M305 P0 T100000 B3950 R4700 H0 L0	; Put your own H and/or L values here to set the bed thermistor ADC correction
M305 P1 T100000 B4388 R4700 H0 L0	; Put your own H and/or L values here to set the first nozzle thermistor ADC correction
;M305 P2 T100000 B4388 R4700 H0 L0	; Put your own H and/or L values here to set the second nozzle thermistor ADC correction
M301 H1 P10 I0.10 D100 T0.50 S1.0	; PID settings for extruder 0
;M301 H2 P10 I0.10 D100 T0.50 S1.0	; PID settings for extruder 1
M570 S120				; Increase to allow extra heating time if needed
;M141 H3                                ; Uncomment this to set chamber heater/thermistor channel

; ### Tool definition ###
M563 P0 D0 H1         ; tool 0 uses extruder drive 0 and heater 1
G10 P0 S0 R0 X0 Y0    ; set tool 0 temperatures and offsets

; ### Epilogue ###
T0                  ; Select the first tool

; ### Config Z-probe ###
M558 P1 X0 Y0; Enable the probe, but home only Z (no X or Y) with it.
G31 P500 Z0.98; Set z height to 1.0

; ### 5-point z probe ### 
M557 P0 X0.0 Y0.0; Z-plane leveling point #0
M557 P1 X0.0 Y230.0; Z-plane leveling point #1
M557 P2 X150.0 Y230.0; Z-plane leveling point #2
M557 P3 X150.0 Y0.0; Z-plane leveling point #3
M557 P4 X80.0 Y110.0; Z-plane leveling point #4

; ### Fans ###
M106 P0 I0 S100; Start nozzle fan (needs to be inverted (i0))
M106 P0 I0 S0; Stop nozzle fan (needs to be inverted (i0))