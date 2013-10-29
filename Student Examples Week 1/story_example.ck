// Author: XXXXXXXXX
// Date:   10/13/2013
// Prog:   SIRENS

<<< "Assignment_1_Sirens_Decoder_Bomb" >>>;


// This program tells the story of a hero trying to decode a bomb.
// We hear multiple rounds of sirens and decode attempts.
// In the end, the hero fails and the bomb explodes.



// Pitch variables
/* one semitone is the twelfth root of two kHz
the 12th root of 2 can be expressed as 2 ^ (1/12)
so, e.g., since middle A is 440 kHz 
middle A# would be (440)(2^(1/12)) = 466.16 kHz
There's probably a much better mechanism built into ChucK,
but we were instructed to not search the documentation,
so this is what I've come up with for finding scale tones.
*/

440 => float A;
2^(1/12) => float semitone;
semitone * 2 => float wholestep;
semitone * 3 => float minorthird;
semitone * 4 => float majorthird;
semitone * 5 => float perfectfourth;
semitone * 7 => float perfectfifth;
semitone * 9 => float majorsixth;
semitone * 12 => float octave;

// The oscillators
TriOsc tri => dac;
SinOsc sin => dac;
SawOsc saw => dac;
SqrOsc sqr => dac;

// Their properties
A => float freq;
0.3 => float vol;

// Counting & looping variables
int i, j, x;
90 => int noteCount;
3 => int repCount; // 4 -> 24.08 sec
5::ms => dur wailNoteDur;
800::ms => dur stutterNoteDur;
45::ms => dur randomNoteDur;
300::ms => dur stopDur;
300 => int randomPitchFloor;
900 => int randomPitchCeiling;
30 => int randomStopFloor;
50 => int randomStopCeiling;
30 => int decoderRepCount;
4100 => int bombRepCount;
1::ms => dur bombNoteDur;


0::ms => dur totalTime; // total needs to be 30 sec for assignment


// play the sirens repCount times
for (0 => x; x < repCount; x++) {
    
    // Wailing tri & sin siren
    // _________________________________________________
    <<< "Wailing Siren . . . Explosion Immanent . . ." >>>;
    
    vol => tri.gain; // on
    vol => sin.gain; // on
    0 => saw.gain; // off
    0 => sqr.gain; // off
    
    freq => tri.freq;
    freq => sin.freq;
    
    for (0 => j; j < repCount; j++) {
        0 => i;
        440 => freq; // reset
        // tri osc goes up in pitch while sin plays one note
        while (i <= noteCount) {
            freq + 5 => freq;
            freq => tri.freq;
            wailNoteDur => now;            
            totalTime + wailNoteDur => totalTime;
            i++;
        }
        0 => i;
        // sin osc goes down in pitch while tri plays one note
        while (i < noteCount) {        
            freq - 5 => freq;
            freq => sin.freq;
            wailNoteDur => now;
            totalTime + wailNoteDur => totalTime;
            i++;
       }
    }// end wailing siren loop
    
    
    // Stuttering saw and sin siren
    // _________________________________________________
    <<< "Stuttering Siren . . . Explosion Immanent . . ." >>>;
    
    vol => sin.gain; // off
    0 => tri.gain; // off
    0 => sqr.gain; // off
    vol => saw.gain; // on
    
    for (0 => j; j < repCount; j++) {
        
        // play for stutterNoteDur duration    
        vol/3 => saw.gain; // saw is a little annoying; turn it down
        vol => sin.gain;
        stutterNoteDur => now;
        totalTime + stutterNoteDur => totalTime;
        
        // silence for stopDur duration
        0 => saw.gain;
        0 => sin.gain;
        stopDur => now;
        totalTime + stopDur => totalTime;
    }// end stuttering siren loop
    
    
    
    // Randomized square and sin decoder sound
    // This is the sound of our hero trying to decode
    // the bomb.
    // _________________________________________________
    <<< "Attempting to decode the bomb . . ." >>>;
    
    0 => tri.gain; // off
    vol => sin.gain; // on
    0 => saw.gain; // off
    vol => sqr.gain; // on
    
    
    // generate some random pitches & their minor thirds
    0 => i;
    while (i <= decoderRepCount) {
        
        // generate a random pitch
        Math.random2f (randomPitchFloor, randomPitchCeiling) => float randomPitch;
        
        // generate a random stop duration as float, convert to dur
        Math.random2f (randomStopFloor, randomStopCeiling) => float randomStop;
        randomStop::ms => dur randomStopDur;
        
        // play that random pitch with square osc & its minor 3rd with sin
        vol => sqr.gain;
        vol => sin.gain;
        randomPitch => sqr.freq;
        randomPitch + minorthird => sin.freq;
        randomNoteDur => now;
        totalTime + randomNoteDur => totalTime;
        
        // pause a random duration before going on
        0 => sqr.gain;
        0 => sin.gain;
        randomStopDur => now;
        totalTime + randomStopDur => totalTime;
        
        i++;
    }// end random siren loop
    
    
}// end sirens loop



// Decode attempts fail. Bomb explodes.
// _________________________________________________
<<< "Failure. The bomb explodes." >>>;

vol => tri.gain; // off
vol => sin.gain; // on
vol => saw.gain; // off
vol => sqr.gain; // on
0 => i;
while (i < bombRepCount) {
    
    // generate
    Math.random2f (randomPitchFloor, randomPitchCeiling) => float randomPitch;
    
    // play that random pitch with nearby notes on all oscs
    // this should sound like white noise for sufficiently small
    // note durations
    randomPitch => sqr.freq;
    randomPitch + semitone => saw.freq;
    randomPitch + wholestep => tri.freq;
    randomPitch + minorthird => sin.freq;
    bombNoteDur => now;
    totalTime + bombNoteDur => totalTime;
    
    i++;
}// end bomb loop


// Calculate the total run time in seconds (it's in ms now)
// 1 ms in ChucK is 44.1 kHz
// So ... to convert totalTime from kHz to milliseconds, we divide by 44.1
// And then to get seconds, we divide by 1000

// NOTE: Because of the random durations in the decoder, total run time
//       will probably never be exactly 30 seconds, but it will always
//       be close.

totalTime / 44.1 / 1000 => totalTime;
<<< "Total Running Time: ", totalTime, " seconds." >>>;