function net = defineRBFNetwork_v3(boards,x,y,spread)
% this function creates and trains RBF network in version v3

% Below the N letter means number of samples.
% boards - set of following boards in form: 25xN each
% x - set of x coordinates in form: 1xN
% y - set of y coordinates in form: 1xN

% NOTE: it is version v3 of RBF networks. In this version network has 25
% neurons in output layer.


x5 = zeros(25,length(x));

for i = 1:length(x)
    x5(5*(y(i)-1)+x(i),i) = 1;
end

net = newgrnn(boards,x5,spread);

%net = newrbe(boards,[x; y]);

end

