SndBuf click => dac;
SndBuf kick => dac;

//open sound files
me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_03.wav" => click.read;
//take away playback at initialization
kick.samples() => kick.pos;
click.samples() => click.pos;

//global vars
[1,0,0,0,1,0,0,0] @=> int kick_ptrn_1[];
[0,0,1,0,0,0,1,0] @=> int kick_ptrn_2[];
[1,0,1,0,1,0,1,0] @=> int click_ptrn_1[];
[1,1,1,1,1,1,1,1] @=> int click_ptrn_2[];

fun void section( int kickArray[], int clickArray[], float beattime)
{
    for(0 => int i; i < kickArray.cap(); i++)
    {
        if( kickArray[i] == 1)
        {
            0 => kick.pos;
        }
        
        if(clickArray[i] == 1)
        {
            0 => click.pos;
        }
        beattime::second => now;
    }
}

//MAIN PROGRAM
//loop infinitum
while ( true )
{
    section(kick_ptrn_1, click_ptrn_1, .2);
    section(kick_ptrn_2, click_ptrn_2, .2);
    section(kick_ptrn_1, click_ptrn_2, .2);
    section(kick_ptrn_2, click_ptrn_1, .2);

}