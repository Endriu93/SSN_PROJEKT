function [boards,x,y] = GetSamplesTest(N,K)

% N  number of games (suggest 10)
% K  number of max possible turns in each games (suggest 20)

boards = [];
x = [];
y = [];

i=0;
while i<N
    disp(i);
    % get random matrix
    matrix = randomMatrix(4);
    [t_boards,t_x,t_y] = getSamples(K,matrix);
    boards = [boards; t_boards];
    x = [x; t_x];
    y = [y; t_y];
    i = i+1;

end

end