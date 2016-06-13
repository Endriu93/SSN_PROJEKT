function [result,i,j]=minimax(matrix,depth,symbol,count,maxdepth)
%disp(depth)
i=nan;
j=nan;
% http://neverstopbuilding.com/minimax
% working for 3x3, but need improvement for 5x5
global CIRCLE SHARP EMPTY PLAYER OPPONENT NEXT_MOVE

% first time method is called the player was assigned given symbol
if depth==0
    PLAYER = symbol;
end
if PLAYER == CIRCLE
    OPPONENT = SHARP;
else
    OPPONENT = CIRCLE;
end

if hasPlayerWon(matrix,OPPONENT,count)
    result = depth - 100 - 20*count;
elseif hasPlayerWon(matrix,PLAYER,count)
    result = 100 + 20*count - depth;
    
% check for tie
elseif sum(matrix(:) == 0) == 0
    result = 0;
else
    
    scores = zeros(1,25);
    
     % Allow only for N depth
    if depth >=maxdepth
        result = 0;
        return;
    end
      
    if depth == 0 % First time minimax is called, children searches minimax for Player's symbol
        nextlevelplayer = symbol; 
    elseif symbol == CIRCLE
        nextlevelplayer = SHARP;
    else
        nextlevelplayer = CIRCLE;
    end
    
    for i=1:5
        for j=1:5
            if matrix(i,j) == EMPTY
                next = matrix;
                next(i,j) = nextlevelplayer;
                scores((i-1)*5+j) = minimax(next,depth+1,nextlevelplayer,count,maxdepth);
            else
                scores((i-1)*5+j) = NaN;
            end
        end
    end
    % If the victory was not found, we search once again for triple
    if min(scores) == max(scores) && depth == 0
        for i=1:5
            for j=1:5
                if matrix(i,j) == EMPTY
                    next = matrix;
                    next(i,j) = nextlevelplayer;
                    scores((i-1)*5+j) = canminimax(next,depth+1,nextlevelplayer,count-1,maxdepth);
                else
                    scores((i-1)*5+j) = NaN;
                end
            end
        end
    end
    % If the victory was not found, we search once again for two.
    if min(scores) == max(scores) && depth == 0
        for i=1:5
            for j=1:5
                if matrix(i,j) == EMPTY
                    next = matrix;
                    next(i,j) = nextlevelplayer;
                    scores((i-1)*5+j) = canminimax(next,depth+1,nextlevelplayer,count-2,maxdepth);
                else
                    scores((i-1)*5+j) = NaN;
                end
            end
        end
    end
    if nextlevelplayer == PLAYER
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

   
    if depth == 0
         result;
    end
       
end

end