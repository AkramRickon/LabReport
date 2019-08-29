#include<stdio.h>
#include<conio.h>
#include<graphics.h>

int main()
{
int gd=DETECT,gm;
int r,x,y,p,xc,yc;

initgraph(&gd,&gm,"");
//cleardevice();


printf("Enter the radius ");
scanf("%d",&r);

printf("Enter the x co-ordinate ");
scanf("%d",&xc);

printf("Enter the y co-ordinate ");
scanf("%d",&yc);


x=0;
y=r;
putpixel(xc+x,yc-y,1);

p=3-(2*r);

for(x=0;x<=y;x++)
{
if (p<0)
{
y=y;
p=(p+(4*x)+6);
}
else
{
y=y-1;

p=p+((4*(x-y)+10));
}

putpixel(xc+x,yc-y,15);
putpixel(xc-x,yc-y,15);
putpixel(xc+x,yc+y,15);
putpixel(xc-x,yc+y,15);
putpixel(xc+y,yc-x,15);
putpixel(xc-y,yc-x,15);
putpixel(xc+y,yc+x,15);
putpixel(xc-y,yc+x,15);

}
getch();
closegraph();
return 0;
}

