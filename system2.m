function [ X1,X2 ] = system2( X1_prev,X2_prev,U,t,dt)
f11=(4+sin(X1_prev(1)*X1_prev(2)))*X2_prev(1)+0.3*cos(X2_prev(1));
f12=(2+sin(X1_prev(1)*X1_prev(2)))*X2_prev(2)+0.7*sin(X2_prev(2));
f21=X2_prev(2)*exp(-X1_prev(1)*(X2_prev(1))^2)+(2+(X1_prev(2))^2)*U(1)+0.5*cos(U(1));
f22=X1_prev(2)*exp(-X2_prev(1)*(X1_prev(2))^2)+(3+(X1_prev(1))^2)*U(2)+0.3*sin(U(2));
d11=0.15*cos(0.5*t);
d12=0.15*sin(0.5*t);
d21=0.1*cos(t);
d22=0.1*sin(t);
F1=[f11,f12]';
D1=[d11,d12]';
F2=[f21,f22]';
D2=[d21,d22]';

Xdot1=F1+D1;
Xdot2=F2+D2;

X1=Xdot1*dt+X1_prev;
X2=Xdot2*dt+X2_prev;



end

