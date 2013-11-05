//sound chain
SinOsc s => dac;

//loop

for( 0 => int i; i <= 127; i++  )
{
    Std.mtof(i) => float Hz; //midi to hertz
    <<< i, Hz >>>;
    i*4 => s.freq;
    1 => s.gain;
    200::ms => now;
    
    if ( i > 1000)
    {
        0 => s.gain;
        0 => s.gain;
    }
}