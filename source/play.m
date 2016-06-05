function result=play(net, count, computerFailChance)
% this function represents game beetwen network and algorithm

global CIRCLE SHARP EMPTY
board = zeros(5);
% get who has the first move
if randperm(2,1) == 1
    symbol = CIRCLE;
    disp('First move to network');
else
    symbol = SHARP;
    disp('First move to computer');
end

while true
    if hasPlayerWon(board,CIRCLE,count)
        result = CIRCLE;
        disp('Network won');
        break;
    elseif hasPlayerWon(board,SHARP,count)
        result = SHARP;
        disp('Computer won');
        break;
    elseif sum(board(:) == 0) == 0
        result = EMPTY;
        break;
    end
    
    if symbol == CIRCLE
        vector = zeros(1,25);
        vector = matrixToVector(board,vector);
        fromNet = int8(net(vector'));
        x = fromNet(1);
        y = fromNet(2);
        if x < 1
            x = 1;
        elseif x > 5
            x = 5;
        end
        if y < 1
            y = 1;
        elseif y > 5
            y = 5;
        end
        
        while true
            if board(x,y) == EMPTY
                board(x,y) = CIRCLE;
                break;
            end
            y = y + 1;
            if y > 5
                y = 1;
                x = x + 1;
                if x > 5
                    x = 1;
                end
            end
        end
        symbol = SHARP;
        disp('Network moved');
        disp(board);
    elseif symbol == SHARP
        if rand < computerFailChance
            while true
                x = randi(5);
                y = randi(5);
                if board(x,y) == EMPTY
                    board(x,y) = symbol;
                    break;
                end
            end
        else
            [board, x, y] = bestMovement(board,SHARP,count,3);
            board(x,y) = SHARP;
        end
        symbol = CIRCLE;
        disp('Computer moved');
        disp(board);
    end
end