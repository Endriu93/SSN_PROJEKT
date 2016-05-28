function result=minimax(matrix,depth,symbol)

% http://neverstopbuilding.com/minimax
% working for 3x3, but need improvement for 5x5
global CIRCLE SHARP EMPTY PLAYER OPPONENT NEXT_MOVE

if hasPlayerWon(matrix,PLAYER)
    result = depth - 100;
elseif hasPlayerWon(matrix,OPPONENT)
    result = 100 - depth;
% check for tie
elseif sum(matrix(:) == 0) == 0
    result = 0;
else
    depth = depth + 1;
    scores = zeros(1,25);
    if symbol == CIRCLE
        opponent = SHARP;
    else
        opponent = CIRCLE;
    end
    
    for i=1:5
        for j=1:5
            if matrix(i,j) == EMPTY
                next = matrix;
                next(i,j) = symbol;
                scores((i-1)*5+j) = minimax(next,depth,opponent);
            else
                scores((i-1)*5+j) = NaN;
            end
        end
    end
    
    if symbol == PLAYER
        maxScore = max(scores);
        index = find(scores == maxScore);
        index = index(1);
        i = floor((index-1)/5)+1;
        j = mod(index-1,5)+1;
        matrix(i,j) = PLAYER;
        NEXT_MOVE = matrix;
        result = maxScore;
    else
        minScore = min(scores);
        index = find(scores == minScore);
        index = index(1);
        i = floor((index-1)/5)+1;
        j = mod(index-1,5)+1;
        matrix(i,j) = OPPONENT;
        NEXT_MOVE = matrix;
        result = minScore;
    end
end

end