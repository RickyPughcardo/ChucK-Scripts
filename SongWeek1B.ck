//sound network
TriOsc w => dac;
TriOsc s => dac;

//define musical units
0.20::second => dur quarter;
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

for (0 =>int rando; rando < 200; rando++)
{ 
    Math.random2f(200, 1500) => s.freq;
    2::sixteenth*.25 => now;
}
//Whoooop to Start the song

108 => int i;
<<< "Starting the MainFrame, Captain. Sit back and enjoy the ride." >>> ;
while( i < gBass*4 )
{
    i => s.freq;
    <<< i >>>;
    1::sixteenth*.16 => now;
    //update loop
    i++;
}

//VOLUMES
1 => w.gain;
0 => s.gain;

//Fast Loop x 4
for ( 0 => int j; j <4; j++)
{
    //Step 1
for ( 0 => int i; i < 4; i++)
{
    gBass*4 => w.freq;
    1::sixteenth => now;
}
//Step 2
for ( 0 => int i; i < 4; i++)
{
    gSharpBass*4 => w.freq;
    1::sixteenth => now;
    
}
//Step 3
for ( 0 => int i; i < 4; i++)
{
    bFlatBass*4 => w.freq;
    1::sixteenth => now;
    
}
}

//Fast Loop 2
for ( 0 => int j; j <4; j++)
{//Scale Step 9

for ( 0 => int i; i < 4; i++)
{
    dBass*2 => w.freq;
    1::sixteenth => now;
}
//Scale Step 3
for ( 0 => int i; i < 4; i++)
{
    dSharpBass*2 => w.freq;
    1::sixteenth => now;
    
}
//Scale Step 4
for ( 0 => int i; i < 4; i++)
{
    cBass*2 => w.freq;
    1::sixteenth => now;
}
}

//Fast Loop x 4
for ( 0 => int j; j <4; j++)
{
    //Step 1
for ( 0 => int i; i < 4; i++)
{
    gBass*4 => w.freq;
    1::sixteenth => now;
}
//Step 2
for ( 0 => int i; i < 4; i++)
{
    gSharpBass*4 => w.freq;
    1::sixteenth => now;
    
}
//Step 3
for ( 0 => int i; i < 4; i++)
{
    bFlatBass*4 => w.freq;
    1::sixteenth => now;
    
}
}

for ( 0 => int i; i < 4; i++)
{
    eBass*6 => w.freq;
    1::quarter*1.5 => now;
}

for ( 0 => int i; i < 4; i++)
{
    dBass*4 => w.freq;
    1::quarter => now;
    
}

//pass a quarter note for balance
<<< "Rest, baby.. take a load off" >>>;
1::quarter => now;

//Fast Loop x 4
for ( 0 => int j; j <4; j++)
{
    //Step 1
for ( 0 => int i; i < 4; i++)
{
    gBass*8 => w.freq;
    1::sixteenth => now;
}
//Step 2
for ( 0 => int i; i < 4; i++)
{
    gSharpBass*8 => w.freq;
    1::sixteenth => now;
    
}
//Step 3
for ( 0 => int i; i < 4; i++)
{
    bFlatBass*8 => w.freq;
    1::sixteenth => now;
    
}
}
<<< "new loop startin'" >>>;

//Fast Loop x 4
for ( 0 => int j; j <4; j++)
{
    //Step 1
for ( 0 => int i; i < 4; i++)
{
    <<< "Still Going, homie" >>>;
    gBass*10 => w.freq;
    1::sixteenth => now;
}
//Step 2
for ( 0 => int i; i < 4; i++)
{
    gSharpBass*10=> w.freq;
    1::sixteenth => now;
    
}
//Step 3
for ( 0 => int i; i < 4; i++)
{
    bFlatBass*10 => w.freq;
    1::sixteenth => now;
}
}
<<< "Almost to the end, sit still. I know it hurts." >>>;
//Fast Loop x 4
for ( 0 => int j; j <4; j++)
{
    //Step 1
for ( 0 => int i; i < 4; i++)
{
    gBass*12 => w.freq;
    1::sixteenth => now;
}
//Step 2
for ( 0 => int i; i < 4; i++)
{
    gSharpBass*12=> w.freq;
    1::sixteenth => now;
    
}
//Step 3
for ( 0 => int i; i < 4; i++)
{
    bFlatBass*12 => w.freq;
    1::sixteenth => now;
}
}

for ( 0 => int i; i < 4; i++)
{
    cBass*12 => w.freq;
    1::quarter*1.5 => now;  
}

for ( 0 => int i; i < 4; i++)
{
    dSharpBass*12 => w.freq;
    1::quarter*1.5 => now;
}

//Whoooop to end the song
20 => int z;

1 => s.gain;
1=> w.gain;

while( z < gBass*4 )
{
    Math.random2f(200, 1500) => s.freq;
    2::sixteenth*.25 => now;
    z => w.freq;
    <<< z >>>;
    1::sixteenth*.16 => now;
    //update loop
    z++;
}

for ( 0 => int i; i < 2; i++)
{
    gSharpBass*8=> s.freq;
    1::quarter => now;
    
}

for ( 0 => int i; i < 2; i++)
{
    gSharpBass*4=> s.freq;
    1::quarter => now;
    
}

for ( 0 => int i; i < 1; i++)
{
    gSharpBass*2=> s.freq;
    1::quarter => now;
    
}

for ( 0 => int i; i < 1; i++)
{
    gSharpBass=> s.freq;
    1::quarter => now;
    
}