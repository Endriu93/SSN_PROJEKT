function board = playUser(count, handles, board, num)

global SHARP



if mod(num, 5) == 0
    x = mod(num-1, 5) + 1;
else
    x = mod(num, 5);
end
y = ceil(num/5);
board(y, x) = SHARP;

set(eval(['handles.pushbutton' int2str(num)]),'String','X');
set(handles.end_status,'String','Computer turn (O)');

