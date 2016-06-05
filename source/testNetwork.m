function [teachError, testError] = testNetwork(net,boards,x,y)
% function to test network, boards,x,y - are parameters that was used
% in teaching process
errors = 0;
for i=1:size(boards,1)
    fromNet = int8(net(boards(i,:)'));
    xx = fromNet(1);
    yy = fromNet(2);
    if xx < 1
        xx = 1;
    elseif xx > 5
        xx = 5;
    end
    if yy < 1
        yy = 1;
    elseif yy > 5
        yy = 5;
    end
    
    if x(i) ~= xx && y(i) ~= yy
        errors = errors + 1;
    end
end
teachError = errors / size(boards,1);
errors = 0;
[boards, x, y] = GetSamplesTest(5,20);
for i=1:size(boards,1)
    fromNet = int8(net(boards(i,:)'));
    xx = fromNet(1);
    yy = fromNet(2);
    if xx < 1
        xx = 1;
    elseif xx > 5
        xx = 5;
    end
    if yy < 1
        yy = 1;
    elseif yy > 5
        yy = 5;
    end
    
    if x(i) ~= xx && y(i) ~= yy
        errors = errors + 1;
    end
end
testError = errors / size(boards,1);