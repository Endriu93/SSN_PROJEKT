function [matrix,i,j]=bestMovement(matrix,symbol,count,maxdepth)
% function generates best movement for player represented by current symbol

global PLAYER NEXT_MOVE
PLAYER = symbol;

if (sum(matrix(:) == 0) == 25)
    matrix(3,3) = symbol;
end
    [res,i,j] = minimax(matrix,0,symbol,count,maxdepth);
    matrix = NEXT_MOVE;
