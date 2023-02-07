function [length_tl, Xm] = le_tuner(ZL, Z0, lambda, solution_type)
% Lumped Element Matching Circuit (Tuner)
% Returns length between stub and load and gives the impedance necessary to match ZL with Z0
% Solution type is either "short" or "long"
Z=ZL/Z0;
Y=1/Z;
GammaL=(ZL-Z0)/(ZL+Z0);
thetaL=angle(GammaL);

if real(Y) < 1
    if solution_type == "short"
        bm=2*abs(GammaL)/sqrt(1-abs(GammaL)^2);
        thetaM=pi/2-atan(bm/2);
    elseif solution_type == "long"
        bm=-2*abs(GammaL)/sqrt(1-abs(GammaL)^2);
        thetaM=-pi/2-atan(bm/2);
    end
    Xm = Z0/bm;
    length_tl=(pi+thetaL-thetaM)/(4*pi)*lambda;
elseif real(Y) > 1
    if solution_type == "short"
        bm=-2*abs(GammaL)/sqrt(1-abs(GammaL)^2);
        thetaM=-pi/2-atan(bm/2);
        if thetaL > 0
            length_tl=(thetaL-thetaM-pi)/(4*pi)*lambda;
        elseif thetaL < 0
            length_tl=(thetaL-thetaM+pi)/(4*pi)*lambda;
        end
    elseif solution_type == "long"
        bm=2*abs(GammaL)/sqrt(1-abs(GammaL)^2);
        thetaM=pi/2-atan(bm/2);
        if thetaL > 0
            length_tl=(thetaL-thetaM+pi)/(4*pi)*lambda;
        elseif thetaL < 0
            length_tl=(thetaL-thetaM+3*pi)/(4*pi)*lambda;
        end
    end
    Xm = Z0/bm;
end
length_tl=vpa(length_tl);
Xm=vpa(Xm);

end