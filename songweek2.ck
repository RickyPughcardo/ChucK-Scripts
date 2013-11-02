<<< "Week 2, Little Fishes" >>>;
//Sound Network
SqrOsc chords => dac.left;
TriOsc melody => dac.right;

//Time Units
.25::second => dur quarter;
.5::quarter => dur eighth;
2::quarter => dur half;
4::quarter => dur full;

//D Dorian Array
[50, 52, 53, 55, 57, 59, 60, 62] @=> int scale[];
while ( true ){
0 => int chord;
for( 0 => int i; i< scale.cap(); i++)
{

    
    <<< i, scale[i], Std.mtof(scale[i]) >>>; //print index and value
    Std.mtof(scale[chord]) => chords.freq;
    Std.mtof(scale[i])*2.5 => melody.freq;
    1::quarter => now;
    chord++;
    <<< "chord:", chord >>>;
    }
}