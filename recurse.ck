fun int Recurse(int x)
{
    if(x<=1)
    {
        return 1;
    }
    else
    {
        return x+8+Recurse(x-1);
    }
}

<<<Recurse(4)>>>;