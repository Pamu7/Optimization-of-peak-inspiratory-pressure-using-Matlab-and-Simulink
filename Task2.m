TOP = 10;
N = 30;
SP = 0:0.5:14.5;
Cfrc = 45;
K = 0.03;
CL = 1.7;
Q = 700;
t = 0:0.05:2;
y0 = 0;

[tsol,ysol] = ode45(@(t,y) PRM(t,y,TOP,N,Cfrc,K,CL,SP,Q),t,y0);
palv = ysol;
R = 0.02;
paw = (R*Q) + palv;
plot(t,paw)
xlabel('time[s]');
ylabel('aveolar pressure]mbar]');
