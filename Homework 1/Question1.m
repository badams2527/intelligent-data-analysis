function [ ] = Question1( ) 
%QUESTION1 Answer to Question1
%   Add the three scores for each student and write the sum in a new 
%   column. Discretize the new sum column into five groups using equal 
%   width partitioning and assign one of the five grades 
%   (A, B, C, D, and F) to students in the five groups (the highest scores 
%   get A and the lowest scores get F). Show the grades assigned to each 
%   student in a list sorted according to student id.  List the counts of 
%   each letter grade awarded.

% load the matrix from the workspace variables
matrix = evalin('base', 'DataHW1');

% summate each row of Phys, Maths, English scores
scoreSum = horzcat(matrix, sum(matrix(:,2:4),2));

% equalWidth = (max-min) / N
binSize = (max(scoreSum(:,5)) - min(scoreSum(:,5))) / 5;

% sort the matrix based on the score
sortedMatrix = sortrows(scoreSum);

% evaluate a letter grade for each score by binSize from min to max
discretized = discretize(sortedMatrix(:,5), min(scoreSum(:,5)):binSize:max(scoreSum(:,5)), 'categorical', {'F' 'D' 'C' 'B' 'A'});

% print the grades
for x = 1:length(matrix)
   fprintf('%d: %d %s\n', sortedMatrix(x,1), sortedMatrix(x,5), char(discretized(x))); 
end

% print the amounts of each grade
fprintf('F: %d D: %d C: %d B: %d A: %d\n', histcounts(sortedMatrix(:,5), 5));