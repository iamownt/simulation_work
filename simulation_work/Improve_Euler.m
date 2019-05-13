function Improve_Euler(option)
N=1000;
n=3;
x=zeros(n,1+N);
x0=zeros(n,1);
x1=zeros(n,1);
u=1;
A=[0 1 0;0 0 1;-22.06 -27 -10];
b=[0;0;40.6];
h=0.01;
x(:,1)=x0;
for i=1:N
    x1=x0+(A*x0+b*u)*h;
    x1=x0+(A*(x0+x1)+2*b*u)*h/2;
    x0=x1;
    x(:,i+1)=x1;
end
t=0:h:h*N;
if option
    plot(t,x(1,:),'r',t,x(2,:),'b--',t,x(3,:),'k:')
    legend('y','dy','ddy')
else
    plot(t,x(1,:),'r')
    legend('y','Location','northeast')
end
grid on
title('改进欧拉法，h=0.01')
xlabel('time(sec)')
ylabel('y')
