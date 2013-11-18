//functions to create form

//global var
0 => int x; 

//functions
fun void funOne()
{
 x+1 => x; //add one to x
 1::second => now; //advance time
 <<< x >>>;   //print x
}

fun void funTwo()
{
    x-1 => x; //subtracting one
    1::second => now;
    <<< x >>>; 
}
//Main

while ( true)
{
    funOne();//execute funOne
    funTwo();