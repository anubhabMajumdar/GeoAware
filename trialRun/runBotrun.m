 %arduino=serial('COM12','BaudRate',9600);
 %fopen(arduino);
 function [] = runBotrun(arduino)
 
%dir='RL';
I=imread('rd2_map.png');
dir=go(I)
% ardR=ardRoute(dir);
% l=numel(ardR);
% for i=1:l
%  fprintf(arduino,'%c',ardR(i));
% end
%fprintf(arduino,'%c','\n');
fprintf(arduino,'%s',dir);
%fprintf(arduino,'%s',dir);
run;
%fclose(arduino);
 end