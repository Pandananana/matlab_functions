function [E0] = convH2E(H0,beta,eta)
% Find amplitude of electric wave from magnetic wave and beta
beta_hat=beta/norm(beta);
E0=-cross(beta_hat,H0)*eta;
end