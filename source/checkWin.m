function result = checkWin(board, count,handles)


global CIRCLE SHARP 
result = false;

if hasPlayerWon(board,CIRCLE,count)
    set(handles.end_status,'String','Computer won');
    for i=1:25
        set(eval(['handles.pushbutton' int2str(i)]),'Enable','off');
    end
    result = true;
    return;
elseif hasPlayerWon(board,SHARP,count)
    set(handles.end_status,'String','You won');
    for i=1:25
        set(eval(['handles.pushbutton' int2str(i)]),'Enable','off');
    end
    result = true;
    return;
elseif sum(abs(board(:))) == 25 
    set(handles.end_status,'String','DRAW');
    for i=1:25
        set(eval(['handles.pushbutton' int2str(i)]),'Enable','off');
    end
    result = true;
    return;
end