function [ ] = Question3( )
%QUESTION3 Answer to Question3
%   Compare the grades assigned in problem #1 and #2 above. Make a 
%   list of those student ids whose grades changed when the method of 
%   binning changed. 

% load the matrix from the workspace variables
matrix = evalin('base', 'DataHW1');

% summate each row of Phys, Maths, English scores
scoreSum = horzcat(matrix, sum(matrix(:,2:4),2));

% sort the matrix based on the score
sortedMatrix = sortrows(scoreSum);

% /// Get the Equal Width Binning ///
% equalWidth = (max-min) / N
binSize = (max(scoreSum(:,5)) - min(scoreSum(:,5))) / 5;

% evaluate a letter grade for each score by binSize from min to max
equalWidth = discretize(sortedMatrix(:,5), min(scoreSum(:,5)):binSize:max(scoreSum(:,5)), 'categorical', {'F' 'D' 'C' 'B' 'A'});


% /// Get the Equal Frequency Binning ///
% build the equal frequency array manually
% 0=F, 1=D, 2=C, 3=B, 4=A
sortedMatrix = sortrows(scoreSum, 5);
equalFreq = [0; 0; 0; 0; 0; 0; 0; 0; 1; 1; 1; 1;
    1; 1; 1; 1; 1; 1; 2; 2; 2; 2; 2; 2; 2; 3;
    3; 3; 3; 3; 3; 3; 3; 4; 4; 4; 4; 4; 4; 4];
alphaArray = ['F'; 'D'; 'C'; 'B'; 'A'];


% combine the matrices to do the comparison
finalMatrix = horzcat(sortedMatrix, equalFreq);

finalMatrix = sortrows(finalMatrix, 1);

for x=1:length(matrix)
    % check if the grades aren't the same
    if (alphaArray(finalMatrix(x,6)+1) ~= char(equalWidth(x)))
        % print since different
        fprintf('Id: %d\n', finalMatrix(x,1));
    end
end
end

