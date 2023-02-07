function [PL] = power2load(Zg,Z0,ZL,gamma,Ug,length)
% Calculates power delivered to the load
% Only tested for lossless
GammaB=(ZL-Z0)/(ZL+Z0);
GammaG=(Zg-Z0)/(Zg+Z0);
UL=Ug/2*(1-GammaG)*(1+GammaB)*exp(-gamma*length)/(1-GammaG*GammaB*exp(-2*gamma*length));
PL=vpa(abs(UL)^2/(2*abs(ZL)^2)*real(ZL),5);
end