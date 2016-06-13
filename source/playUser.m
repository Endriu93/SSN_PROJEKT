function board = playUser(count, handles, board, num)

global SHARP

checkWin(board, count);

x = mod(num, 5);
y = ceil(num/5);
board(y, x) = SHARP;

set(eval(['handles.pushbutton' int2str(num)]),'String','X');
set(handles.end_status,'String','Computer turn (O)');