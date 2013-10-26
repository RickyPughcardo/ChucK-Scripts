//sound network
SqrOsc w => dac;
SinOsc s => dac;

//define musical units
0.33::second => dur quarter;
0.5::quarter => dur eighth;
4::quarter => dur whole;
2::quarter => dur half;
0.25::quarter => dur sixteenth;

//define musical notes for song
//low octave vars
82.41 => float eBass;
87.31 => float fBass;
92.50 => float fSharpBass;
98 => int gBass;
103.83 => float gSharpBass;
110 => int aBass;
116.54 => float bFlatBass;
123.47=> float bBass;
130.81 => float cBass;
138.59 => float cSharpBass;
146.83 => float dBass;
155.56 => float dSharpBass;

//midrange vars
eBass*2 => float eMid;
fBass*2 => float fMid;
fSharpBass*2 => float fSharpMid;
gBass*2 => float gMid;
gSharpBass*2 => float gSharpMid;
aBass*2 => float aMid;
bFlatBass*2 => float bFlatMid;
bBass*2 => float bMid;
cBass*2 => float cMid;
cSharpBass*2 => float cSharpMid;
dBass*2 => float dMid;
dSharpBass*2 => float dSharpMid;

//movement variables
20 => int moveOne;
//define volume presets
0 => w.gain;
1 => s.gain;
//Scale Step 1
for ( 0 => int i; i < 4; i++ )
{
    <<< "F,bitch!" >>>;
    
    fBass => s.freq;
    1::quarter => now; 
   
  /*  if ( i <4 )
    {
        2 => int x;
        fBass*8 => w.freq;
        .25::quarter => now;
         ++x;
        <<< "high notes" >>>;
    }*/
  
}
//Scale Step 2
for ( 0 => int i; i < 4; i++)
{
    gBass => s.freq;
    1::quarter => now;
}
//Scale Step 3
for ( 0 => int i; i < 4; i++)
{
    gSharpBass => s.freq;
    1::eighth => now;
    
}
//Scale Step 4
for ( 0 => int i; i < 4; i++)
{
    bFlatBass => s.freq;
    1::eighth => now;
    
}
//Scale Step 5
for ( 0 => int i; i < 4; i++)
{
    cBass => s.freq;
    1::quarter => now;
    
}
//Scale Step 6
for ( 0 => int i; i < 4; i++)
{
    cSharpBass => s.freq;
    1::quarter => now;
    
}
//Scale Step 7
for ( 0 => int i; i < 4; i++)
{
    eBass*2 => s.freq;
    1::quarter => now;
    
}
//Scale Step 8
for ( 0 => int i; i < 4; i++)
{
    <<< "Scale 1 Ends" >>>;
    fBass*2 => s.freq;
    1::quarter => now;

}

.1 => w.gain;
//Scale Step 1
for ( 0 => int i; i < 4; i++ )
{   
    bFlatBass*6 => w.freq;
    fMid*2 => s.freq;
    1::quarter=> now; 
  
}
//Scale Step 2
for ( 0 => int i; i < 4; i++)
{
    fBass => s.freq;
    1::eighth => now;
}
//Scale Step 3
for ( 0 => int i; i < 4; i++)
{
    gSharpBass => s.freq;
    1::quarter => now;
    
}

//Scale Step 1
for ( 0 => int i; i < 4; i++ )
{   
    gSharpBass => w.freq;
    1::eighth;
    fMid*2 => s.freq;
    1::quarter=> now; 
   
  /*  if ( i <4 )
    {
        2 => int x;
        fBass*8 => w.freq;
        .25::quarter => now;
         ++x;
        <<< "high notes" >>>;
    }*/
  
}
//Scale Step 2
for ( 0 => int i; i < 4; i++)
{
    fBass => s.freq;
    1::eighth => now;
}
//Scale Step 3
for ( 0 => int i; i < 4; i++)
{
    gSharpBass => s.freq;
    1::quarter => now;
    
}

//Scale Step 4
for ( 0 => int i; i < 4; i++)
{
    bFlatBass => s.freq;
    1::quarter => now;
    
}
//Scale Step 5
for ( 0 => int i; i < 4; i++)
{
    cBass => s.freq;
    1::quarter => now;
    
}
//Scale Step 6
for ( 0 => int i; i < 4; i++)
{
    cSharpBass => s.freq;
    1::quarter => now;
    
}
//Scale Step 7
for ( 0 => int i; i < 4; i++)
{
    eBass*2 => s.freq;
    1::quarter => now;
    
}
//Scale Step 8
for ( 0 => int i; i < 4; i++)
{
    fBass*2 => s.freq;
    1::quarter => now;
    
}