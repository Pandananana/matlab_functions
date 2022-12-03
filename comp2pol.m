function [] = comp2pol(Z)
% Converts complex number in cartesian format to polar format

Z_mag=vpa(abs(Z),4)
Z_phi=vpa(rad2deg(angle(Z)),4)

end