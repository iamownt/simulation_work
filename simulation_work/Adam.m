function y=Adam(option)
N=900;
n=3;
x=zeros(n,N+4);
x0=zeros(n,1);
k1=zeros(n,1);
k2=zeros(n,1);
k3=zeros(n,1);
k4=zeros(n,1);
u=1;
A=[0 1 0;0 0 1;-22.06 -27 -10];
b=[0;0;40.6];
h=0.01;
for i=1:3
    k1=A*x0+b*u;
    k2=A*(x0+h/2*k1)+b*u;
    k3=A*(x0+h/2*k2)+b*u;
    k4=A*(x0+h*k3)+b*u;
    x0=x0+h/6*(k1+2*k2+2*k3+k4);
    x(:,i+1)=x0;
end
for i=1:N
   x(:,i+4)=x(:,i+3)+h*b*u+h/24*A*(55*x(:,i+3)-59*x(:,i+2)+37*x(:,i+1)-9*x(:,i));
   x(:,i+4)=x(:,i+3)+h*b*u+h/24*A*(9*x(:,i+4)+19*x(:,i+3)-5*x(:,i+2)+x(:,i+1));
end
t=0:h:h*(N+3);
if option
    plot(t,x(1,:),'r',t,x(2,:),'b--',t,x(3,:),'k:')
    legend('y','dy','ddy')
else
    plot(t,x(1,:),'r')
    legend('y')
end
grid on
title('亚当姆斯预估-校正法，h=0.01')
xlabel('time(sec)')
ylabel('y')
