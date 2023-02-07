function [length_tl,Zqw] = qw_tuner(ZL,Z1,Z2,lambda,solution_type) 
%Quarter wave matching circuit (tuner)
%Outputs: length of TL and characteristic impedance of tuner
%ZL = load impedance
%Z1 = characteristic impedance of TL before tuner
%Z2 = characteristic impedance of TL between tuner and ZL
%Set Z1 = Z2 if there is only one TL

GammaL = (ZL-Z2)/(ZL+Z2); 
thetaL = angle(GammaL); 

if imag(ZL) >= 0 
    if solution_type == "short"
        length_tl = vpa(thetaL/(4*pi)*lambda);
        RM=Z2*(1+abs(GammaL))/(1-abs(GammaL));
    elseif solution_type == "long"
        length_tl = vpa(thetaL/(4*pi)*lambda+lambda/4);
        RM=Z2*(1-abs(GammaL))/(1+abs(GammaL));
    end
elseif imag(ZL) < 0 
    if solution_type == "short"
        length_tl = vpa(thetaL/(4*pi)*lambda+lambda/4);
        RM=Z2*(1-abs(GammaL))/(1+abs(GammaL));
    elseif solution_type == "long"
        length_tl = vpa(thetaL/(4*pi)*lambda+lambda/2);
        RM=Z2*(1+abs(GammaL))/(1-abs(GammaL));
    end
end 

Zqw=sqrt(Z1*RM);

end 