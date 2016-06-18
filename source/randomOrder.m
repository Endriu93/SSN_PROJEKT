function [boards,x,y] = randomOrder(boards,x,y)
%this function mix data

all = [boards,x y];
index = randperm(length(boards));
index = index';
all = [index, all];
all = sortrows(all,1);
all(:,1) = [];

boards = all(:,1:25);
x = all(:,26);
y = all(:,27);

end

