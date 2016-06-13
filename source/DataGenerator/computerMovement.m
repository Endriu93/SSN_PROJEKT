function matrix=computerMovement(matrix,symbol,failChance)
% this function process movement for computer
global EMPTY

% generate random movement to give better chances for neural network to win
if rand < failChance
    while true
        x = randi(5);
        y = randi(5);
        if matrix(x,y) == EMPTY
            matrix(x,y) = symbol;
            break;
        end
    end
else
    matrix = bestMovement(matrix,symbol);
end
