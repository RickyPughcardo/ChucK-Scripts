/*
Multi Channel Hardware
SinOsc sine => dac.chan(0);
TriOsc triangle => dac.chan(1);
*/

SinOsc sine => Pan2 p=> dac;
TriOsc triangle => dac.chan(1);

//hard pan
1.0 => p.pan;

//advance time
1::second => now;
// random number generator

//infinite loop

Math.srandom(440); //seed

while ( true )
{   
    Math.randomf() => float i; //gen random integer
   <<< "i ", i >>>; 
    i => 
    Math.random2f(1.1, 15.3) => float j;//gen random int between two ints
    <<< "j", j >>>;
    .25::second => now;
}