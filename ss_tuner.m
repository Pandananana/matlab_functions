function l_stub = ss_tuner(Xm,Z_stub,lambda,circuit_type)
% Single-stub Matching Circuit (Tuner)
% Replaces Xm by a stub and calculates length of that stub

if circuit_type == "sc"
    if Xm > 0
        l_stub=lambda/(2*pi)*atan(Xm/Z_stub);
    elseif Xm < 0
        l_stub=lambda/(2*pi)*atan(Xm/Z_stub)+lambda/2;
    end
elseif circuit_type == "oc"
    if Xm > 0
        l_stub=-lambda/(2*pi)*atan(Z_stub/Xm)+lambda/2;
    elseif Xm < 0
        l_stub=-lambda/(2*pi)*atan(Z_stub/Xm);
    end
end
l_stub=vpa(l_stub);
end