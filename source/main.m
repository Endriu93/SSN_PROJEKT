clear;
clc;

% define used symbols
CIRCLE = 1; 
SHARP = -1;
EMPTY = 0;

% Matrix representing board consists of 5x5 cells.
% Each cell may be in one of above defined states: CIRCLE,SHAPE or EMPTY

board = zeros(5);
tmpVector = zeros(1,25);

net = defineNetwork();