//sound chain
TriOsc chord[3];
//master gain
Gain master => dac;
for( 0 => int i; i < chord.cap(); i++)
{
    //use array to chuck unit generator to master
    chord[i] => master;
    1.0/chord.cap() => chord[i].gain;
}

//function: root - starting root note, quality - major or minor, length - time
fun void playChord( int root, string quality, float length)
{
    //function will make major or minor chords
    
    //root
    Std.mtof(root) => chord[0].freq;

    //third
    if ( quality == "major")
    {
        Std.mtof(root+4)*.5 => chord[1].freq;
    }
    else if( quality == "minor" )
    {
        Std.mtof(root+3)*.5 => chord[1].freq;
    }
    else
    {
        <<< "must specify 'major' or 'minor' " >>>;
    }
    //fifth
    Std.mtof(root+7)*.5 => chord[2].freq;
    length::ms*2 => now;
    }
//MAIN PROGRAM
    //infinite loop

fun void section( int kickArray[], int clickArray[], float beattime )
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
        1::quarter => now;
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
    playChord(Math.random2(51,63), "minor", 1000);

}