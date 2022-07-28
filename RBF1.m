function [ gama,W,B_norm ] = RBF1(X1,Xd,Z,W_prev,gama_prev,dt)
w_rate=3;
w_sigma=0.01;
gama_rate=1.5;
gama_sigma=0.1;
epsilon1=0.08;
neurons=20;
c1=linspace(-1,1,neurons);
c2=linspace(-1,1,neurons);
c3=linspace(-0.5,0.5,neurons);
c4=linspace(-0.5,0.5,neurons);
C=[c1;c2;c3;c4];

X=[X1;Xd];
sigma1=0.1;
sigma2=0.05;
S=[sigma1;sigma1;sigma2;sigma2];
B=zeros(4,neurons);
for i=1:neurons
    B(:,i)=exp(-((X-C(:,i)).^2)./(2*(S).^2));
end 

B_norm=norm(B);
Wdot=(w_rate*(norm(Z))^2*(B_norm)^2)-w_sigma*(norm(Z)^2)*W_prev;
gamadot=gama_rate*((Z'*tanh(Z/epsilon1))-gama_sigma*norm(Z)*gama_prev);
gama=gamadot*dt+gama_prev;
W=Wdot*dt+W_prev;
end

