function SSE = sse_Task3(x,t,paw,N,Q,SP)

TOP = x(1);
Cfrc = x(2);
K = x(3);
CL = x(4);
R = x(5);
y0 = 0;

[tsol,ysol] = ode45(@(t,y) PRM(t,y,TOP,N,Cfrc,K,CL,SP,Q),t,y0);
palv = ysol;
paw_m = (R*Q) + palv;
SSE = sum((paw_m-paw).^2);
