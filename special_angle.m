function [] = special_angle(epsilon_r1,epsilon_r2,mu_r1,mu_r2,polarization)
% Find Brewster angle and critical angle if they exist
% Polarization is either "TM" or "TE"

eta1=etaCalc(epsilon_r1,mu_r1);
eta2=etaCalc(epsilon_r2,mu_r2);

n1=sqrt(epsilon_r1*mu_r1);
n2=sqrt(epsilon_r2*mu_r2);

if polarization == "TE"
    tan_check = ((eta2/eta1)^2-1)/(1-(n1/n2)^2);
    sin_check = ((eta1/eta2)^2-1)/((mu_r1/mu_r2)^2-1);
    if tan_check >= 0
        Brewster_Angle = rad2deg(atan(sqrt(tan_check)));
    elseif sin_check >= 0
        Brewster_Angle = rad2deg(atan(sqrt(sin_check)));
    else
        Brewster_Angle = "Does not exist"
    end
elseif polarization == "TM"
    tan_check = ((eta1/eta2)^2-1)/(1-(n1/n2)^2);
    sin_check = ((eta2/eta1)^2-1)/((epsilon_r1/epsilon_r2)^2-1);
    if tan_check >= 0
        Brewster_Angle = rad2deg(atan(sqrt(tan_check)))
    elseif sin_check >= 0
        Brewster_Angle = rad2deg(atan(sqrt(sin_check)))
    else
        Brewster_Angle = "Does not exist"
    end
end

if n2 <= n1
    Critical_angle = rad2deg(asin(sqrt(n2/n1)))
else
    Critical_Angle = "Does not exist"
end

end