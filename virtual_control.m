function alpha1 = virtual_control(Z,B,W1,gama1)
kesi1=5;
epsilon_hat=0.25;
epsilon=0.08;
alpha1=-(kesi1+1)*Z-((Z)/(Z'*Z+epsilon_hat))*B^2*W1-gama1*tanh(Z/epsilon);
end

