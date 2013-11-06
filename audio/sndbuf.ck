//SOUND CHAIN -- sound object
SndBuf mySound => dac;

//directory of this file
me.dir() => string path;
<<< "current dir: ", path >>>;

//define the filename
"/audio/snare01.wav" => string filename;

//creating full sample filepath
path + filename => filename;

//Opens up sound file
filename => mySound.read;

//simple control
0 => mySound.pos; //sets play head position

1::second => now;