ST Programming Language:

https://en.wikipedia.org/wiki/Structured_text

Dev environment:

https://en.wikipedia.org/wiki/Automation_Studio


## 1. PLC-Garage-System.

Sequence:

    1) car gets in front of the gate
    2) photo electric sensor which is set straight from the gate change its state, gate is getting up until top is reached
    3) car drives inside
    4) second photo electric sensor which is mounted inside, gets activated, gate is getting down until bottom is reached
    5) end of the sequence

## PLC-Garage-System security requirements:
A. It must be considered that the wiring of the top and bottom sensors may be damaged/cuted.

B. It must be considered that s1 or s2 sensor may start flickering which could cause the motor to constantly switch over

## PLC-Garage-System - ilustration
![Ilustration](./overview.jpg)

