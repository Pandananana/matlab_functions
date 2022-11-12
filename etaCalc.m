function [eta] = etaCalc(epsilon_r,mu_r)
if nargin<2
    mu_r = 1;
end
eta = sqrt(mu_0*mu_r/(epsilon_r*epsilon_0));
end