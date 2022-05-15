function [rez] = forward(W,V,c,b,x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
rez = V'*sigmoid(W*x + c) + b;
end