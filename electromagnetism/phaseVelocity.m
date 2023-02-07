function [up] = phaseVelocity(epsilon_r,mu_r)
% Only for lossless
if nargin<2
    mu_r = 1;
end
up = physconst("LightSpeed")/(sqrt(mu_r*epsilon_r));
end
