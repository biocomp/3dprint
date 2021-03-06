# 3d printer troubleshooing - my issues and solutions

## Not sticking to bed
    
- Calibrated nozzle to bed distance.
- Added clear hair spray (this is really nice, but I should try to get away from it, if possible).
- Set bed temp to 60. But that might be too low. People are using 70-80, _I should definitely try that_.
- Added skirt, with hair spray and 60c, this is only needed for small parts.

## Overextruding
See this (my) thread: http://forums.reprap.org/read.php?4,705899,705912
![My overextrusion]http://forums.reprap.org/file.php?4,file=83502
Struggled with this one for a while, till I realized that:

- I'm using too many perimieters (5) - adjusted slic3r to use 1 or 2 perimeters.
- fillament size is actually 1.77, and not 1.75 - adjusted slic3r settings for actual size.
  
## Curling of corners (not first layer)
Something like this: https://www.simplify3d.com/support/print-quality-troubleshooting/#curling-or-rough-corners).
I need to try:
- This helped a bit: Lower temperature (Indeed, looks like 195 I'm priting PLA with is a bit too high. I am using active print cooling already). Lowered to 185 for all but first layers.
- Slower speed. Lowered speed for most things.
- This made noticeable difference: enabled unconditional layer cooling. With smart cooling in slic3r, it did not enable fan in all necessary places, and I couldn't even figure out what the logic was. But when fan is always enabled (it's actually still disabled for layer 1, which is a good thing), this seems to help with curling. 

## Layer shifting 
Something like this: https://www.simplify3d.com/support/print-quality-troubleshooting/#layer-shifting-or-misalignment).

Struggled with this with killbot (http://www.thingiverse.com/thing:1579755). Even added active cooling for drivers, and increased current, and tighteneed belts. Did not help.
Then I finally say what happens! __The curling (from previous item), causes the printer head to hit the print, and then it misses X and Y steps__. Need to fix curling!
In addition, __my distance sensor board was too low, and it was hitting even legitimate bumps on the print__.
This board, which is otherwise pretty cool: https://miscsolutions.wordpress.com/mini-height-sensor-board.