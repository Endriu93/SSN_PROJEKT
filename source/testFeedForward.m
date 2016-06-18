clear;
clc;

% In this script we want to test FEEDFORWARD network with different number
% of neurons in hidden layer
% Beside that we want to check, whether it is better to apply 2 neurons in output
% layer, or to  create 2 networks so that the one will give x coordinate,
% and second will give y coordinates as a result.

load('boardsState2'); % get data for training and test

NeuronsNum = [10,15,20,25,30,40,50,60,70,100,200,300];
net_v1 = cell(1,length(NeuronsNum)); % separate net for each spread value
net_v2 = cell(1,length(NeuronsNum)); % separate net for each spread value
net_v3 = cell(1,length(NeuronsNum)); % separate net for each spread value

% create networks for v1 version and v2
iter = 1;
for i = NeuronsNum
    net_v1{iter} = defineNetwork(boards([1:2000],:),x([1:2000],:),y([1:2000],:),i);
    net_v2{iter} = defineNetwork_v2(boards([1:2000],:),x([1:2000],:),y([1:2000],:),i);
    net_v3{iter} = defineNetwork_v3(boards([1:2000],:),x([1:2000],:),y([1:2000],:),i);
    iter = iter+1;
end

%% TEST network in version V1 for different number of neurons in hidden layer
errors_v1 = zeros(1,length(NeuronsNum));
for s = 1:length(NeuronsNum)
    for i=1:size(boards_test,1)
        out = net_v1{s}(boards_test(i,:)');
        x_sim = round(out(1));
        y_sim = round(out(2));

        if x_sim ~= x_test(i) || y_sim ~= y_test(i)
            errors_v1(s) = errors_v1(s) + 1;
        end
    end
end

% plot for v1 version
plot(NeuronsNum,errors_v1./length(boards_test).*100);
title('procent b³êdnych wyników dla sieci FEEDFORWARD w zale¿noœci od iloœci neuronów w warstwie ukrytej');
ylabel('procent b³êdnych wyników');
xlabel('iloœæ neuronów w warstwie ukrytej');

%% TEST network in version V2 for different number of neurons in hidden layer
errors_v2 = zeros(1,length(NeuronsNum));
for s = 1:length(NeuronsNum)
    for i=1:size(boards_test,1)
        % NOTE: network reeturns 5x1 matrix, hence we must to find index
        % with max value
        out1 = net_v2{s}{1}(boards_test(i,:)');
        out2 = net_v2{s}{2}(boards_test(i,:)');
        
        % find max indexes.
        maxScore1 = max(out1);
        x_sim = find(out1 == maxScore1);
        x_sim = x_sim(1); 
        maxScore2 = max(out2);
        y_sim = find(out2 == maxScore2);
        y_sim = y_sim(1);
        
        if x_sim ~= x_test(i) || y_sim ~= y_test(i)
            errors_v2(s) = errors_v2(s) + 1;
        end
    end
end

% plot for v1 version
plot(NeuronsNum,errors_v2./length(boards_test).*100);
title('procent b³êdnych wyników dla sieci FEEDFORWARD w zale¿noœci od iloœci neuronów w warstwie ukrytej');
ylabel('procent b³êdnych wyników');
xlabel('iloœæ neuronów w warstwie ukrytej');

%% TEST network in version V1 for different number of neurons in hidden layer
errors_v3 = zeros(1,length(NeuronsNum));
for s = 1:length(NeuronsNum)
    for i=1:size(boards_test,1)
        % NOTE: network reeturns 5x1 matrix, hence we must to find index
        % with max value
        out = net_v3{s}(boards_test(i,:)');
        
        % find max indexes.
        maxScore = max(out);
        x_y = find(out == maxScore);
        x_y = x_y(1); 
        
        x_sim = mod(x_y,5);
        y_sim = ceil(x_y/5);
        if x_sim ~= x_test(i) || y_sim ~= y_test(i)
            errors_v3(s) = errors_v3(s) + 1;
        end
    end
end

% plot for v1 version
plot(NeuronsNum,errors_v3./length(boards_test).*100);
title('procent b³êdnych wyników dla sieci FEEDFORWARD w zale¿noœci od iloœci neuronów w warstwie ukrytej');
ylabel('procent b³êdnych wyników');
xlabel('iloœæ neuronów w warstwie ukrytej');

plot(NeuronsNum,errors_v1./length(boards_test).*100,NeuronsNum,errors_v2./length(boards_test).*100,NeuronsNum,errors_v3./length(boards_test).*100);
title('procent b³êdnych wyników dla sieci FEEDFORWARD w zale¿noœci od iloœci neuronów w warstwie ukrytej');
ylabel('procent b³êdnych wyników');
xlabel('iloœæ neuronów w warstwie ukrytej');
legend('network version1','network version2','network_version3');

%% Test FEEDFORWARD network in version 2 with different number of samples in training set
% Number of neurons in hidden layer is 100 according to above tests.
neuronsNum = 100;
trainSetCount = 200:200:5000;
net_v1 = cell(1,length(trainSetCount)); % separate net for each spread value

% create networks for different sizes of training set
iter = 1;
for i = trainSetCount
    net_v1{iter} = defineNetwork_v2(boards([1:i],:),x([1:i],:),y([1:i],:),neuronsNum);
    iter = iter+1;
end

% TEST network in version v1 for different size of training set.
errors_v3 = zeros(1,length(trainSetCount));
for s = 1:length(trainSetCount)
    for i=1:size(boards_test,1)
        % NOTE: network reeturns 5x1 matrix, hence we must to find index
        % with max value
        out1 = net_v1{s}{1}(boards_test(i,:)');
        out2 = net_v1{s}{2}(boards_test(i,:)');
        
        % find max indexes.
        maxScore1 = max(out1);
        x_sim = find(out1 == maxScore1);
        x_sim = x_sim(1); 
        maxScore2 = max(out2);
        y_sim = find(out2 == maxScore2);
        y_sim = y_sim(1);
        
        if x_sim ~= x_test(i) || y_sim ~= y_test(i)
            errors_v3(s) = errors_v3(s) + 1;
        end
    end
end

plot(trainSetCount,errors_v3./length(boards_test).*100);
title('procent b³êdnych wyników dla sieci FEEDFORWARD w zale¿noœci od rozmiaru zbioru ucz¹cego');
ylabel('procent b³êdnych wyników');
xlabel('rozmiar zbioru testowego');
legend('FEEDFORWARD v1, 100 neurons in hidden layer');

%% TEST network version v2 for different number of neurons in hidden layer
%% ADDITIONAL TEST.

NeuronsNum = 100:200:1100;
net_v2 = cell(1,length(NeuronsNum)); % separate net for each spread value

% create networks for v1 version and v2
iter = 1;
for i = NeuronsNum
    net_v2{iter} = defineNetwork_v2(boards([1:2000],:),x([1:2000],:),y([1:2000],:),i);
    iter = iter+1;
end

errors_v4 = zeros(1,length(NeuronsNum));
for s = 1:length(NeuronsNum)
    for i=1:size(boards_test,1)
        % NOTE: network reeturns 5x1 matrix, hence we must to find index
        % with max value
        out1 = net_v2{s}{1}(boards_test(i,:)');
        out2 = net_v2{s}{2}(boards_test(i,:)');
        
        % find max indexes.
        maxScore1 = max(out1);
        x_sim = find(out1 == maxScore1);
        x_sim = x_sim(1); 
        maxScore2 = max(out2);
        y_sim = find(out2 == maxScore2);
        y_sim = y_sim(1);
        
        if x_sim ~= x_test(i) || y_sim ~= y_test(i)
            errors_v4(s) = errors_v4(s) + 1;
        end
    end
end

plot(NeuronsNum,errors_v4./length(boards_test).*100);
title('procent b³êdnych wyników dla sieci FEEDFORWARD w zale¿noœci od iloœci neuronów w warstwie ukrytej');
ylabel('procent b³êdnych wyników');
xlabel('iloœæ neuronów w warstwie ukrytej');

%% TEST different learning methods.

NeuronsNum = [10,50,100,300];
net_v1 = cell(1,length(NeuronsNum)); % separate net for each spread value
net_v2 = cell(1,length(NeuronsNum)); % separate net for each spread value

iter = 1;
for i = NeuronsNum
    net_v1{iter} = defineNetwork_v2(boards([1:2000],:),x([1:2000],:),y([1:2000],:),i);
    net_v2{iter} = defineNetwork_v2(boards([1:2000],:),x([1:2000],:),y([1:2000],:),i,'traingdx');
    
    iter = iter+1;
end

errors_v2 = zeros(1,length(NeuronsNum));
for s = 1:length(NeuronsNum)
    for i=1:size(boards_test,1)
        % NOTE: network reeturns 5x1 matrix, hence we must to find index
        % with max value
        out1 = net_v1{s}{1}(boards_test(i,:)');
        out2 = net_v1{s}{2}(boards_test(i,:)');
        
        % find max indexes.
        maxScore1 = max(out1);
        x_sim = find(out1 == maxScore1);
        x_sim = x_sim(1); 
        maxScore2 = max(out2);
        y_sim = find(out2 == maxScore2);
        y_sim = y_sim(1);
        
        if x_sim ~= x_test(i) || y_sim ~= y_test(i)
            errors_v2(s) = errors_v2(s) + 1;
        end
    end
end

errors_v3 = zeros(1,length(NeuronsNum));
for s = 1:length(NeuronsNum)
    for i=1:size(boards_test,1)
        % NOTE: network reeturns 5x1 matrix, hence we must to find index
        % with max value
        out1 = net_v2{s}{1}(boards_test(i,:)');
        out2 = net_v2{s}{2}(boards_test(i,:)');
        
        % find max indexes.
        maxScore1 = max(out1);
        x_sim = find(out1 == maxScore1);
        x_sim = x_sim(1); 
        maxScore2 = max(out2);
        y_sim = find(out2 == maxScore2);
        y_sim = y_sim(1);
        
        if x_sim ~= x_test(i) || y_sim ~= y_test(i)
            errors_v3(s) = errors_v3(s) + 1;
        end
    end
end

plot(NeuronsNum,errors_v2./length(boards_test).*100,NeuronsNum,errors_v3./length(boards_test).*100);
title('porównanie metod uczenia traincsg i traingdx');
ylabel('procent b³êdnych wyników');
xlabel('iloœæ neuronów w warstwie ukrytej');
legend('trainscg','traingdx');
