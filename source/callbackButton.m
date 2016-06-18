function callbackButton(numButton, handles)

global CIRCLE SHARP

% get shared data
board=getappdata(gcbf,'board');
net=getappdata(gcbf,'net');
current=getappdata(gcbf,'current');

% checkWin
if checkWin(board,4,handles) ==  true
    return;
end

% if is not empty
x = ceil(numButton/5);
if mod(numButton, 5) == 0
    y = mod(numButton-1, 5) + 1;
else
    y = mod(numButton, 5);
end

if board(x, y) ~= 0 
    set(handles.end_status,'String','Try again');
% if its not user turn
elseif current ~= SHARP
    set(handles.end_status,'String','Not your turn');
else
    % checkWin
    if checkWin(board,4,handles) ==  true
        return;
    end
    
    board = playUser(4, handles, board, numButton);
    setappdata(gcbf,'current',CIRCLE);
    
    % checkWin
    if checkWin(board,4,handles) ==  true
        return;
    end
    
    % net turn after user turn
    board = playNet(net, 4, handles, board);
    setappdata(gcbf,'current',SHARP);
   
    % checkWin
    if checkWin(board,4,handles) ==  true
        return;
    end
    
    % set shared data
    setappdata(gcbf,'board',board);
    
end
