SqrOsc s => dac.left;
TriOsc t => dac.right;
//declaring array *Bugle Call*
/*Make array method 1:
54 => A[0];
56 => A[1];
62 => A[2];
48 => A[3];
*/
[54, 56, 62, 54, 48, 50, 52] @=> int A[];
[.2,.1,.2,.25,.50,.75,.6,.1, 2, .3] @=> float notes[];
//Displays max number of contents in array.
<<< A.cap() >>>;

for( 0 => int i; i< A.cap(); i++)
{
    <<< i, A[i], Std.mtof(A[i]) >>>; //print index and value
    Std.mtof(A[i]) => s.freq;
    Std.mtof(A[i])*1.5 => t.freq;
    notes[i]::second => now;
}
