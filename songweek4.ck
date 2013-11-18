//sound chain -- Array
SqrOsc chord[3];
SndBuf click => dac;
SndBuf kick => dac;

//master gain
Gain master => dac; 

//Duration
0.6::second => dur quarter;

//audio samples
me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_03.wav" => click.read;

//note to be used in song (the Eb Mixolydian mode)
[51, 53, 55, 56, 58, 60, 61, 63] @=> int scale[];

for( 0 => int i; i < scale.cap(); i++)
{
    //use array to chuck unit generator to master
    scale[i] => master;
    1.0/scale.cap() => scale[i].gain;
}

//function: root - starting root note, quality - major or minor, length - time
fun void playChord( int root, string quality, float length)
{
    //function will make major or minor chords
    
    //root
    Std.mtof(root) => scale[0].freq;

    //third
    if ( quality == "major")
    {
        Std.mtof(root+4)*.5 => scale[1].freq;
    }
    else if( quality == "minor" )
    {
        Std.mtof(root+3)*.5 => scale[1].freq;
    }
    else
    {
        <<< "must specify 'major' or 'minor' " >>>;
    }
    //fifth
    Std.mtof(root+7)*.5 => scale[2].freq;
    length::ms*2 => now;
    }
//MAIN PROGRAM
    //infinite loop
while( true )
{
    playChord(Math.random2(51,63), "minor", 1000);

}
