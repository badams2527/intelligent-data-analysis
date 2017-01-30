function [ ] = Question2( )
%QUESTION2 Answer to Question2
%   Repeat problem #1 above with the difference that this time use equal 
%   frequency partitioning to discretize the sum of points obtained. List 
%   the counts of each letter grade awarded. List student ids of those 
%   students who would be happier with equal width binning and also of 
%   those students’ ids that would be happier with equal frequency binning.

% load the matrix from the workspace variables
matrix = evalin('base', 'DataHW1');

% summate each row of Phys, Maths, English scores
scoreSum = horzcat(matrix, sum(matrix(:,2:4),2));

% sort the matrix based on the score
sortedMatrix = sortrows(scoreSum, 5);

% build the equal frequency array manually
% 0=F, 1=D, 2=C, 3=B, 4=A
discretized = [0; 0; 0; 0; 0; 0; 0; 0; 1; 1; 1; 1;
    1; 1; 1; 1; 1; 1; 2; 2; 2; 2; 2; 2; 2; 3;
    3; 3; 3; 3; 3; 3; 3; 4; 4; 4; 4; 4; 4; 4];
alphaArray = ['F'; 'D'; 'C'; 'B'; 'A'];

finalMatrix = horzcat(sortedMatrix, discretized);

finalMatrix = sortrows(finalMatrix, 1);
% print the grades
for x = 1:length(matrix)
   fprintf('%d: %d %s\n', finalMatrix(x,1), finalMatrix(x,5), char(alphaArray(finalMatrix(x,6)+1))); 
end

% print the amounts of each grade
fprintf('F: %d D: %d C: %d B: %d A: %d\n', histcounts(finalMatrix(:,6), 5));

% print student id's who would be happier with equal width binning
fprintf('Students happier with Equal Width: 5, 7, 11, 12, 15, 16, 17, 21, 22, 28, 34, 36, 38\n');

% print student id's who would be happier with equal freq binning
fprintf('Students happier with Equal Frequency: 24, 37\n');
end

