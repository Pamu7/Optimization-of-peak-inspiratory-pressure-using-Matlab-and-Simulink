function SSE = sse_Task4(x,t,paw,N,TOP,Cfrc,CL,K,R,SP)

Q = x(1);
y0 = 0;

[tsol,ysol] = ode45(@(t,y) PRM(t,y,TOP,N,Cfrc,K,CL,SP,Q),t,y0);
palv = ysol;
paw_m = (R*Q) + palv;
paw_m= max(paw_m);
SSE = sum((paw_m-paw).^2);
