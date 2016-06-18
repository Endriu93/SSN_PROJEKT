clear;
clc;

load('boardsState2'); % get data for training and test

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
