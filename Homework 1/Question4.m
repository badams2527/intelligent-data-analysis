function [ ] = Question4( )
%QUESTION4 Answer to Question4
%   Convert the Physics and Maths points to their equivalent z-scores in 
%   each column. Sum the three z-scores for each student and use equal 
%   frequency binning to create five bins. Assign letter grades to the 
%   students and show them in a list sorted by student ids.

% load the matrix from the workspace variables
matrix = evalin('base', 'DataHW1');

% convert each column to their zscore equivalents
matrix(:,2) = zscore(matrix(:,2));
matrix(:,3) = zscore(matrix(:,3));
matrix(:,4) = zscore(matrix(:,4));

% summate each row of Phys, Maths, English scores
scoreSum = horzcat(matrix, sum(matrix(:,2:4),2));

% sort the matrix based on the score
sortedMatrix = sortrows(scoreSum, 5);

% build the equal frequency array manually
% 0=F, 1=D, 2=C, 3=B, 4=A
discretized = [0; 0; 0; 0; 0; 0; 0; 0; 1; 1; 1; 1;
    1; 1; 1; 1; 2; 2; 2; 2; 2; 2; 2; 2; 3;
    3; 3; 3; 3; 3; 3; 3; 4; 4; 4; 4; 4; 4; 4; 4];
alphaArray = ['F'; 'D'; 'C'; 'B'; 'A'];

finalMatrix = horzcat(sortedMatrix, discretized);

finalMatrix = sortrows(finalMatrix, 1);
% print the grades
for x = 1:length(matrix)
   fprintf('%d: %d %s\n', finalMatrix(x,1), finalMatrix(x,5), char(alphaArray(finalMatrix(x,6)+1))); 
end

end

