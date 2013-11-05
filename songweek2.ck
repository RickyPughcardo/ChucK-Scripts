                <<< "Week 2, Goodbye Dooks" >>>;
                //Sound Network
                SqrOsc chords => dac.left;
                SqrOsc chords2 => dac.left;
                SqrOsc chords3 => dac.left;
                SqrOsc chords4 => dac.left;
                SqrOsc chords5 => dac.left;
                TriOsc melody => JCRev r => Chorus c => dac.right;


                //sound properties
                .10 => melody.gain;
                .01 => chords.gain;
                .01 => chords2.gain;
                .01 => chords3.gain;
                .01 => chords4.gain;
                .04 => chords5.gain;
                .25 => r.mix;
                .0 => c.mix;

                //Time Units
                .25::second => dur quarter;
                .5::quarter => dur eighth;
                .25::quarter => dur sixteenth;
                2::quarter => dur half;
                4::quarter => dur full;

                //30 Second Duration Control
                now + 30::second => time end;

                //D Dorian Arrays

                //forwards
                [50, 52, 53, 55, 57, 59, 60, 62] @=> int scale[];

                //backwards

                [62, 60, 59, 57, 55 ,53, 52, 50] @=> int scale2[];

                [50, 57, 55] @=> int scale3[];

                //Main Control: While Loop
                while ( now < end  ){
                //Vars 
                    0 => int songPart;
                    0 => int partOne;
                    while ( partOne < 16 )
                        {
                        for( 0 => int i; i< scale.cap(); i++)//step1
                            {
                                Math.random2(0,7) => int randomScaleTone;
                                <<< "Melody Note: ", randomScaleTone >>>; //print index and value
                                // Std.mtof(scale[chord]) => chords.freq;
                               if (songPart > 1){
                                Std.mtof(scale[randomScaleTone])*2 => melody.freq;
                               }
                                //Chords
                                //chord var
                                1 => int chord;  
                                <<< " Dm7 Chord " >>>;
                                Std.mtof(50)*.5 => chords.freq;//D
                                Std.mtof(50) => chords.freq;//D
                                Std.mtof(53) => chords2.freq;//F
                                Std.mtof(57) => chords3.freq;//A
                                Std.mtof(60) => chords4.freq;//C
                                1::quarter => now;
                                chord++;
                                <<< "Iteration #:", i, chord, "partOne:", partOne, "songPart: ", songPart >>>;
                                partOne++;
                            }
                        for( 0 => int i; i< scale.cap(); i++)//step2
                            {
                                Math.random2(0,7) => int randomScaleTone;
                                <<< "Melody Note: ", randomScaleTone >>>; //print index and value
                                // Std.mtof(scale[chord]) => chords.freq;
                                Std.mtof(scale[randomScaleTone])*2 => melody.freq;
                                //Chords
                                //chord var
                                1 => int chord;  
                                <<< " Fmaj7 Chord " >>>;
                                Std.mtof(55) => chords.freq;//G
                                Std.mtof(53)*.5 => chords.freq;//Low F
                                Std.mtof(53) => chords2.freq;//F
                                Std.mtof(59) => chords3.freq;//B
                                Std.mtof(55)*2 => chords4.freq;//High G
                                1::quarter => now;
                                chord++;
                                <<< "Iteration #:", i, chord, "partOne:", partOne, "songPart: ", songPart >>>;
                                partOne++;
                            }
                            
                        for( 0 => int i; i< scale.cap(); i++)//step3
                            {
                                Math.random2(0,7) => int randomScaleTone;
                                <<< "Melody Note: ", randomScaleTone >>>; //print index and value
                                // Std.mtof(scale[chord]) => chords.freq;
                                Std.mtof(scale[randomScaleTone])*2 => melody.freq;
                                //Chords
                                //chord var
                                1 => int chord;  
                                <<< " G7 Chord " >>>;
                                Std.mtof(55)*.5 => chords.freq;//G
                                Std.mtof(60*.5) => chords2.freq;//C
                                Std.mtof(59)* 2 => chords3.freq;//B
                                Std.mtof(52)*2 => chords4.freq;//E
                                Std.mtof(55)*2 => chords5.freq;//G
                                1::quarter => now;
                                chord++;
                                <<< "Iteration #:", i, chord, "partOne:", partOne, "songPart: ", songPart >>>;
                                partOne++;
                            }
                                        for( 0 => int i; i< scale.cap(); i++)//step4
                            {
                                Math.random2(0,7) => int randomScaleTone;
                                <<< "Melody Note: ", randomScaleTone >>>; //print index and value
                                // Std.mtof(scale[chord]) => chords.freq;
                                Std.mtof(scale[randomScaleTone])*2 => melody.freq;
                                //Chords
                                //chord var
                                1 => int chord;  
                                <<< " Am7 Chord " >>>;
                                Std.mtof(55)*.5 => chords.freq;//G
                                Std.mtof(60)*4 => chords2.freq;//C
                                Std.mtof(57)*2 => chords3.freq;//A
                                Std.mtof(57)*.5 => chords3.freq;//A Low
                                Std.mtof(52)*2 => chords4.freq;//E
                                Std.mtof(57)*.5 => chords5.freq;//A
                                1::quarter => now;
                                chord++;
                                <<< "Iteration #:", i, chord, "partOne:", partOne, "songPart: ", songPart >>>;
                                partOne++;
                                songPart++;
                            }
                            
                           for (0 => int n; n < 8; n++){
                           Std.mtof(scale[n]) => chords.freq;
                           Std.mtof(scale[n])*1.5 => chords2.freq;
                               Std.mtof(scale[n])*.5 => chords3.freq;
                               Std.mtof(scale[n])*2 => chords4.freq;
                               Std.mtof(scale[n])*4 => chords5.freq;
                               Std.mtof(scale[n])*.5 => melody.freq;
                           1::eighth => now;
                               }
                                              for (0 => int n; n < 2; n++){
                           Std.mtof(scale2[n]) => chords.freq;
                           Std.mtof(scale[n])*1.5 => chords2.freq;
                               Std.mtof(scale[n])*2 => chords3.freq;
                               Std.mtof(scale[n])*2 => chords4.freq;
                               Std.mtof(scale[n])*2 => chords5.freq;
                               Std.mtof(scale[n])*.5 => melody.freq;
                           1::sixteenth => now;
                                                  <<< now >>>;
                               }
                }
                }
                
    SinOsc sine => Pan2 p=> dac;


    //hard pan
    1.0 => float panPosition;
    Std.mtof(50)*2 => sine.freq;
                0.2 => sine.gain;

    while ( panPosition > -1.0 )
    {
        panPosition => p.pan; //pan value
        <<< panPosition - .01 => panPosition >>>;
        .01::second => now;
        }
        
    //advance time
    1::second => now;