//sound chain
SinOsc s => dac;

//volume sweller function
fun void swell(float begin, float end, float grain)
{
    for ( begin => float j; j < end; j+grain => j )
    {
        j => s.gain; //set volume
        .01::second => now;
    }

    for ( end => float j; j > begin; j-grain => j ) //swell down
    {
        j => s.gain;//set vol
        .01::second => now;
    }
    
}

//MAIN Program
//loop
for( 0 => int i; i < A.cap(); i++ )
{
    Std.mtof(A[i]) => s.freq; //sets freq using Array A
    swell(.2, 1.0, .01); //calls swell function
    1::second => now; //advance time
}