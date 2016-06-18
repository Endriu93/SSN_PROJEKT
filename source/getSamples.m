function [boards x y] = getSamples(N,initMatrix)
% this function returns set of boards, and the best answers for these
% boards
i=0;
boards = [];
x = [];
y = [];

% define used symbols
global CIRCLE SHARP EMPTY PLAYER OPPONENT
CIRCLE = 1; 
SHARP = -1;
EMPTY = 0;

maxdepth =4;
tmp = initMatrix;
tmpx=0;
tmpy=0;

while i<N
    if mod(i,2) == 0 
        player = CIRCLE;
       % vec = zeros(1,25);
        %tmpvec = matrixToVector(tmp,vec);
        %boards = [boards; tmpvec]; % we adds boards only with players turn.
    else
        player = SHARP;
    end
    vec = zeros(1,25);
    tmpvec = matrixToVector(tmp,vec);
    boards = [boards; tmpvec]; 
  
    i=i+1;
    [tmp tmpx tmpy] = getbestMovement(tmp,player,4,maxdepth);
%     if player == CIRCLE
%         x = [x; tmpx];
%         y = [y; tmpy];
%     end
    x = [x; tmpx];
    y = [y; tmpy];
    if hasPlayerWon(tmp,CIRCLE,4) || hasPlayerWon(tmp,SHARP,4)
        return;
    end
    % check whether the board is full filled
    if sum(sum(abs(tmp - 0))) == 25
        return;
    end
end

end

