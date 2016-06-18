function [boards,x,y] = boardSizeOrder(boards,x,y)
%this function orders data according to count of symbols in following
%boards

all = [boards,x y];
index = zeros(1,length(boards));

for i=1:length(boards)
    index(i) = sum(abs(boards(i,:)));
end

index = index';
all = [index, all];
all = sortrows(all,1);
all(:,1) = [];

boards = all(:,1:25);
x = all(:,26);
y = all(:,27);

end

