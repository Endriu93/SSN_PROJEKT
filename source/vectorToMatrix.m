function matrix = vectorToMatrix(vector)
%this function assigns values from vector to matrix
matrix = zeros(5);
for i=1:25
    matrix(floor((i-1)/5)+1, mod(i-1,5)+1) = vector(i);
end

end

