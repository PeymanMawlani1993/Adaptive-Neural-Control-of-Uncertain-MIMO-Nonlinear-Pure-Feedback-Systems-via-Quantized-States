function [gama2,W2,B2 ] = RBF2(X2,Z_prev,Beta_prev,Z,W_prev,gama_prev,dt)
w_rate=3;
w_sigma=0.01;
gama_rate=1.5;
gama_sigma=0.1;
epsilon1=0.08;
neurons=20;
c1=linspace(-0.5,0.5,neurons);
c2=linspace(-0.5,0.5,neurons);
c3=linspace(-0.5,0.5,neurons);
c4=linspace(-0.5,0.5,neurons);
c5=linspace(-0.5,0.5,neurons);
c6=linspace(-0.5,0.5,neurons);
C=[c1;c2;c3;c4;c5;c6];

X=[X2;Z_prev;Beta_prev];
sigma1=0.05;
sigma2=0.05;
sigma3=0.05;
S=[sigma1;sigma1;sigma2;sigma2;sigma3;sigma3];
B=zeros(6,neurons);
for i=1:neurons
    B(:,i)=exp(-((X-C(:,i)).^2)./(2*(S).^2));
end 

B2=norm(B);
Wdot=(w_rate*(norm(Z))^2*(B2)^2)-w_sigma*(norm(Z)^2)*W_prev;
gamadot2=gama_rate*((Z'*tanh(Z/epsilon1))-gama_sigma*norm(Z)*gama_prev);
gama2=gamadot2*dt+gama_prev;
W2=Wdot*dt+W_prev;


end

