function y = Euler(option)
N=100;
n=3;
x=zeros(n,1+N);
x1=zeros(n,1);
u=1;
A=[0 1 0;0 0 1;-22.06 -27 -10];
b=[0;0;40.6];
x(:,1)=x1;
h=0.1;
for i=1:N
    x1=x1+(A*x1+b*u)*h;
    x(:,i+1)=x1;
end
t=0:h:h*N;
if option
    plot(t,x(1,:),'r',t,x(2,:),'b--',t,x(3,:),'k:')
    legend('y','dy','ddy')
else
    plot(t,x(1,:),'r')
    legend('y')
end
grid on
title('Å·À­·¨£¬h=0.01')
xlabel('time(sec)')
ylabel('y')
y = x(1,:);