

initial_guess=[12 45 0.03 1.7 0.02];

Q = 550;
tr = 0:0.01:2.5;
patient_data = load('Patientdata_Task3.txt');
N = 30;
SP = 0:0.5:14.5;

x = fminsearch(@(x) sse_Task3(x,tr,patient_data,N,Q,SP), initial_guess);
  
 TOP = x(1)
 Cfrc = x(2)
 K = x(3)
 CL = x(4)
 R = x(5)
 y0=0;
 [tsol,ysol] = ode45(@(t,y) PRM(tr,y,TOP,N,Cfrc,K,CL,SP,Q),tr,y0);
palv = ysol;
paw_m = (R*Q) + palv;
plot (tsol,paw_m,'Color','r','LineWidth',2,'LineStyle','--');
hold on
plot (tsol,patient_data,'Color','b','LineStyle','-')
xlabel('time [s]')
ylabel('airway pressure [mbar]')
legend('fitted model','patient data')
initial_guess = [550];
t=0:0.1:2.5;
x = fminsearch(@(x) sse_Task4(x,t,40,N,TOP,Cfrc,CL,K,R,SP),initial_guess);
Q=x(1)
