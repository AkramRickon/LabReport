
///Follow the algorithm from the book Computer Algorithms  ELLIS HOROWITZ
///Algorithm 3.2 page 132 chapter: Divide and conquer


#include<bits/stdc++.h>
using namespace std;

int binarySearch(int a[], int low, int high, int x)
{
    if (low<=high)
    {
        int mid = (low+high)/2;
        if (a[mid] == x)     return mid;

        if (a[mid] > x)  return binarySearch(a, low, mid-1, x);
        else             return binarySearch(a, mid+1,high, x);
    }
    return -1;
}

int main()
{
    int a[100],n,x,i,low,high;
    cin>>n;

    for(i=0 ; i<n ; i++) cin>>a[i];

    cin>>x;

    low=0,high=n-1;
    int result = binarySearch(a,low,high,x);

    if(result == -1) cout<<"Item is not present in array"<<endl;
    else             cout<<"Item is present at position:"<<result+1<<endl;
    return 0;
}

/*Sample input and output*/
/*
5
1 2 3 4 5
3
Item is present at position: 3
*/

