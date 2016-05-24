function vector = matrixToVector(matrix,vector)
%this function assigns values from matrix to vector
for i=1:5
    for j = 1:5
        vector((i-1)*5+j) = matrix(i,j);
    end
end

end

