function [ alpha_if,beta_if ] = commond_filter( alpha1,beta_if_prev,alpha_if_prev,dt )
taw=[0.707;0.707];
RO=[80;80];
alpha_if_dot=beta_if_prev;
betha_ifdot=-2*taw'*RO*beta_if_prev-RO'*RO*(alpha_if_prev-alpha1);
alpha_if=alpha_if_dot*dt+alpha_if_prev;
beta_if=betha_ifdot*dt+beta_if_prev;

end

