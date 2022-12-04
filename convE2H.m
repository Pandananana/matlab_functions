function [H0] = convE2H(E0,beta,eta)
% Find amplitude of magnetic wave from electric wave and beta
beta_hat=beta/norm(beta);
H0=cross(beta_hat,E0)/eta;
end