function matrix=bestMovement(matrix,symbol)
% function generates best movement for player represented by current symbol

global CIRCLE SHARP PLAYER OPPONENT NEXT_MOVE
PLAYER = symbol;
if PLAYER == CIRCLE
    OPPONENT = SHARP;
else
    OPPONENT = CIRCLE;
end

if (sum(matrix(:) == 0) == 25)
    matrix(3,3) = symbol;
else
    minimax(matrix,0,symbol);
    matrix = NEXT_MOVE;
end