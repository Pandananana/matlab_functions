function [isPlane] = isPlaneWaveLossless(beta,E0,H0)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
eta =sqrt(mu_0/epsilon_0);
isPlane = 0;
beta_norm=beta/sqrt(dot(beta,conj(beta)));

if dot(beta,E0) == 0
    if dot(beta,H0) == 0
        if isequal(round(cross(beta_norm,H0),2),round(-1/eta*E0,2)) == 1
            if isequal(round(cross(beta_norm,E0),2),round(eta*H0,2)) == 1
                isPlane = 1;
            end
        end
    end
end
end