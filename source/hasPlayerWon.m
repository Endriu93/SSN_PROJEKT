function result=hasPlayerWon(matrix,symbol)
% function tells if player represented by current symbol won the game
% TO REFRACTOR

result = false;
sum = 0;
for i=1:5
    for j=1:5
        if matrix(i,j) == symbol
            sum = sum + 1;
            if sum == 3
                result = true;
                return
            end
        else
            sum = 0;
        end
    end
    sum = 0;
end
for j=1:5
    for i=1:5
        if matrix(i,j) == symbol
            sum = sum + 1;
            if sum == 3
                result = true;
                return
            end
        else
            sum = 0;
        end
    end
    sum = 0;
end
for i=1:5
    if matrix(i,i) == symbol
        sum = sum + 1;
        if sum == 3
            result = true;
            return
        end
    else
        sum = 0;
    end
end
for i=1:5
    if matrix(i,6-i) == symbol
        sum = sum + 1;
        if sum == 3
            result = true;
            return
        end
    else
        sum = 0;
    end
end
for i=1:4
    if matrix(i,i+1) == symbol
        sum = sum + 1;
        if sum == 3
            result = true;
            return
        end
    else
        sum = 0;
    end
end
for i=1:4
    if matrix(i+1,i) == symbol
        sum = sum + 1;
        if sum == 3
            result = true;
            return
        end
    else
        sum = 0;
    end
end
for i=1:3
    if matrix(i,i+2) == symbol
        sum = sum + 1;
        if sum == 3
            result = true;
            return
        end
    else
        sum = 0;
    end
end
for i=1:3
    if matrix(i+2,i) == symbol
        sum = sum + 1;
        if sum == 3
            result = true;
            return
        end
    else
        sum = 0;
    end
end

end