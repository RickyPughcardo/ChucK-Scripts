//sound chain

SndBuf2 mySound => dac;

//read file into string 
me.dir() + "/audio/stereo_fx_01,wav" => string filename;

filename => mySound.read;

while (true){
    0 => mySound.pos; //set play head at 0
    5::second => now;
    }