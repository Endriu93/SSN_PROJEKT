function net = defineNetwork(boards,x,y,hiddenLayerNum)
% this function defines network
% hiddenLayerNum - number of neurons in hidden layer
net = feedforwardnet(hiddenLayerNum);
net = configure(net, boards', [x y]');
net = train(net, boards', [x y]');
end

