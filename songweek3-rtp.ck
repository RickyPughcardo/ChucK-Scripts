
//sequencer
//Instruments
Gain instrumentMaster => dac;

SqrOsc chords => instrumentMaster.left;
SqrOsc chords2 => instrumentMaster.left;
SqrOsc chords3 => instrumentMaster.left;
SqrOsc chords4 => instrumentMaster.left;
SqrOsc chords5 => instrumentMaster.left;
TriOsc melody => JCRev r => Chorus c => instrumentMaster.right;
//sound chain - Master is the parent DAC, all sample buffers chucked to Master
Gain master => dac;
SndBuf kick => master;
SndBuf hihat => master;
SndBuf snare => master;
//load soundfiles into sndbuf
.3 => instrumentMaster.gain;
.6 => master.gain;
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
   //kick drum  on 0 & 4 or Beat 1 and Beat 5 
    if ( beat == 0 || beat == 4 || beat == 3 )
        {
        0 => kick.pos;
        Math.random2f(.4, .7) => kick.gain;
        Std.mtof(55)*.5 => chords.freq;//G
        Std.mtof(60*.5) => chords2.freq;//C
        Std.mtof(59)* 2 => chords3.freq;//B
        Std.mtof(52)*2 => chords4.freq;//E
        Std.mtof(55)*2 => chords5.freq;//G
        }
        
    if (beat == 2 || beat == 6){
        0 => snare.pos;
        Math.random2f(.4, .7) => kick.gain;
       
    }
        
    
        <<< "Counter: ", counter, "Beat: ", beat >>>;
        counter++;
        125::ms => now;
}