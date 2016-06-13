function [matrix,i,j]=getbestMovement(matrix,symbol,count,maxdepth)
% function generates best movement for player represented by current symbol

global PLAYER NEXT_MOVE
PLAYER = symbol;

[res,i,j] = minimax(matrix,0,symbol,count,maxdepth);
matrix = NEXT_MOVE;
