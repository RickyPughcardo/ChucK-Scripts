<<< "Assignment_1_Something_in_F" >>>;
SinOsc m => dac;
TriOsc n => dac;
SqrOsc o => dac;

440 => int A;
261.63 => float C;


//a for loop of 30 seconds, 1 quarter note is 1250ms
for ( 0 => int i; i<1 ; i++ )
    {
        //C F A chord half
         0.3 => m.gain;
         0.1 => n.gain;
         0.1 => o.gain;
         C => m.freq;
         349.23 => n.freq;
         A => o.freq;
         2500::ms =>now;
         //G B D chord quarter
         0.3 => m.gain;
         0.1 => n.gain;
         0.1 => o.gain;
         392    => m.freq;
         246.94 => n.freq;
         587.33 => o.freq;
         1250::ms =>now;
         // A C E chord quarter
         0.3 => m.gain;
         0.1 => n.gain;
         0.1 => o.gain;
         A => m.freq;
         523.25 => n.freq;
         659.26 => o.freq;
         1250::ms =>now;
         // E G B chord half
         0.3 => m.gain;
         0.1 => n.gain;
         0.1 => o.gain;
         659.26=> m.freq;
         783.99 => n.freq;
         987.77 => o.freq;
         2500::ms =>now;
         // D F A chord half and whole
         0.3 => m.gain;
         0.1 => n.gain;
         0.1 => o.gain;
         587.33=> m.freq;
         698.46 => n.freq;
         A*2 => o.freq;
         3750::ms =>now;
         
         // F  chord half
         0.3 => m.gain;
         0.1 => n.gain;
         0.1 => o.gain;
         C => m.freq;
         349.23 => n.freq;
         A => o.freq;
         2500::ms =>now;
         //G chord quarter
         0.3 => m.gain;
         0.1 => n.gain;
         0.1 => o.gain;
         392    => m.freq;
         246.94 => n.freq;
         587.33 => o.freq;
         1250::ms =>now;
         // A chord quarter
         0.3 => m.gain;
         0.1 => n.gain;
         0.1 => o.gain;
         A => m.freq;
         523.25 => n.freq;
         659.26 => o.freq;
         1250::ms =>now;
         //C  half
         0.3 => m.gain;
         0.1 => n.gain;
         0.1 => o.gain;
         C => m.freq;
         392 => n.freq;
         659.26 => o.freq;
         2500::ms =>now;
         //Bb half
         0.3 => m.gain;
         0.1 => n.gain;
         0.1 => o.gain;
         233.08 => m.freq;
         298.46 => n.freq;
         587.33 => o.freq;
         2500::ms =>now;
         // D   half 
         0.3 => m.gain;
         0.1 => n.gain;
         0.1 => o.gain;
         587.33=> m.freq;
         698.46 => n.freq;
         880 => o.freq;
         2500::ms =>now;
         // A  quarter
         0.3 => m.gain;
         0.1 => n.gain;
         0.1 => o.gain;
         A => m.freq;
         523.25 => n.freq;
         659.26 => o.freq;
         1250::ms =>now;
         //G B D quarter
         0.3 => m.gain;
         0.1 => n.gain;
         0.1 => o.gain;
         784    => m.freq;
         493.88 => n.freq;
         1174.66 => o.freq;
         1250::ms =>now;
        
        
        
        
        }