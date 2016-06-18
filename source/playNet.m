function board = playNet(net, count, handles, board)

global CIRCLE EMPTY

checkWin(board, count, handles);

vector = zeros(1,25);
vector = matrixToVector(board,vector);

out1 = sim(net{1},vector');
out2 = sim(net{2},vector');

iter = 1;
while true
    % find max indexes.
    maxScore1 = max(out1);
    x = find(out1 == maxScore1);
    x = x(1); 
    maxScore2 = max(out2);
    y = find(out2 == maxScore2);
    y = y(1);
    
    % in this step selected index is deleted in order to choose following
    % better result in next iteration.
    if iter == 1
        out1tmp = out1;
        out1tmp(x) = 0;
        xtmp = max(out1tmp);
        xtmp = xtmp(1);
        x_diff = abs(x - xtmp);
        
        out2tmp = out2;
        out2tmp(y) = 0;
        ytmp = max(out2tmp);
        ytmp = ytmp(1);
        y_diff = abs(y - ytmp);
        
        % NOTE: sometimes network gives following result: [0 0 0.7 0.7 0],
        % so let,s try index 4 if index 3 is occupied, instead random.
        if x_diff < y_diff
            out1(x) = 0;
        else
            out2(y) = 0;
        end
    else
        if mod(iter,2) == 0
            out1(x) = 0;
        else
            out2(y) = 0;
        end
    end
    
    
    if board(x,y) == EMPTY
        board(x,y) = CIRCLE;
        
        break;
    end
end


num = 5*(x-1) + y;
set(eval(['handles.pushbutton' int2str(num)]),'String','O');
set(handles.end_status,'String','Your turn (X)');