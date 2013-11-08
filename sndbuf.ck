//SOUND CHAIN -- sound object
SndBuf mySound => Pan2 p => dac;

//directory of this file
me.dir() => string path;

//define the filename
"/audio/snare_01.wav" => string filename;

//creating full sample filepath
path + filename => filename;

//Opens up sound file
filename => mySound.read;

mySound.samples() => int numSamples; 
//simple control
/* Example 1
while ( true ){ 
    Math.random2f(.2, .8) => mySound.gain; //random gain
    Math.random2f(.2, 1.8) => mySound.rate; //random play rate
    Math.random2f(-1.0, 1.0) => p.pan;
    0 => mySound.pos; //reset position to 0 every time
    .5::second => now;
    <<< "SMACK" , numSamples>>>;
}
*/ 

while ( true) {
    numSamples => mySound.pos;
    -1.0 => mySound.rate;
    1::second => now;
    }