

///Follow the algorithm from the book Computer Algorithms  ELLIS HOROWITZ
///chapter: Divide and conquer
///InsertionSort Algorithm 3.9 page 151
///Merge Sort Algorithm 3.7,3.8 page 146,147
///Quick Sort Algorithm 3.12,3.13 page 156,157
///Bubble sort and insertion sort algorithms are not provided in the Mentioned book so i am providing this two algorithm

/*Algorithm bubbleSort(a,n)

    for i:= 1 to n-1  do

    for j:=1 to n-i-1 do

    if a[j] < a[j+1]

    swap(a[j], a[j+1]);
*/

/*Algorithm SELECTIONSORT(A,n)
	    for j:= 1 to n-1 do
	    smallest:= j
            for i:= j + 1 to n do
	    if A[ i ] < A[smallest]
            smallest:= i
            swap( A[j],A[smallest])
*/

#include <iostream>
#include <fstream>
#include <cstdlib>
#include <ctime>

using namespace std;

long length = 1000;
const long max_length = 30000;
int a[max_length];

int list[max_length];

void read()
{
   ifstream fin("data.txt", ios::binary);
    for (long i = 0; i < length; i++)
    {
        fin.read((char*)&list[i], sizeof(int));
    }
    fin.close();
}



/* BubbleSort starts*/
void bubbleSort()
{
    int temp;
    for(long i = 0; i < length; i++)
    {
        for(long j = 0; j < length-i-1; j++)
        {
            if (list[j] > list[j+1])
            {
                temp        = list[j];
                list[j]     = list[j+1];
                list[j+1]   = temp;
            }
        }
    }
}
/* BubbleSort ends*/

/* InsertionSort starts*/
void insertionSort()
{
    int temp;
    long j;
    for(long i=1;i < length; i++){
      temp=list[i];
      j=i-1;
      while((temp<list[j])&&(j>=0)){
      list[j+1]=list[j];
          j=j-1;
      }
      list[j+1]=temp;
  }
}
/* InsertionSort Ends*/


/* selection sort starts*/
void selection()
{

    int loc,temp,min;

    for(long i=0; i<length-1; i++)
    {
        min=list[i];
        loc=i;
        for(long j=i+1; j<length; j++)
        {
            if(min>list[j])
            {
                min=list[j];
                loc=j;
            }
        }

        temp=list[i];
        list[i]=list[loc];
        list[loc]=temp;
    }
}
/*selection sort ends*/


/* MergeSort starts*/
void merge(int low,int mid,int high)
{
    int h,i,j,b[max_length],k;
    h=low;
    i=low;
    j=mid+1;

    while((h<=mid)&&(j<=high))
    {
        if(a[h]<=a[j])
        {
            b[i]=a[h];
            h++;
        }
    else
        {
            b[i]=a[j];
            j++;
        }
        i++;
    }

    if(h>mid)
    {
        for(k=j;k<=high;k++)
        {
            b[i]=a[k];
            i++;
        }
    }
    else
        {
            for(k=h;k<=mid;k++)
            {
                b[i]=a[k];
                i++;
            }
        }

    for(k=low;k<=high;k++)
        a[k]=b[k];
    }


void merge_sort(int low,int high)
{
    int mid;
    if(low<high)
    {
        mid=(low+high)/2;
        merge_sort(low,mid);
        merge_sort(mid+1,high);
        merge(low,mid,high);
    }
}
/* MergeeSort ends*/

/* QuickSort starts*/
long partition(long left, long right)
{
    int pivot_element = list[left];
    int lb = left, ub = right;
    int temp;

    while (left < right)
    {
        while(list[left] <= pivot_element)
            left++;
        while(list[right] > pivot_element)
            right--;
        if (left < right)
        {
            temp        = list[left];
            list[left]  = list[right];
            list[right] = temp;
        }
    }
    list[lb] = list[right];
    list[right] = pivot_element;
    return right;
}

void quickSort(long left, long right)
{
    if (left < right)
    {
        long pivot = partition(left, right);
        quickSort(left, pivot-1);
        quickSort(pivot+1, right);
    }
}
/* QuickSort ends*/
int main()
{
    double t1, t2;

    ofstream fout("data.txt", ios::binary);

    srand(time(NULL));

    int r;
    for (int i = 0; i < max_length; i++)
    {
        r = rand();
        fout.write((char*)&r, sizeof(r));
    }

    fout.close();


    for (length = 1000; length <= max_length; )
    {
        cout << "\nLength\t: " << length << '\n';

        read();
        t1 = clock();
        bubbleSort();
        t2 = clock();
        cout << "Bubble Sort\t: " << (t2 - t1)/CLK_TCK << " sec\n";

        read();
        t1 = clock();
        insertionSort();
        t2 = clock();
        cout << "Insertion Sort\t: " << (t2 - t1)/CLK_TCK << " sec\n";

        read();
        t1 = clock();
        merge_sort(0, length - 1);
        t2 = clock();
        cout << "Merge Sort\t: " << (t2 - t1)/CLK_TCK << " sec\n";

        read();
        t1 = clock();
        quickSort(0, length - 1);
        t2 = clock();
        cout << "Quick Sort\t: " << (t2 - t1)/CLK_TCK << " sec\n";

        switch (length)
        {
        case 1000 :
            length = 5000;
            break;
        case 5000 :
            length = 10000;
            break;
        case 10000 :
            length = 30000;
            break;
        case 30000 :
            length = 30001;
            break;
        }
    }

    return 0;
}

/*No input and output is needed for this program*/
