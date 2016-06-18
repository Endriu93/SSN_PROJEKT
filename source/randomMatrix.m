function matrix = randomMatrix(turns)
%this function creates randomly filled matrix
% turns - number of symbols in matrix

matrix = zeros(5);
i = 0;
symbol = 1;
while i < turns
    x = randi(3)+1;
    y = randi(3)+1;
    if matrix(x,y) == 0
        matrix(x,y) = symbol;
        symbol = -symbol;
        i = i+1;
    end
end


end

