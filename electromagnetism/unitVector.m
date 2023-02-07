function [vector] = unitVector(dimension)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if (dimension == "x") || (dimension == "X")
    vector = [1;0;0];
elseif (dimension == "y") || (dimension == "Y")
    vector = [0;1;0];
elseif (dimension == "z") || (dimension == "z")
    vector = [0;0;1];
else
    error("Incorrect dimension format");
end

end