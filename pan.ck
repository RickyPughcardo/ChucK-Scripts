/*
Multi Channel Hardware
SinOsc sine => dac.chan(0);
TriOsc triangle => dac.chan(1);
*/

SinOsc sine => Pan2 p=> dac;


//hard pan
1.0 => float panPosition;

while ( panPosition > -1.0 )
{
    panPosition => p.pan; //pan value
    <<< panPosition - .01 => panPosition >>>;
    .01::Second => now;
    }
    

//advance time
1::second => now;

// random number generator

//infinite loop
