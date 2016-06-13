clear;
clc;

[boards,x,y] = GetSamplesTest(1000,25);

[boards_test,x_test,y_test] = GetSamplesTest(20,25);

save('boardsState2');
