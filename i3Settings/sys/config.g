; ### General ###
M111 S0                             ; Debug off
M550 PTema3d                         ; Machine name (can be anything you like)
M551 Preprap                        ; Machine password (currently not used)
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xED ; MAC Address
M552 P0.0.0.0                       ; IP address (0 = use DHCP)
;M554 P192.168.1.1                  ; Gateway (not used yet)
M553 P255.255.255.0                 ; Netmask
;M555 P2                            ; Set output to look like Marlin
;M575 P1 B57600 S1                  ; Set auxiliary serial port baud rate and require checksum (for PanelDue)


; ### Movement ###
M569 P0 S0                         ; Drive 0 goes backwards (change to S0 to reverse it)
M569 P1 S0                          ; Drive 1 goes backwards
M569 P2 S0                         ; Drive 2 goes backwards
M569 P3 S0                         ; Drive 3 goes backwards
M569 P4 S0                         ; Drive 4 goes backwards
M574 X1 Y1 Z1 S1		            ; set homing switch configuration (X,Y,Z homing switch only, at low end, active low)
M906 X800 Y1000 Z800 E800           ; Set motor currents (mA)
M201 X800 Y800 Z15 E1000            ; Accelerations (mm/s^2)
M203 X15000 Y15000 Z100 E3600       ; Maximum speeds (mm/min)
M566 X600 Y600 Z30 E20              ; Maximum jerk speeds mm/minute
M208 X200 Y200 Z200                 ; set axis maxima and high homing switch positions (adjust to suit your machine)
M208 X-8 Y0 Z-0.5 S1                ; set axis minima and low homing switch positions (adjust to make X=0 and Y=0 the edges of the bed)
M92 X80 Y80 Z4000                   ; set axis steps/mm
M92 E420:420                        ; set extruder 0 and 1 steps/mm
G21                                 ; Work in millimetres
G90                                 ; Send absolute coordinates...
M83                                 ; ...but relative extruder moves


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