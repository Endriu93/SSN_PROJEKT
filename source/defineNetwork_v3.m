function net = defineNetwork_v3(boards,x,y,hiddenLayerNum)
% this function defines network
% hiddenLayerNum - number of neurons in hidden layer

x5 = zeros(25,length(x));

for i = 1:length(x)
    x5(5*(y(i)-1)+x(i),i) = 1;
end

net = patternnet(hiddenLayerNum);
net = configure(net, boards', x5);
net = train(net, boards', x5);

end

