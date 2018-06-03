
///Follow the algorithms from the book Computer Algorithms by ELLIS HOROWITZ
///Algorithm 7.4 and 7.5, page 354 chapter: Dynamic programming

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

/* For printing the Grid */
void print_grid(int n,int x[])
{
    char arr[20][20];
    int i,j;
    for(i=1; i<=n; i++)
    {
        for(j=1; j<=n; j++)
        {
            arr[i][j]='*';
        }
    }

    for(i=1; i<=n; i++)
    {
        arr[i][x[i]]='Q';
    }

    for( i=1; i<=n; i++)
    {
        for(j=1; j<=n; j++)
        {
            printf("\t%c",arr[i][j]);
        }
        printf("\n");
    }

}

/* For checking Queens placement is safe or not */
int safetoplace(int x[],int k)
{
    int i;
    for(i=1; i<k; i++)
    {
        if(x[i]==x[k]||i-x[i]==k-x[k]||i+x[i]==k+x[k])
        {
            return 0;  /* False*/
        }
    }
    return 1; /*true*/
}
/* For printing the Queens and Placing them in Grid */
void nqueens(int n)
{
    int x[20];
    int count=0;
    int k=1;

    x[k]=0;

    while(k!=0)
    {
        x[k]=x[k]+1;
        while((x[k]<=n)&&(!safetoplace(x,k)))
        {

            x[k]=x[k]+1;
        }
        if(x[k]<=n)
        {
            if(k==n)
            {
                count++;
                printf("\n\tPlacement %d  is : \n\n\n",count);
                print_grid(n,x);
                getch();
            }
            else
            {
                k++;
                x[k]=0;
            }
        }
        else
        {
            k--;
        }
    }
    printf("\n\tTotal solution number is :  %d \n\n\n",count);
    return;
}

/* Main Function */
int main()
{
    int n;

    printf("\t C PROGRAM OF N-QUEEN PROBLEM\n\n");
    printf("\nEnter the no. of Queens : ");
    scanf("%d",&n);
    printf("\n\n\tUSING %d QUEEN'S STRATEGY \n\n",n);
    nqueens(n);
}


/*sample input and output */
/*
         C PROGRAM OF N-QUEEN PROBLEM


Enter the no. of Queens : 4


        USING 4 QUEEN'S STRATEGY


        Placement 1  is :


        *       Q       *       *
        *       *       *       Q
        Q       *       *       *
        *       *       Q       *

        Placement 2  is :


        *       *       Q       *
        Q       *       *       *
        *       *       *       Q
        *       Q       *       *

        Total solution number is :  2

*/
