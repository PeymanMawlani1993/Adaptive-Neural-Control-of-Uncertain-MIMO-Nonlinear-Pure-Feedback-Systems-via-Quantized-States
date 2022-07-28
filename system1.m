function [ X1,X2 ] = system1( X1_prev,X2_prev,U,t,dt)
m1=1.5;
m2=1.2;
g=9.8;
Lp=0.4;
J1=m1*Lp^2;
J2=m2*Lp^2;
D=0.3;
Sc=45;
Sl=0.5;
K=D^2+D*Lp*(sin(X1_prev(1))-sin(X1_prev(2)))+((Lp^2)/2)*(1-cos(X1_prev(2)-X1_prev(1)));
Ld=sqrt(K);
T=(0.5*Lp*(cos(X1_prev(2))-cos(X1_prev(1))))/(D+0.5*Lp*(sin(X1_prev(1))-sin(X1_prev(2))));
theta0=atan(T);
f11=X2_prev(1)+0.3*cos((X1_prev(1)^2)*X1_prev(2))*X2_prev(1);
f12=X2_prev(2)+0.2*sin(X1_prev(1)*X1_prev(2))*X2_prev(2);
deltaf21=(1/J1)*((0.2+0.1*cos(X1_prev(1)*X1_prev(2)))*U(1));
f21=(1/J1)*((m1*g*Lp*sin(X1_prev(1)))-0.5*Sc*Lp*cos(X1_prev(1)-theta0)*(Ld-Sl)+U(1))+deltaf21;
deltaf22=(1/J2)*((0.2+0.1*cos(X2_prev(1)*X2_prev(2)))*U(2));
f22=(1/J2)*((m2*g*Lp*sin(X1_prev(2)))-0.5*Sc*Lp*cos(X1_prev(2)-theta0)*(Ld-Sl)+U(2))+deltaf22;
d11=0.1*cos(2*t);
d12=0.1*sin(2*t);
d21=0.2*sin(t);
d22=0.2*cos(t);
F1=[f11,f12]';
D1=[d11,d12]';
F2=[f21,f22]';
D2=[d21,d22]';

Xdot1=F1+D1;
Xdot2=F2+D2;

X1=Xdot1*dt+X1_prev;
X2=Xdot2*dt+X2_prev;



end

