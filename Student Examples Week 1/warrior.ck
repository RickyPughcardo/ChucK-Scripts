<<< "FIRST ASSIGNMENT - TAKE OFF TO WAR" >>>;

// Sound Network
SinOsc s => dac; //Sine Oscillator
SawOsc w => dac; //Sawtooth Oscillator


// 'for loop'. initial code: 20=>int a; condition:a < 300; update: a++
for( 20 => int a; a < 300; a++ )
{
    a => s.freq; //setting frequency for s and w oscillators
    a => w.freq;
    0.6 => s.gain; // setting volume for s and w oscillators
    0.3 => w.gain;
    0.02::second => now; // setting duration
}

// I wanted a silence after the 'for loop'
0 => s.gain; //setting volume to 0 for both Oscillators
0 => w.gain;
0.8::second => now;


// turning back the volume
0.6 => s.gain;
0.3 => w.gain;

//I took the alarm example to set an end for the next 'while loop'.
// initializing a variable for the 'while loop'
now + 10::second => time later; //setting the duration a big 'while loop'

while(  now < later ) //loop will work almost 10 seconds
{
    
    //creating whatever variable to setting up an 'if' statement
    100 => int b;
    
    
    // if statement
    if( b == 100) //if b==100 then the system will enter this to this code
    {
        // initializing a variable to enter another 'while loop'
        //I wanted an on/off effect with the volume. I used the alarm example again.
        now + 2::second => time later; //setting the duration of the loop
        
        while(  now < later ) //while loop will work for almost 2 seconds
        {
            <<< "loop tremolo:", (later-now)/second >>>; //printing in seconds
            0.6 => s.gain; //volume on for both oscillators
            0.3 => w.gain;
            b + 340 => s.freq; //frequency of both oscillators
            b + 340 => w.freq;
            0.05::second => now; //sound for 0.05 seconds
            
            0 => s.gain; //volume off for both oscillators
            0 => w.gain;
            0.05::second => now; //silence for 0.05 seconds
        }
        //after the while loop, still inside the 'if' conditional.
        0.6 => s.gain; //turning up the volume again for both Osc
        0.3 => w.gain;
        b + 340 => s.freq; //freq for both Osc
        b + 120 => w.freq;
        1.5::second => now; //sound for 1.5 seconds
    }
    
    // This is the same code as the previous 'if' statement
    //with slight changes on the frequency
    
    if( b == 100)
    {
        // initializing a variable to enter a while loop,
        //I wanted an on/off effect with the volume. I used the alarm example
        now + 2::second => time later; //setting the duration of the loop
        
        while(  now < later ) //loop will work almost 2 seconds
        {
            <<< "loop tremolo:", (later-now)/second >>>; //printing in seconds
            0.6 => s.gain; //volume on for both oscillators
            0.3 => w.gain;
            b + 340 => s.freq; //frequency of both oscillators
            b + 340 => w.freq;
            0.05::second => now; //sound for 0.05 seconds
            
            0 => s.gain; //volume off for both oscillators
            0 => w.gain;
            0.05::second => now; //silence for 0.05 seconds
        }
        //after the while loop, still inside the 'if' conditional.
        0.6 => s.gain; //turning up the volume again for both Osc
        0.3 => w.gain;
        b + 291.995 => s.freq; //freq for both Osc
        b - 3 => w.freq;
        1.5::second => now; //sound for 1.5 seconds
    }
}


// creating a new variable for the final part
440.1 => float c;

//if variable
if( c < 441)
{
    // initializing a variable to enter a while loop,
    // setting a new on/off volume effect.
    now + 4::second => time later; //setting the duration of the loop
    
    while(  now < later ) //loop will work almost 4 seconds
    {
        <<< "loop tremolo:", (later-now)/second >>>; //printing in seconds
        0.6 => s.gain; //volume on for both oscillators
        0.3 => w.gain;
        c => s.freq; //frequency of both oscillators
        c => w.freq;
        0.05::second => now; //sound for 0.05 seconds
        
        0 => s.gain; //volume off for both oscillators
        0 => w.gain;
        0.05::second => now; //silence for 0.05 seconds
        
        0.6 => s.gain; //volume on for both oscillators
        0.3 => w.gain;
        c + 50 => s.freq; //frequency of both oscillators
        c + 50=> w.freq;
        0.05::second => now; //sound for 0.05 seconds
        
        0 => s.gain; //volume off for both oscillators
        0 => w.gain;
        0.05::second => now; //silence for 0.05 seconds
        
    }
}

// else conditional
else (c < 2); //false statement to redirect the system to this brackets
{
    //after the while loop, still inside the 'if' conditional.
    0.6 => s.gain; //turning up the volume again for both Osc
    0.3 => w.gain;
    c + 291.995 => s.freq; //freq for both Osc
    c - 3 => w.freq;
    2::second => now; //sound for 1.5 seconds
}

<<<"THANKS FOR REVIEWING MY WORK!!">>>;