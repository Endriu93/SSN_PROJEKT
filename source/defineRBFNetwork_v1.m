function net = defineRBFNetwork_v1(boards,x,y,spread)
% this function creates and trains RBF network in version v1

% Below the N letter means number of samples.
% boards - set of following boards in form: 25xN each
% x - set of x coordinates in form: 1xN
% y - set of y coordinates in form: 1xN

% NOTE: it is version v1 of RBF networks. In this version, network has a 2
% neurons in the output layer that gives results in form of 2 numbers, that
% denotes 2 coordinates of the board.

net = newgrnn(boards,[x; y],spread);
%net = newrbe(boards,[x; y]);

end

