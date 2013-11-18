//sound chain
SndBuf click => dac;

//read sound file
me.dir() + "/audio/stereo_fx_01.wav" => click.read;
//set playhead and end of file so no initial sound
click.samples() => click.pos;

//function
fun void granularize( int steps )
{
    //samples/steps => grain size
    click.samples()/steps => int grain;
    //randmoly set
    Math.random2(0, click.samples()-grain) => click.pos;
    grain::samp => now;
}

while( true ) 
{
    granularize(20);
}