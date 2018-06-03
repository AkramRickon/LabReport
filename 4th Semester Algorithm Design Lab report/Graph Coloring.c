

///Follow the algorithms from the book Computer Algorithms by ELLIS HOROWITZ
///Algorithm 7.7 page 363 chapter: Backtracking

#include<stdio.h>

int x[10],g[10][10],i,j,n,m;

// A function to find adjacencies to other node

void next_value(int k)
{
    while(1)
    {
        x[k]=(x[k]+1)%(m+1); // x[] is used to allocate colors

        if(x[k]==0)
            return;

        for(j=1; j<=n; j++)
        {
            if(g[k][j]!=0&&(x[k]==x[j]))
                break;
        }
        if(j==n+1)
            return;
    }

} // End of next_node searching

void G_Coloring(int k)
{

    do
    {
        next_value(k);
        if(x[k]==0)
            return;
        if(k==n)
        {
            for(i=1; i<=n; i++)
                printf("vertex %d = color No. %d\t",i,x[i]);
            printf("\n");
        }

        else
            G_Coloring(k+1);

    }
    while(k<n+1);

}

int main()
{

    int e,k,l;

    printf("Enter no. of vertices : ");
    scanf("%d",&n);

    printf("Enter no. of edges : ");
    scanf("%d",&e);

    m=n; // Assigning coloring possibilities

    printf("\nThe maximum possible colors that can be assigned are: %d\n",m);

    for(i=0; i<=n; i++)
        for(j=0; j<=n; j++)
            g[i][j]=0;

    printf("Enter u and v of an edge\n");
    for(i=1; i<=e; i++)
    {
        printf("\nfor edge %d\n",i);
        scanf(" %d %d",&k,&l);
        g[k][l]=1;
        g[l][k]=1;
    }

    for(i=0; i<=n; i++)
        x[i]=0;
    printf("\nColouring possibilities are:\n");

    G_Coloring(1);

    return 0;
}
/*Sample input output*/
/*
Enter no. of vertices : 2
Enter no. of edges : 2

The maximum possible colours that can be assigned are: 2
Enter u and v of an edge

for edge 1
3
4

for edge 2
2
3

Colouring possibilities are:
vertex 1 = color No. 1  vertex 2 = color No. 1
vertex 1 = color No. 1  vertex 2 = color No. 2
vertex 1 = color No. 2  vertex 2 = color No. 1
vertex 1 = color No. 2  vertex 2 = color No. 2

*/

