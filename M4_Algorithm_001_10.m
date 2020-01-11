function[] = M_4()
%tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%  ENGR 13200 Fall 2015
%  Programmer(s) and Purdue Email Address(es):
%  1. Lucas Miller mill1535@purdue.edu
%
%  Other Contributor(s) and Purdue Email Address(es):
%  1. Andrew Wildridge 
%  2. Yuchen Wang 
%  3. Siyao Qin
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
    price1 = 41.00;
FOS_2 = tau(22:41);
    avg2 = mean(FOS_2);
    dev2 = std(FOS_2);
    price2 = 36.50;
    
FOS_3 = tau(42:61);
    avg3 = mean(FOS_3);
    dev3 = std(FOS_3);
    price3 = 31.25;
    
FOS_4 = tau(62:81);
    avg4 = mean(FOS_4);
    dev4 = std(FOS_4);
    price4 = 24.00;
    
FOS_5 = tau(82:101);
    avg5 = mean(FOS_5);
    dev5 = std(FOS_5);
    price5 = 18.00;
    
tauVector = [avg1, avg2, avg3, avg4, avg5];
tauMean = mean(tauVector);
priceVector = [price1, price2, price3, price4, price5];
 
% --- OUTPUTS ----
 %Regression Model
 
    P1 = polyfit(priceVector, tauVector, 1);
 
    bestFit = polyval(P1, priceVector);
 
 plot(priceVector, tauVector, 'ro');
    xlabel('Price ($)');
    ylabel('Time Constant');
    title('Thermocouples FOS 1-5');
    hold on;
 
 plot(priceVector, bestFit, 'g');
    
    SSE = sum((tauVector - bestFit) .^ 2)
    SST = sum((tauVector - tauMean) .^ 2)
    r_sq = 1 - SSE/SST
    slope = P1(1)
    b = P1(2)

% --- RESULTS ----
fprintf('FOS1: AVG-%d, DEV-%d, ERR-%d\n', avg1, dev1, dev1/avg1);
fprintf('FOS2: AVG-%d, DEV-%d, ERR-%d\n', avg2, dev2, dev2/avg2);
fprintf('FOS3: AVG-%d, DEV-%d, ERR-%d\n', avg3, dev3, dev3/avg3);
fprintf('FOS4: AVG-%d, DEV-%d, ERR-%d\n', avg4, dev4, dev4/avg4);
fprintf('FOS5: AVG-%d, DEV-%d, ERR-%d\n', avg5, dev5, dev5/avg5);


%toc

