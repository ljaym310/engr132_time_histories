function[tau] = M5_Refinements_001_10(inXcol, inYcol)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%  ENGR 13200 Fall 2015
%  Programmer(s) and Purdue Email Address(es):
%  1. Lucas Miller mill1535@purdue.edu
%
%  Other Contributor(s) and Purdue Email Address(es):
%  1. 
%
%  Section #: 001      Team #: 10
%
%  Assignment #: M5
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
    %loads the data file selected by the user
    %noisyData = load(fileName);

%initializes variables for later use
done = 0;
count = 0;

% --- CALCULATIONS ---
%separates the input data into x and y vectors
    % noisyY = noisyData(:,2);
    % noisyX = noisyData(:,1);

noisyY = inYcol;
noisyX = inXcol;


%calculates the maximum difference in the y vector of the data set
%yChange = max(noisyY) - min(noisyY);


%Refinement #1: Changing the interval from 5 points to 60 points.
%calculates y_ss as the average of the last 60 points of the y vector
y_ss = mean(noisyY(end-60:end));

%calculates the y value of tau based on the definition given, tau ends when
%the y values have reached 63.2% of the maximum change
y_tau = .632 * y_ss;

%calculates the x value where tau ends by locating the x value paired to
%the y value nearest to y_tau
y_difference = abs(y_tau-noisyY);
xIndex = find(y_difference<=min(y_difference));
x_tau = noisyX(xIndex(1));

%estimates t_s based on the rate of change of the data set, stops when the
%y values have reached 10% of their total change

%Refinement #1: Changing the interval from 5 points to 60 points.
y_s = mean(noisyY(1:60));

yChange = y_ss - y_s;

while (done == 0);
    
    y_diff = abs(y_s - noisyY(count + 1)); 
    
    if(count ~= 0)
	%Refinement #2: changing the percent change that is required to singnify it is no longer just recording noise is 4.4%
		if y_diff > (0.044 * yChange);
		   done = 1; %change we are looking for is found, exit while loop 
		   t_s = noisyX(count);
		end
	end
    count = count + 1;
end

%definition of tau, the lateral change between t_s and the x value where
%the graph reaches 63.2% of its total change.
tau = x_tau - t_s;

% --- OUTPUTS ----

% --- RESULTS ----

