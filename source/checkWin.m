function checkWin(board, count, handles)

global CIRCLE SHARP 

if hasPlayerWon(board,CIRCLE,count)
    set(handles.end_status,'String','Computer won');
    for i=1:25
        set(eval(['handles.pushbutton' int2str(i)]),'Enable','off');
    end
elseif hasPlayerWon(board,SHARP,count)
    set(handles.end_status,'String','You win');
    for i=1:25
        set(eval(['handles.pushbutton' int2str(i)]),'Enable','off');
    end
elseif sum(board(:) == 0) == 0
    for i=1:25
        set(eval(['handles.pushbutton' int2str(i)]),'Enable','off');
    end
end