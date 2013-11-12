//sequencer

//sound cha
SndBuf kick => dac;
SndBuf hihat => dac;
SndBuf snare => dac;

//load soundfiles into sndbuf

me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/hihat_01.wav" => hihat.read;
me.dir() + "/audio/snare_01.wav" => snare.read;

//set playheads to end so no sound is made
kick.samples() => kick.pos;
hihat.samples() => hihat.pos;
snare.samples() => snare.pos;

//initialie counter variable (for following measures_
0 => int counter;

while( true )
{
    //beat goes from 0 to 7 (8 noteS)
    counter % 8 => int beat;   
    if ( beat == 0 || beat == 4 )
        {
        0 => kick.pos;
        }
        <<< "Counter: ", counter, "Beat: ", beat >>>;
        counter++;
        125::ms => now;
}