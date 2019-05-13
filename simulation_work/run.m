figure(1);
subplot(2,2,1);y1=Euler(false) 
subplot(2,2,2);Improve_Euler(false)
subplot(2,2,3);y2=Runge(false)
subplot(2,2,4);Adam(false)

h = 0.1;
N = 100;
t=0:h:h*N;
y = 1.84 - 4.95.*t.*exp(-1.88*t) - 1.5.*exp(-1.88*t) - 0.34.*exp(-6.24*t);
figure(2)
plot(t, y1-y,'r',t, y2-y,'b--');
xlabel('time(sec)');
ylabel('pred-true');
title('欧拉法和龙格库塔法误差曲线比较，h=0.1')
legend('Euler-error-curve','Runge-error-curve')