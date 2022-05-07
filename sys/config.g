; Configuration file for Duet 3 Mini 5+ (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.2.3 on Wed May 26 2021 22:02:28 GMT-0600 (Mountain Daylight Time)

; General preferences
G90                                                	  ; send absolute coordinates...
M83                                                	  ; ...but relative extruder moves
M550 P"Dabus-E5Pd"                                    ; set printer name
M80	C"pson"												  ;set AXT power state ON

; Drives
M569 P0.0 S0 D3 V40                                   ; X physical drive 0.0 goes backwards SteathChop to ~250mm/s
M569 P0.1 S0 D3 V40                                   ; Y physical drive 0.1 goes backwards SteathChop to ~250mm/s
M569 P0.2 S0 D3 V20                                   ; Z1 (left) physical drive 0.2 goes backwards SteathChop to ~50mm/s
M569 P0.3 S1 D2                                       ; E0 physical drive 0.3 goes forwards pinned in SpreadCycle
M569 P0.4 S0 D3 V20                                   ; Z2 (right) physical drive 0.4 goes backwards Slave to Z as Z2
M584 X0.0 Y0.1 Z0.2:0.4 E0.3                          ; set drive mapping
M350 X16 Y16 Z16 E16 I1                               ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z800.00 E830.00                     ; set steps per mm
M566 X400.00 Y400.00 Z50.00 E120.00                   ; set maximum instantaneous speed changes (mm/min)
M203 X10800.00 Y10800.00 Z500.00 E3600.00             ; set maximum speeds (mm/min)
M201 X600.00 Y600.00 Z100.00 E3600.00                 ; set accelerations (mm/s^2)
M906 X580 Y600 Z650 E700 I30                          ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                               ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                                   ; set axis minima
M208 X360 Y360 Z400 S0                             ; set axis maxima

; Endstops
M574 X2 S1 P"io6.in"                               ; configure active-high endstop for high end on X via pin io6.in
M574 Y2 S1 P"io5.in"                               ; configure active-high endstop for high end on Y via pin io5.in
M574 Z1 S2                                         ; configure Z-probe endstop for low end on Z
M671 X-23:386 Y180:180 S3	                       ; Define lead scew locations

; Filliment sensor
M591 D0 P7 C"io4.in" L7 R50:200 E15 S1			   ; BTT Smart Filiment sensor

; Z-Probe
M950 S0 C"io3.out"                                 ; create servo pin 0 for BLTouch
M558 P9 C"^io3.in" H5 F1000:120 T7000 A6           ; set Z probe type to bltouch and the dive height + speeds
; Z OFFSET HERE
G31 P25 X-30 Y-3 Z2.762                            ; set Z probe trigger value, offset and trigger height
M671 X-23:386 Y180:180 S3			               ; Define lead scew locations
;M557 X40:320 Y20:340 S20                           ; define mesh grid
M557 X40:320 Y20:340 P5:5                          ; define mesh grid -- quck for leveling

; Heaters
M308 S0 P"temp0" Y"thermistor" T100000 B4138        ; configure sensor 0 as thermistor on pin temp0 SLice Engineering
M950 H0 C"out0" T0                                 ; create bed heater output on out0 and map it to sensor 0
M307 H0 B0 S1.00                                   ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                            ; map heated bed to heater 0
M143 H0 S150                                       ; set temperature limit for heater 0 to 150C
M308 S1 P"temp1" Y"thermistor" T98801 B4185        ; configure sensor 1 as thermistor on pin temp1
M950 H1 C"out1" T1                                 ; create nozzle heater output on out1 and map it to sensor 1
M307 H1 B0 S1.00                                   ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S280                                       ; set temperature limit for heater 1 to 275C
M308 S2 P"mcutemp" Y"mcutemp" A"Duet Board"        ; Configure MCU sensor

; Fans
M950 F0 C"out5" Q64                             ; create fan 0 on pin out5 and set its frequency -Removed Q500
M106 P0 S0 H-1                                     ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"out6" Q64                            ; create fan 1 on pin out6 and set its frequency - Removved Q500
M106 P1 S1 H1 T45 L1 B0.5                                 ; set fan 1 value. Thermostatic control is turned on
;M950 F2 C"out3" Q500                               ; create fan 2 on pin out3 and set its frequency
;M106 P2 S1 H1:0 T45                                ; set fan 2 value. Thermostatic control is turned on
M950 F3 C"out4"  Q64                              ; create fan 3 on pin out4 and set its frequency -Reomoved 500
M106 P3 S255 H2 T25 C"Case Fan"                   ; Set fan 2. Manages Duet board fan.

; Filiment envronment sensors
M308 S10 P"io2.out+io2.in" Y"dht22" A"Fil Temp[C]"
M308 S11 P"S10.1" Y"dhthumidity" A"Fil Hum[%]"

; Tools
M563 P0 S"Mosquito" D0 H1 F0                     ; define tool 0
G10 P0 X0 Y0 Z0                                    ; set tool 0 axis offsets
G10 P0 R0 S0                                       ; set initial tool 0 active and standby temperatures to 0C
	
; Custom settings are not defined

; Miscellaneous
M575 P1 S1 B57600                                  ; enable support for PanelDue
M501                                               ; load saved parameters from non-volatile memory
M911 S10 R11 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" ; set voltage thresholds and actions to run on power loss
T0                                                 ; select first tool

