
///Follow the algorithm from the book Computer Algorithms  ELLIS HOROWITZ
///Algorithm  4.2 page 201 chapter: Greedy Method

# include<stdio.h>
int max(int a, int b)
{
    return (a > b)? a : b;
}


void knapsack_gr(int n, int weight[], int profit[], int capacity)
{
    float x[n], K=0.0;
    int i;

    for (i=0; i<n; i++)
        x[i]=0.0;

    for (i=0; i<n; i++)
    {
        if(weight[i]>capacity)
            break;
        else
        {
            x[i]=1.0;
            K = K + profit[i];
            capacity = capacity - weight[i];
        }
    }

    if(i<n)
        x[i]=capacity/float (weight[i]);

    K = K + (x[i]*profit[i]);

    printf("\n The result vector is: ");
    for(i=0; i<n; i++)
        printf("%.2f ",x[i]);

    printf("\n Maximum profit by Greedy Knapsack is: %.2f", K);

}


int main()
{
    int weight[20], profit[20], capacity;
    int n, i,j;
    int ratio[20], temp;


    printf ("\n Enter the no. of objects:- ");
    scanf ("%d", &n);

    printf ("\n Enter the weights and profits of each object: ");
    for (i=0; i<n; i++)
    {
        scanf("%d %d", &weight[i], &profit[i]);
    }

    printf ("\n Enter the capacity of knapsack: ");
    scanf ("%d", &capacity);

    for (i=0; i<n; i++)
    {
        ratio[i]=profit[i]/weight[i];
    }

    for(i=0; i<n; i++)
    {
        for(j=i+1; j< n; j++)
        {
            if(ratio[i]<ratio[j])
            {
                temp= ratio[j];
                ratio[j]= ratio[i];
                ratio[i]= temp;

                temp= weight[j];
                weight[j]= weight[i];
                weight[i]= temp;

                temp= profit[j];
                profit[j]= profit[i];
                profit[i]= temp;
            }
        }
    }

    knapsack_gr(n, weight, profit, capacity);

    return  0;
}

/*Sample input and output */
/* Run the code and write input output */
