function [X_d,Xdot_d ] = X_desired(t)
X_d=[-0.3*sin(0.5*t)+0.5*cos(0.25*t+pi/3);0.3*sin(0.5*t)+0.5*cos(0.25*t)];
Xdot_d=[-0.3*0.5*cos(0.5*t)-0.5*0.25*sin(0.25*t+pi/3);0.3*0.5*cos(0.5*t)-0.5*0.25*sin(0.25*t)];

end

