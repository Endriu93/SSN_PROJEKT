function [boards,x,y] = reflectBoards(boards,x,y)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
Board_size = size(boards);
X_size = size(x); 
Y_size = size(y); 


boards1 = zeros(Board_size);
boards2 = zeros(Board_size);

x1 = zeros(X_size);
x2 = zeros(X_size);

y1 = zeros(X_size);
y2 = zeros(X_size);

%vertical flip
for i=1:X_size(1)
    matrix = vectorToMatrix(boards(i,:)); % vector to matrix
    flip_matrix = flip(matrix,1); % vertical flip
    flip_vector = zeros(1,25);
    flip_vector = matrixToVector(flip_matrix,flip_vector); % flipped matrix to vector
    boards1(i,:) = flip_vector; % save
    x1(i) = 6 - x(i); % flip 
    y1(i) = y(i); 
end

% horizontal flip
for i=1:X_size(1)
    matrix = vectorToMatrix(boards(i,:)); % vector to matrix
    flip_matrix = flip(matrix,2); % horizontal flip
    flip_vector = zeros(1,25);
    flip_vector = matrixToVector(flip_matrix,flip_vector); % flipped matrix to vector
    boards2(i,:) = flip_vector; % save
    y2(i) = 6 - y(i); % flip 
    x2(i) = x(i); 
end


boards = [boards;boards1;boards2];
x = [x; x1; x2;];
y = [y; y1; y2;];

end

