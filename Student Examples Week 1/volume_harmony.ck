// Assignment 1: Hello ChucK, Make Sound
// A simple song using if/else and while loop constructs
// in combination with some simple arithmetic operations
// and comparisons to define an 'intro', 'melody' and
// 'outro' region by varying how 3 oscillators change
// pitch and gain.
//
// A 'gate' variable for each oscillator is defined, which
// is either 1 or 0, used as a multiplier on the volume
// before output.

<<< "asg1_pulse_ascending-1.ck" >>>;

// sound architecture
// 3 oscillators: sine, saw, square
SinOsc s1;
SawOsc s2;
SqrOsc s3;

// Route all 3 oscillators to the same output 'dac'
s1 => dac;
s2 => dac;
s3 => dac;

// Set initial gains (volume) for all three oscillators
0.3 => float s1Vol;     // 'baseline'
s1Vol => s1.gain;

0.1 => float s2Vol;    // 'melody' starts off silent
s2Vol => s2.gain;

0.05 => float s3Vol;     // osc 3 'beats' with baseline
s3Vol => s3.gain;

// 'Gate' variables for each oscillator
// These will be used to mute each oscillator
// on certain beats without forgetting their volume.
0 => int s1Gate;
0 => int s2Gate;
0 => int s3Gate;

// Define our timebase: shortest note is an 8th note of 0.125s
8 => int beatsPerBar;
// Song is exactly 30 bars long, each bar being 1sec in duration
30 => int barsInSong;

(barsInSong * beatsPerBar) => int songLength;
16 => int fadeLength;       // Length of song 'fade out' in beats
0 => int fadeStep;          // To keep track of where in fade we are

// Define the amount to apply at each fade step
(s1Vol / fadeLength) => float s1Fade;
(s2Vol / fadeLength) => float s2Fade;
(s3Vol / fadeLength) => float s3Fade;

<<< "s1Fade",s1Fade,"s2Fade",s2Fade,"s3Fade",s3Fade >>>;

// Define lengths of notes (we really only use 'eighthNote')
//
// This demonstrates defining custom time durations: 'eighthNote',
// 'quarterNote', etc. which can be assigned to other durations or
// to advance 'now'
0.125::second => dur eighthNote;
0.25::second => dur quarterNote; // or, 2::eighthNote => dur quarterNote;
0.5::second => dur halfNote;     // or, 2::quarterNote => dur halfNote;
1::second => dur wholeNote;      // or, 2::halfNote => wholeNote;

// Frequency variables (float, hertz) which can be changed during song
220 => float s1Freq;
110 => float s2Freq;
330 => float s3Freq;

// Assign initial frequencies for all oscillators
s1Freq => s1.freq;
s2Freq => s2.freq;
s3Freq => s3.freq;

// Note that most of the structure of this song is based
// upon the variable 'b', which represents the current
// eighth note beat being played (or the position within
// the song, divided into 8th notes, if you will).
//
// I use modulo (remainder) calculations, with the '%' operator,
// to control the gain of oscillators to achieve the 'beats'
// and the less-than '<', greater-than '>' etc. operators
// to divide the behaviour of the code inside the main loop
// into song regions; an 'intro' of 8 beats, the main
// ascending of oscillator 2, and the 'outro' lowering
// oscillator 2 again at the end.

// Song loop. time advances by the minimum note length
// of an eighthNote, which is a 'beat'; 8 beats per bar.
for( 0 => int b; b < songLength; b++) {
    
    // Osc 1
    // -----
    // Alternate osc 1 as a 'bassline' moving octaves
    // every 4 beats (half-bar)
    // (Not including beat 0)
    if((b % 4) == 0 ) {
        110 => s1Freq;
    }
    else {
        220 => s1Freq;
    }
    s1Freq => s1.freq;
    // osc 1 is always on..
    1 => s1Gate;
    
    // Osc 2
    // -----
    // Once we're 4 bars in (8 * 4 = 32) make osc. 2 audible
    // but 'beating' on and off every 2 beats
    if( (b < 32) ) {
        0 => s2Gate;
    }
    else {
       if( ((b % 2) == 0) ) {
           1 => s2Gate;
       }
       else {
           0 => s2Gate;
       }
    }
    
    // beats 16 - 184 are the 'ascending' melody beats
    // osc 2 frequency, in variable 's2Freq', is increased
    // by 110Hz each 4 bars (32 beats).
    if( (b >= 16) && (b < 184) ) {
        if( (b % 32 == 0) ) {
            // Add 110Hz to s2Freq, then update s2.freq
            s2Freq + 110 => s2Freq;
            s2Freq => s2.freq;
        }
    }
    // 'Outro' from beats 184 - 240; s2Freq is decreased
    // by 110Hz every 2 bars.
    else {
        if( b >= 184 ) {
            if( (b % 16) == 0 ) {
                // Sub 110Hz from s2Freq, then update s2.freq
                s2Freq - 110 => s2Freq;
                s2Freq => s2.freq;
            }
        }
    }

    // Osc 3
    // -----
    // osc. 3 adds a syncopated(?) beat to
    // interact with osc. 1. The (b >=16)
    // just prevents osc. 3 from sounding until
    // after an 'intro' of 2 bars.
    if( (b < 16) ) {
        0 => s3Gate;
    }
    else {
        if( ((b % 3) == 0) ) {
            1 => s3Gate;
        }
        else {
            0 => s3Gate;
        }
    }
    
    // Song Volume
    // -----------
    // A simple fade out on the last two bars
    if( b > (songLength - fadeLength) ) {
        fadeStep++;
        (s1Vol - s1Fade) => s1Vol;
        (s2Vol - s2Fade) => s2Vol;
        (s3Vol - s3Fade) => s3Vol;
    }
    
    // Apply note volumns for each osc, subject to gates
    s1Vol * s1Gate => s1.gain;
    s2Vol * s2Gate => s2.gain;
    s3Vol * s3Gate => s3.gain;
    <<< "s1:", (s1Vol * s1Gate), "s2:", (s2Vol * s2Gate), "s3:",
        (s3Vol * s3Gate) >>>;
    
    // Advance time so current osc state can sound
    eighthNote => now;
}
// The End(tm).
