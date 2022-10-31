function [] = polarization(E0,beta,tilt_axis)
% Finds the polarization of electric waves, given amplitude E0
%   Detailed explanation goes here
E0r = real(E0);
E0i = imag(E0);

if nargin < 2
    beta = [0;0;0];
end

if round(cross(E0r,E0i),10) == 0
    pType = "Linearly Polarized"
else
    if round(norm(E0r),10) == round(norm(E0i),10)
        if dot(E0r,E0i) == 0
            pType = "Circularily Polarized"
        else
            pType = "Elliptically Polarized"
        end
    else
        pType = "Elliptically Polarized"
    end
    if nargin >= 2
        if dot(beta,cross(E0i,E0r)) < 0
            Handedness = "Left-hand"
        else
            Handedness = "Right-hand"
        end
    end
    if pType == "Elliptically Polarized"
        phi0=1/2*atan(2*dot(E0r,E0i)/(norm(E0i)^2-norm(E0r)^2));
        E1=E0r*cos(phi0)-E0i*sin(phi0);
        E2=-E0r*sin(phi0)-E0i*cos(phi0);
        if norm(E1) > norm(E2)
            Major = "E1"
            major_vec = E1;
        elseif norm(E2) > norm(E1)
            Major = "E2"
            major_vec = E2;
        end
        if nargin >= 3
            if tilt_axis == "x"
                tilt = rad2deg(atan(major_vec(2)/major_vec(1)))
            elseif tilt_axis == "y"
                tilt = rad2deg(atan(major_vec(1)/major_vec(2)))
            elseif tilt_axis == "z"
                tilt = rad2deg(atan(major_vec(2)/major_vec(3)))
            end
        end
        AR=norm(E2)/norm(E1)
    end
end