function [Zc] = cap(C,omega)
% Returnerer impedans af kondensator
Zc = 1/(1i*omega*C);
end