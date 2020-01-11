function[] = M_4()
tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%  ENGR 13200 Fall 2015
%  Programmer(s) and Purdue Email Address(es):
%  1. Lucas Miller mill1535@purdue.edu
%
%  Other Contributor(s) and Purdue Email Address(es):
%  1. Name login@purdue.edu
%
%  Section #: 001      Team #: 10
%
%  Assignment #: M4
%
%  Academic Integrity Statement:
%
%       I/We have not used source code obtained from
%       any other unauthorized source, either modified
%       or unmodified.  Neither have I/we provided access
%       to my/our code to another. The project I/we am/are 
%       submitting is my/our own original work.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- INPUTS ---

data = csvread('fos_time_histories.csv');
time = data(:,1);

if all(time) ~= 1
    badNum = find(data <=0);
    data(badNum) = 0;
end


% --- CALCULATIONS ---

for count = 2:101
    tau(count) = M_2_approach1_team10(time, data(:, count));
end

FOS_1 = tau(2:21);
    avg1 = mean(FOS_1);
    dev1 = std(FOS_1);

FOS_2 = tau(22:41);
    avg2 = mean(FOS_2);
    dev2 = std(FOS_2);
    
FOS_3 = tau(42:61);
    avg3 = mean(FOS_3);
    dev3 = std(FOS_3);
    
FOS_4 = tau(62:81);
    avg4 = mean(FOS_4);
    dev4 = std(FOS_4);
    
FOS_5 = tau(82:101);
    avg5 = mean(FOS_5);
    dev5 = std(FOS_5);

% --- OUTPUTS ----
%plots are already output in the called function
% --- RESULTS ----
% fprintf('FOS1: AVG-%d, DEV-%d\n', avg1, dev1)
% fprintf('FOS2: AVG-%d, DEV-%d\n', avg2, dev2)
% fprintf('FOS3: AVG-%d, DEV-%d\n', avg3, dev3)
% fprintf('FOS4: AVG-%d, DEV-%d\n', avg4, dev4)
% fprintf('FOS5: AVG-%d, DEV-%d\n', avg5, dev5)
toc


