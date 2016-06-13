function result=hasPlayerWon(matrix,symbol,count)
% count - count of following symbols, that gives victory
% function tells if player represented by current symbol won the game
% TO REFRACTOR

% search in a rows
result = false;
sum = 0;
for i=1:5
    sum = 0;
    for j=1:5
        if matrix(i,j) == symbol
            sum = sum + 1;
            if sum == count
                result = true;
                return
            end
        else
            sum = 0;
        end
    end
end

%search in columns
sum = 0;
for i=1:5
    sum = 0;
    for j=1:5
        if matrix(j,i) == symbol
            sum = sum + 1;
            if sum == count
                result = true;
                return
            end
        else
            sum = 0;
        end
    end
end

%search across left to right
sum = 0;
for i=1:5
    for j=1:5
        if i==j
            if matrix(i,j) == symbol
                sum = sum + 1;
                if sum == count
                    result = true;
                    return
                end
            else
                sum=0;
            end
        end
    end
end

sum = 0;
for i=1:5
    for j=1:5
        if i+1==j
            if matrix(i,j) == symbol
                sum = sum + 1;
                if sum == count
                    result = true;
                    return
                end
            else
                sum=0;
            end
        end
    end
end

sum = 0;
for i=1:5
    for j=1:5
        if i-1==j
            if matrix(i,j) == symbol
                sum = sum + 1;
                if sum == count
                    result = true;
                    return
                end
            else
                sum=0;
            end
        end
    end
end


%search across right to left
sum = 0;
for i=1:5
    for j=1:5
        if i+j==6
            if matrix(i,j) == symbol
                sum = sum + 1;
                if sum == count
                    result = true;
                    return
                end
            else
                sum=0;
            end
        end
    end
end

sum = 0;
for i=1:5
    for j=1:5
        if i+j==5
            if matrix(i,j) == symbol
                sum = sum + 1;
                if sum == count
                    result = true;
                    return
                end
            else
                sum=0;
            end
        end
    end
end

sum = 0;
for i=1:5
    for j=1:5
        if i+j==7
            if matrix(i,j) == symbol
                sum = sum + 1;
                if sum == count
                    result = true;
                    return
                end
            else
                sum=0;
            end
        end
    end
end

end