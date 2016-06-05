function [matrix,i,j]=bestMovement(matrix,symbol,count,maxdepth)
% function generates best movement for player represented by current symbol

global PLAYER
PLAYER = symbol;

[res,i,j] = minimax(matrix,0,symbol,count,maxdepth);
%matrix = NEXT_MOVE;
