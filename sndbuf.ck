//SOUND CHAIN -- sound object
SndBuf mySound => dac;

//directory of this file
me.dir() => string path;

//define the filename
"/audio/snare_01.wav" => string filename;

//creating full sample filepath
path + filename => filename;

//Opens up sound file
filename => mySound.read;

//simple control
while ( true ){ 
0 => mySound.pos; //sets play head position
.5::second => now;
    <<< "SMACK" >>>;
}