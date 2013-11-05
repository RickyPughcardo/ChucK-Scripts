//random number generator
TriOsc s => dac.left;
SqrOsc t => dac.right;

.5 => t.gain;

//infinite loop

while( true )
{
    Math.random2(-440, 880) => int i; // generate random int
    i => s.freq;
    i => t.freq;
        else 
    {
        .5 => s.gain;
        .8 => t.gain;
    }
    <<< i >>>;
    .2::second => now;
    
    if ( i < 660 )
    {
        .2 => s.gain;
        .9 => t.gain;
    }
    

    
}