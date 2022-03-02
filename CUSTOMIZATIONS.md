# Marlin 3D Printer Firmware

## MintyPrinter Edition

This is a modification of the base Marlin firmware for the large 3D printer.
It is probably useless to you unless you have an old InDimension Glacier Summit printer that has been heavily customized and upgraded.

Configs and notes refer to this specific printer.

## Hardware:

### Z
Z Axis seems to have perodic error!

Print 2cm block in vase mode, count layers, and periods.

.15mm layers, 20mm total = 133 Layers.

Looks like 20 TPI thread, 1.27mm pitch.

15.74 revolutions of Z axis thread, this is my guess for # Z bands

Yes! A tiny bit less than 16 bands in the block, will look at lower Z pulleys

Bed heater fuse holder damaged, [color=#FF0000]wire getting SO hot! [/color]

### Y
Y axis, belt and idler setup is STUPID.

* problem 1: Teeth run on smooth idlers, much vibration! Sad!
* problem 2: Belt pulls at angle at far ends of Y axis. Systematic trigonometric error over Y travel, Fake News!
* problem 3: Y belt rubs on Z belt!

Make Y axis great again: Added half twist, swapped rear idler. Even nicer to have toothed idler on back. Angle reduced!

### Extruders

E2 fan dead Fixed

Heating elements 15v open circuit, 2 ohm

Heat blocks and barrels covered and filled with burnt plastic.

Bad assembly, remember assembly order and nozzle locked to barrel!

need 55mm m6 1.75m barrels

Ordered 50mm, best I could do, should work.

Extruder fans always on why? Because they are attached to 12v power rail, not fan connections.
We could connect them there and turn them on above a certain extruder temp, but I also want fans for a print cooler to be added later, and for the controller fan...

## Controller:

Megatronics v2.0 Rev D

Front Panel: Panucatt Devices Viki LCD https://www.panucatt.com/product_p/vikilcd.htm

LCD: JHD629-204a

Extruders are on thermocouples

Bed is on thermistor on T2

Extruder heaters are on SCRs

Bed heater is on a relay, no pwm!

## Firmware:

To read flash

`C:\Progra~2\Arduino\hardware\tools\avr\bin\avrdude -C C:\Progra~2\Arduino\hardware\tools\avr\etc\avrdude.conf -p m2560 -b115200 -c stk500v2 -P COM3 -U flash:r:output.bin:r -n`


Output:

```
start
echo: External Reset
Marlin 1.0.0
echo: Last Updated: Aug  1 20136-7-201310:34:01 | Author: Jeff Christiana @ inDimension3
Compiled: Aug  1 2013
echo: Free Memory: 4184  PlannerBufferBytes: 1232
echo:Hardcoded Default Settings Loaded
echo:SD init fail
```

M115:
`FIRMWARE_NAME:Marlin V1; Sprinter/grbl mashup for gen6 FIRMWARE_URL:http://www.mendel-parts.com PROTOCOL_VERSION:1.0 MACHINE_TYPE:Mendel EXTRUDER_COUNT:2`

Current Settings:
```
Control
 Temperature
  nozzle: 0
  nozzle2: 0
  nozzle3: 0
  bed: 0
  fanspeed: 0
  autotemp: off
  t min 210
  t max 250
  t fact 000.10
  pid-p +022.20
  pid-i  + 001.08
  pid-d +114.00
  pid-c 1
  preheat pla
    fan 255
    nozzle 180
    bed 70
  preheat abs
    fan 255
    nozzle 240
    bed 100
 Motion
  accel 3000
  Vxy-jerk 20
  Vzjerk +000.40
  Ve-jerk 5
  Vmax x 500
  Vmax y 500
  Vmax z 1
  Vmaxe 45
  Vmin 0
  Vtravmin 0
  Amax x 900
  Amax y 900
  Amax z 80
  Amax e 10000
  A-retract 3000
  X-step/mm +080.00
  Y-steps/mm +158.00
  Z-steps/mm +6720.0
  E-steps/mm +1380.0
```
