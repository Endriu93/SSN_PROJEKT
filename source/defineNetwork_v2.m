function net = defineNetwork_v2(boards,x,y,hiddenLayerNum,trainMethod)
% this function defines network
% hiddenLayerNum - number of neurons in hidden layer

x5 = zeros(5,length(x));
y5 = zeros(5,length(y));


if nargin < 5
    trainMethod = 'trainscg';
end

for i = 1:length(x)
    x5(x(i),i) = 1;
    y5(y(i),i) = 1;
end
net = cell(1,2);

net{1} = patternnet(hiddenLayerNum);
net{1} = configure(net{1}, boards', x5);
net{1}.trainFcn = trainMethod;
net{1} = train(net{1}, boards', x5);

net{2} = patternnet(hiddenLayerNum);
net{2} = configure(net{2}, boards', y5);
net{2}.trainFcn = trainMethod;
net{2} = train(net{2}, boards', y5);
end

