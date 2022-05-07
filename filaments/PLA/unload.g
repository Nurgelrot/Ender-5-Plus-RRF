M291 P"Please wait while the nozzle is being heated up" R"Unloading PLA" T5 ; Display message
G10 S205 ; Heat up the current tool to 100C
M116 ; Wait for the temperatures to be reached
M291 P"Retracting filament..." R"Unloading PLA" T5 ; Display another message
G1 E-20 F300 ; Retract 20mm of filament at 300mm/min
G1 E-70 F1000 ; Retract 70mm of filament at 1000mm/min
M400 ; Wait for the moves to finish
M292 ; Hide the message again
M84 E0 ; Turn off extruder
