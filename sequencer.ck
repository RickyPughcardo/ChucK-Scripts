//sound chain
SndBuf snare => Pan2 p => dac;

//aray of strings(paths)
string snare_samples[3];

//load array with file paths
me.dir() + "/audio/snare_01.wav" => snare_samples[0];
me.dir() + "/audio/snare_02.wav" => snare_samples[1];
me.dir() + "/audio/snare_03.wav" => snare_samples[2];

//How many samples?
<<< snare_samples.cap() >>>;

while (true){
    
    Math.random2(0, snare_samples.cap() - 1)=> int which; //0, 1, 2
    Math.random2f(.2, .8) => snare.gain; //random gain
    Math.random2f(.2, 1.8) => snare.rate; //random play rate
    Math.random2f(-1.0, 1.0) => p.pan;
    snare_samples[which] => snare.read; //read in the sample
    205::ms => now;
    }
    