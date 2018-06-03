
///Follow the algorithms from the book Computer Algorithms by ELLIS HOROWITZs
///Algorithm 5.4 page 273 chapter: Dynamic programming


#include <iostream>

using namespace std;

class spath

{

    int costmatx[10][10]; //cost matrix

    int n,s; //no of vertices

    int dist[10]; //to store distance

public:

    void read_graph(); //function to read the weighted graph

    void source_vertex(); // from where the distance has to be calculated

    void shpath(); // to find the shortest path

    void display(); // to display the total cost for each distance

};

void spath::read_graph()

{

    int i,j; //loop variables

    cout<<"Enter the no. of vertices in your graph : ";

    cin>>n; //number of vertices

    cout<<"enter '0' if there is no path\n";

    for(i=1; i<=n; i++)

    {

        for(j=1; j<=n; j++)

        {

            cout<<"enter the cost from " << i <<" to "<< j<<" :";

            cin>>costmatx[i][j];

        }

    }

}

void spath::source_vertex()

{

    cout<<"enter the source vertix:";

    cin>>s; //source vertex

}

void spath::shpath()

{

    int mv,i,j;

    static int f[10];

    f[s]=1; //changing flag of source vertex to 1;

    for(i=1; i<=n; i++)

        dist[i]=costmatx[s][i]; //assigning weight or cost to each vertex s,i

    for(int k=1; k<=n; k++)

    {

        int min=1000; //think y minimum is 1000??

        for(i=1; i<=n; i++)

            if((f[i]!=1) && (dist[i]<min))

            {

                min=dist[i];

                mv=i;

            }

        f[mv]=1;

        for(i=1; i<=n; i++)

            if((f[i]!=1)&&(dist[mv]+costmatx[mv][i]<dist[i]))

                dist[i]=dist[mv]+costmatx[mv][i];

    }

}

void spath::display()

{

    for(int i=1; i<=n; i++)

        cout<<"Distance from "<<s<<" to "<<i<<" is "<<dist[i]<<"\n";

}

int main()

{

    spath sp;

    sp.read_graph();

    sp.source_vertex();

    sp.shpath();

    sp.display();
    return 0;
}

/*Sample input and output :*/
/*
Enter the no. of vertices in your graph : 2
enter '0' if there is no path
enter the cost from 1 to 1 :1
enter the cost from 1 to 2 :2
enter the cost from 2 to 1 :3
enter the cost from 2 to 2 :4
enter the source vertix:2
Distance from 2 to 1 is 3
Distance from 2 to 2 is 4
*/
