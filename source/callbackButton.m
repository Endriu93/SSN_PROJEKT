function callbackButton(numButton, handles)

global CIRCLE SHARP

% get shared data
board=getappdata(gcbf,'board');
net=getappdata(gcbf,'net');
current=getappdata(gcbf,'current');

% if is not empty
if board(mod(numButton, 5) , ceil(numButton/5)) ~= 0 
    set(handles.end_status,'String','Try again');
% if its not user turn
elseif current ~= SHARP
    set(handles.end_status,'String','Not your turn');
else
    % check proper field on board
    board = playUser(4, handles, board, numButton);
    setappdata(gcbf,'current',CIRCLE);
    
    % net turn after user turn
    board = playNet(net, 4, handles, board);
    setappdata(gcbf,'current',SHARP);
    
    % set shared data
    setappdata(gcbf,'board',board);
    
end
