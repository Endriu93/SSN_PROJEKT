clear;
clc;

matrix2 = zeros(5);
matrix2(1,1) = 1;
matrix2(2,2) = 1;

[boards,x,y] = getSamples(10,matrix2);