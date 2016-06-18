function net = defineRBFNetwork_v2(boards,x,y,spread)
% this function creates and trains RBF network in version v1

% Below the N letter means number of samples.
% boards - set of following boards in form: 25xN each
% x - set of x coordinates in form: 1xN
% y - set of y coordinates in form: 1xN

% NOTE: it is version v1 of RBF networks. In this version, network has a 2
% neurons in the output layer that gives results in form of 2 numbers, that
% denotes 2 coordinates of the board.


x5 = zeros(5,length(x));
y5 = zeros(5,length(y));

for i = 1:length(x)
    x5(x(i),i) = 1;
    y5(y(i),i) = 1;
end
net = cell(1,2);
net{1} = newgrnn(boards,x5,spread);
net{1}.layers{2}.transferFcn = 'logsig';
net{2} = newgrnn(boards,y5,spread);
net{2}.layers{2}.transferFcn = 'logsig';


%net = newrbe(boards,[x; y]);

end

