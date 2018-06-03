

///Follow the algorithms from the book Computer Algorithms by ELLIS HOROWITZ
///Algorithm 5.3 page 267 chapter: Dynamic programming

#include <iostream>
using namespace std;

int main()
{
    int a[20][20],i,j,k,n;

    cout<<"Enter the No. of Nodes in Graph : ";
    cin>>n;

    cout<<"\n\n---- Enter the Distance b/w Nodes ----\n\n";

    for(i=1; i<=n; i++)
    {
        for(j=1; j<=n; j++)
        {
            cout<<"Node "<<i<<" to Node "<<j<<" : ";
            cin>>a[i][j];
        }
        cout<<endl;
    }

    cout<<"\nAdjaceny Matrix is :\n";
    for(i=1; i<=n; i++)
    {
        for(j=1; j<=n; j++)
        {
            cout<<" "<<a[i][j]<<"   ";
        }
        cout<<endl;
    }


    for(k=1; k<=n; k++)
    {
        for(i=1; i<=n; i++)
        {
            for(j=1; j<=n; j++)
            {
                if(a[i][j]>a[i][k]+a[k][j])
                {
                    a[i][j]=a[i][k]+a[k][j];
                }
            }
        }
    }
    cout<<"\n\nShortest Path Matrix is :\n";
    for(i=1; i<=n; i++)
    {
        for(j=1; j<=n; j++)
        {
            cout<<" "<<a[i][j]<<"   ";
        }
        cout<<endl;
    }
return 0;

}

/*Sample input and output */
/*Enter the No. of Nodes in Graph :3

---- Enter the Distance b/w Nodes ----

Node 1 to Node 1 : 1
Node 1 to Node 2 : 2
Node 1 to Node 3 : 3

Node 2 to Node 1 : 3
Node 2 to Node 2 : 2
Node 2 to Node 3 : 1

Node 3 to Node 1 : 1
Node 3 to Node 2 : 5
Node 3 to Node 3 : 9


Adjaceny Matrix is :
 1    2    3
 3    2    1
 1    5    9

 Shortest path matrix is :
 1    2    3
 2    2    1
 1    3    4

 */
