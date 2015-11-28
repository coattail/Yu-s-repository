% Draw a level n tree using recursion

n= 5;
x= 0;  y=0;
stemAngle= pi/2;
stemLength= 1;
branchRatio= .6;
s= .1;
colr= [.1 .9 .1];
bendAngle= pi/10;
branchAngle= pi/4;

close all
figure
axis equal off
hold on
tree(n,x,y,stemAngle,stemLength,s,colr,branchRatio,bendAngle,branchAngle)
hold off
