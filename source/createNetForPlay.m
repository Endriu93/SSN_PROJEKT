clear;
clc;

% LOAD GENERATED SET OF BOARDS AND ANSWERS
load('boardsState3'); 

% TRIPLE SIZE OF SAMPLES BY BOARDS REFLECTION 
%[boards,x,y] = reflectBoards(boards,x,y);

% CHANGE ORDER OF BOARDS. 
%[boards,x,y] = randomOrder(boards,x,y);
%[boards,x,y] = boardSizeOrder(boards,x,y);

% CREATE AND TRAIN RBF NET WITH SPREAD = 0.1
net = defineRBFNetwork_v2(boards',x',y',0.1);

% SAVE NET FOR PLAYS
save('netForPlay.mat','net');