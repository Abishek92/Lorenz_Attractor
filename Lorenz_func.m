function [X] = Lorenz_func(t,X0,sigma,beta,rho)
%% Function to Simulate a Lorenz system for particular initial conditions and 
% values of sigma, beta and rho
% sigma = 10;
% beta = 8/3;
% rho = 28;
X(1) = -sigma*X0(1) + sigma*X0(2);
X(2) = rho*X0(1) - X0(2) - X0(1)*X0(3);
X(3) = -beta*X0(3) + X0(1)*X0(2);
X = X';
end