clear;
clc;

% In this script we want to test RBF network with different spread
% parameter.
% Beside that we want to check, whether it is better to apply 2 neurons in output
% layer, or to  create 2 networks so that the one will give x coordinate,
% and second will give y coordinates as a result.

load('boardsState2'); % get data for training and test

% spreads = 0.1:0.2:2;
spreads = [0.03,0.05,0.07,0.1,0.3,0.5,1,1.5,2,5,10];
net_v1 = cell(1,length(spreads)); % separate net for each spread value
net_v2 = cell(1,length(spreads)); % separate net for each spread value
net_v3 = cell(1,length(spreads)); % separate net for each spread value

% create networks for v1 version and v2
iter = 1;
for i = spreads
    net_v1{iter} = defineRBFNetwork_v1(boards([1:2000],:)',x([1:2000],:)',y([1:2000],:)',i);
    net_v2{iter} = defineRBFNetwork_v2(boards([1:2000],:)',x([1:2000],:)',y([1:2000],:)',i);
    net_v3{iter} = defineRBFNetwork_v3(boards([1:2000],:)',x([1:2000],:)',y([1:2000],:)',i);
    iter = iter+1;
end

% TEST network in version v1 for different spread's parameter
errors_v1 = zeros(1,length(spreads));
for s = 1:length(spreads)
    for i=1:size(boards_test,1)
        out = sim(net_v1{s},boards_test(i,:)');
        x_sim = round(out(1));
        y_sim = round(out(2));

        if x_sim ~= x_test(i) || y_sim ~= y_test(i)
            errors_v1(s) = errors_v1(s) + 1;
        end
    end
end

% plot for v1 version
semilogx(spreads,errors_v1./length(boards_test).*100);
title('procent b³êdnych wyników dla sieci RBF w zale¿noœci od parametru SPREAD');
ylabel('procent b³êdnych wyników');
xlabel('wartoœæ parametru SPREAD');

% TEST network in version V2 for different spread's parameter
errors_v2 = zeros(1,length(spreads));
for s = 1:length(spreads)
    for i=1:size(boards_test,1)
        % NOTE: network reeturns 5x1 matrix, hence we must to find index
        % with max value
        out1 = sim(net_v2{s}{1},boards_test(i,:)');
        out2 = sim(net_v2{s}{2},boards_test(i,:)');
        
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
semilogx(spreads,errors_v2./length(boards_test).*100);
title('procent b³êdnych wyników dla sieci RBF w zale¿noœci od parametru SPREAD');
ylabel('procent b³êdnych wyników');
xlabel('wartoœæ parametru SPREAD');

% TEST network in version V2 for different spread's parameter
errors_v3 = zeros(1,length(spreads));
for s = 1:length(spreads)
    for i=1:size(boards_test,1)
        % NOTE: network reeturns 5x1 matrix, hence we must to find index
        % with max value
        out = sim(net_v3{s},boards_test(i,:)');
        
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
semilogx(spreads,errors_v3./length(boards_test).*100);
title('procent b³êdnych wyników dla sieci RBF w zale¿noœci od parametru SPREAD');
ylabel('procent b³êdnych wyników');
xlabel('wartoœæ parametru SPREAD');

semilogx(spreads,errors_v1./length(boards_test).*100,spreads,errors_v2./length(boards_test).*100,spreads,errors_v3./length(boards_test).*100);
title('procent b³êdnych wyników dla sieci RBF w zale¿noœci od parametru SPREAD');
ylabel('procent b³êdnych wyników');
xlabel('wartoœæ parametru SPREAD');
legend('network version1','network version2','network_version3');

%% Test network in version 1 with different number of samples in training set
% SPread is set to 0.1 according to above tests.
trainSetCount = 200:200:5000;
net_v1 = cell(1,length(trainSetCount)); % separate net for each spread value
net_v2 = cell(1,length(trainSetCount)); % separate net for each spread value
net_v3 = cell(1,length(trainSetCount)); % separate net for each spread value

% create networks for different sizes of training set
iter = 1;
for i = trainSetCount
    net_v1{iter} = defineRBFNetwork_v1(boards([1:i],:)',x([1:i],:)',y([1:i],:)',0.1);
    net_v2{iter} = defineRBFNetwork_v2(boards([1:i],:)',x([1:i],:)',y([1:i],:)',0.1);
    net_v3{iter} = defineRBFNetwork_v3(boards([1:i],:)',x([1:i],:)',y([1:i],:)',0.1);

    iter = iter+1;
end

% TEST network in version v1 for different size of training set.
errors_v1 = zeros(1,length(trainSetCount));
for s = 1:length(trainSetCount)
    for i=1:size(boards_test,1)
        out = sim(net_v1{s},boards_test(i,:)');
        x_sim = round(out(1));
        y_sim = round(out(2));

        if x_sim ~= x_test(i) || y_sim ~= y_test(i)
            errors_v1(s) = errors_v1(s) + 1;
        end
    end
end

% TEST network in version v2 for different size of training set.
errors_v2 = zeros(1,length(trainSetCount));
for s = 1:length(trainSetCount)
    for i=1:size(boards_test,1)
       % NOTE: network reeturns 5x1 matrix, hence we must to find index
        % with max value
        out1 = sim(net_v2{s}{1},boards_test(i,:)');
        out2 = sim(net_v2{s}{2},boards_test(i,:)');
        
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


% TEST network in version v3 for different size of training set.
errors_v3 = zeros(1,length(trainSetCount));
for s = 1:length(trainSetCount)
    for i=1:size(boards_test,1)
        % NOTE: network reeturns 5x1 matrix, hence we must to find index
        % with max value
        out = sim(net_v3{s},boards_test(i,:)');
        
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


plot(trainSetCount,errors_v1./length(boards_test).*100,trainSetCount,errors_v2./length(boards_test).*100,trainSetCount,errors_v3./length(boards_test).*100);
title('procent b³êdnych wyników dla sieci RBF w zale¿noœci od rozmiaru zbioru ucz¹cego');
ylabel('procent b³êdnych wyników');
xlabel('rozmiar zbioru testowego');
legend('RBF v1, spread = 0.1','RBF network version 2','RBF network version 3');
