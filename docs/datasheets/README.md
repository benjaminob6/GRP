Datasheets
====================
This section holds datasheets for hardware items of interest.

SN74LVC245
--------------------
The SN74LVC245 is an 8 channel Logic Level Converter useful for mixed 3.3/5V systems. The currently selected ARM controller is a 3.3V device, and while 5V tolerant to inputs, it has no easy way to generate 5V output. A few of these chips can be used to step up the ARM's 3.3V signals to the 5V logic levels the Arcom DI/O expects and vice versa. A standard Non-Inverting buffer would work just as well if the use of 5V tolerant microprocessor continues. If the switch is made to a non-5V tolerant MCU, these will be necessary.
