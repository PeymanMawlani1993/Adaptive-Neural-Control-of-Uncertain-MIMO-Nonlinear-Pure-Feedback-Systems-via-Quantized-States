function u = actual_control( Z2,B2_norm,W2,gama2 )
kesi2=7;
epsilon_hat=0.25;
epsilon2=0.08;
u=-(kesi2+1)*Z2-((Z2)/(Z2'*Z2+epsilon_hat))*B2_norm^2*W2-gama2*tanh(Z2/epsilon2);

end

