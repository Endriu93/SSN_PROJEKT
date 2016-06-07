function board = playNet(net, count, handles, board)

global CIRCLE EMPTY

checkWin(board, count);

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

num = 5*(y-1) + x;
set(eval(['handles.pushbutton' int2str(num)]),'String','O');
set(handles.end_status,'String','Your turn (X)');