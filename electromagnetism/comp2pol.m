function [mag,deg] = comp2pol(Z)
% Converts complex number in cartesian format to polar format

Mag=vpa(abs(Z),4)
Deg=vpa(rad2deg(angle(Z)),4)

end