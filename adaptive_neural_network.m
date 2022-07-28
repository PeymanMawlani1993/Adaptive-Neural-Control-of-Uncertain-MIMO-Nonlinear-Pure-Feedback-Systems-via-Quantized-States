clc
clear
%% initilization

X1_0=[0,0]';
X2_0=[0,0]';
dt=0.001;
t=0:dt:30;
X1=zeros(2,length(t));
X2=zeros(2,length(t));

U=zeros(2,length(t));
Xq11=zeros(size(t));
Xq12=zeros(size(t));
Xq21=zeros(size(t));
Xq22=zeros(size(t));
W1=zeros(size(t));
W1(1)=0.00;
W2=zeros(size(t));
W2(1)=0.00;
Gama1=zeros(size(t));
Gama1(1)=0.00;
Gama2=zeros(size(t));
Gama2(1)=0.00;
Alpha_IF=zeros(2,length(t));
Beta_IF=zeros(2,length(t));
X_d=zeros(2,length(t));
X_ddot=zeros(2,length(t));
Z1q=zeros(2,length(t));
for i=1:length(t)-1
    X_qun11=quantizer(X1(1,i),1,-1,500);
    X_qun12=quantizer(X1(2,i),1,-1,500);
    X_qun21=quantizer(X2(1,i),1,-1,500);
    X_qun22=quantizer(X2(2,i),1,-1,500);
    Xq11(i+1)=X_qun11;
    Xq12(i+1)=X_qun12;
    Xq21(i+1)=X_qun21;
    Xq22(i+1)=X_qun22;
    [x_d,xdot_d ] = X_desired(t(i));
    X_d(:,i+1)=x_d;
    X_ddot(:,i+1)=xdot_d;
    X_1q=[Xq11(i);Xq12(i)];
    Z1=X_1q-X_d(:,i);
    Z1q(:,i)=Z1;
    [ gama1,w1,B_norm1 ] = RBF1(X_1q,X_ddot(:,i),Z1,W1(i),Gama1(i),dt);
    W1(i+1)=w1;
    Gama1(i+1)=gama1;
    B1=B_norm1;
    alpha1 = virtual_control(Z1,B1,W1(i),Gama1(i));
    if i==1
        Alpha_IF(:,1)=alpha1;
    end
    [ alpha_if,beta_if ] = commond_filter( alpha1,Beta_IF(:,i),Alpha_IF(:,i),dt );
    Alpha_IF(:,i+1)=alpha_if;
    Beta_IF(:,i+1)=beta_if;
    X_2q=[Xq21(i);Xq22(i)];
    Z2=X_2q-Alpha_IF(:,i);
    [gama2,w2,B_norm2 ] = RBF2(X_2q,Z1,Beta_IF(:,i),Z2,W2(i),Gama2(i),dt);
    W2(i+1)=w2;
    Gama2(i+1)=gama2;
    B2=B_norm2;
    u = actual_control( Z2,B2,W2(i),Gama2(i) );
    U(:,i)=u;

    [X11,X21] =system2( X1(:,i),X2(:,i),U(:,i),t(i),dt);
    X1(:,i+1)=X11;
    X2(:,i+1)=X21;
    



end
figure(1)
plot(t,Xq11(1,:),'r','LineWidth',2)
hold on
plot(t,X_d(1,:),'b','LineWidth',2)
legend('y1','X1,d')
xlabel('time')
ylabel('y1 and X1,d')
figure(2)
plot(t,Xq12(1,:),'r','LineWidth',2)
hold on
plot(t,X_d(2,:),'b','LineWidth',2)
legend('y2','X2,d')
xlabel('time')
ylabel('y2 and X2,d')
figure(3)
plot(t,Z1q(1,:),'r','LineWidth',2)
legend('z1')
xlabel('time')
ylabel('z1')
figure(4)
plot(t,Z1q(2,:),'b','LineWidth',2)
legend('z2')
xlabel('time')
ylabel('z2')
figure(5)
plot(t,U(1,:),'b','LineWidth',2)
legend('u1')
xlabel('time')
ylabel('u1')
figure(6)
plot(t,U(2,:),'b','LineWidth',2)
legend('u2')
xlabel('time')
ylabel('u2')
figure(7)
plot(t,W1,'b','LineWidth',2)
hold on
plot(t,W2,'r','LineWidth',2)
legend('W1','W2')
xlabel('time')
ylabel('W1,W2')
figure(8)
plot(t,Gama1,'b','LineWidth',2)
hold on
plot(t,Gama2,'r','LineWidth',2)
legend('gama1','gama2')
xlabel('time')
ylabel('gama1,gama2')
