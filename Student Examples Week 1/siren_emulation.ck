<<< "Assignment 1 - Siren emulation" >>>;
// The idea is to use a variable that first increases from value x to value y by one
// and when it reaches the value y, it starts decreasing from y to x by one and the
// process repeats when it goes back to x. This variable is involved in a frequency
// assignment and thus we get a siren sound.

// The program uses tools only from the first video lectures.

// create a Triangle oscillator
TriOsc s1 => dac;

// initialize variables
700 => float f;
343 => float v;
-90 => int vt;
0 => int state;

// set a point 30 seconds in the future
now + 30::second => time end;

// while we are not past that point
while(now < end) {
    
    // state = 0 tells us that vt should keep increasing by one if vt < 90
    if (vt < 90 && state == 0){
        f * v / (v - vt) => s1.freq;
        0.2 => s1.gain;
        vt++;
        0.005::second => now;
    }

    // if vt reaches 90 change the value of state to 1. This now tells us that
    // vt should keep decreasing by one until it reaches -90
    else {
        f * v / (v - vt) => s1.freq;
        0.2 => s1.gain;
        vt--;
        1 => state;
        0.005::second => now;
    }
    
    // if we reach vt = -90 we change the value of state to 0 so that vt
    // starts increasing again inside the if block
    if (vt == -90){
        0 => state;
    }
}