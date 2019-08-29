#include<conio.h>
#include<stdio.h>
#include<graphics.h>

int main()
{
int gd=DETECT,gm;
int i,r,x,y,xc,yc;
float d;

initgraph(&gd,&gm,"");
printf("Enter Radius\n");
scanf("%d",&r);
printf("Enter Center of circle\n");

scanf("%d",&xc);
scanf("%d",&yc);
d=1-r;
x=0;
y=r;
//do
while(x<y)
{
if(d<0)
{

x=x+1;
d=d+2*x+1;
}
else
{

x=x+1;
y=y-1;
d=d+2*x-2*y+10;
}
putpixel(xc+x,yc+y,WHITE);
putpixel(xc-y,yc-x,WHITE);
putpixel(xc+y,yc-x,WHITE);
putpixel(xc-y,yc+x,WHITE);
putpixel(xc+y,yc+x,WHITE);
putpixel(xc-x,yc-y,WHITE);
putpixel(xc+x,yc-y,WHITE);
putpixel(xc-x,yc+y,WHITE);
}
//while(x<y);
getch();
return 0;
}
