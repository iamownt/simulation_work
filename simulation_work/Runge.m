function y=Runge(option)
N=100;
n=3;
x=zeros(n,N+1);
x0=zeros(n,1);
k1=zeros(n,1);
k2=zeros(n,1);
k3=zeros(n,1);
k4=zeros(n,1);
u=1
A=[0 1 0;0 0 1;-22.06 -27 -10];
b=[0;0;40.6];
h=0.1;
x(:,1)=x0;
for i=1:N
    k1=A*x0+b*u;
    k2=A*(x0+h/2*k1)+b*u;
    k3=A*(x0+h/2*k2)+b*u;
    k4=A*(x0+h*k3)+b*u;
    x0=x0+h/6*(k1+2*k2+2*k3+k4);
    x(:,i+1)=x0;
end
y=x;
t=0:h:h*N;
if option
    plot(t,x(1,:),'r',t,x(2,:),'b--',t,x(3,:),'k:')
    legend('y','dy','ddy')
else
    plot(t,x(1,:),'r')
    legend('y')
end
grid on
title('ËÄ½×Áú¸ñ¿âËþ·¨£¬h=0.01')
xlabel('time(sec)')
ylabel('y')
y = x(1,:)