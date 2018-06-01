
///Follow the algorithm from the book Computer Algorithms  ELLIS HOROWITZ
///Algorithm 4.8 chapter: Greedy Method

#include <stdio.h>

int n;
int weight[5][5];
char inTree[5];
int d[5];
int source[5];

void updateDistances(int target)
{
    int i;
    for (i = 0; i < n; ++i)
        if ((weight[target][i] != 0) && (d[i] > weight[target][i]))
        {
            d[i] = weight[target][i];
            source[i] = target;
        }
}

int main()
{
    int i, j;
    int total = 0;
    int treeSize;
    printf("Implementation of Prims's algorithm\n\n");
    printf("\nEnter the no. of vertices: ");
    scanf("%d", &n);

    printf("\nEnter the cost adjacency matrix:\n");
    for (i = 0; i < n; ++i)
        for (j = 0; j < n; ++j)
            scanf("%d", &weight[i][j]);

    for (i = 0; i < n; ++i)
        d[i] = 10;

    for (i = 0; i < n; ++i)
        inTree[i] = 0;

    printf("\nThe edges of Minimum Cost Spanning Tree are\n\n");
    printf("Adding node %c\n", 0 + 'A');
    inTree[0] = 1;
    updateDistances(0);

    for (treeSize = 1; treeSize < n; ++treeSize)
    {
        int min = -1;
        for (i = 0; i < n; ++i)
            if (!inTree[i])
                if ((min == -1) || (d[min] > d[i]))
                    min = i;

        printf("Adding edge %c-%c\n", source[min] + 'A', min + 'A');
        inTree[min] = 1;
        total += d[min];

        updateDistances(min);
    }
    printf("\nMinimum cost =  %d\n", total);

    return 0;
}

/*Sample input and output */
/*
Implementation of Prims's algorithm


Enter the no. of vertices: 3

Enter the cost adjacency matrix:
1 2 3
4 5 6
7 8 9

The edges of Minimum Cost Spanning Tree are

Adding node A
Adding edge A-B
Adding edge A-C

Minimum cost =  5
*/
