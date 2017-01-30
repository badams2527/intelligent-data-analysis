function [  ] = Question8( )
%QUESTION8 Answer to Question8
%   Select the four student pairs with the minimum distance values from 
%   the Euclidean distance table.

% get the euclidean distances from Question7
gradeMatrix = [ 13, 4, 80; 24, 0, 90;  46, 14, 80; 55, 15, 90; 55, 19, 100;
    54, 60, 80; 78, 48, 90; 65, 82, 80; 75, 87, 90; 91, 100, 80];

euclidean = pdist(gradeMatrix, 'euclidean');

% select the min, then remove it (repeat x3)
min1 = min(euclidean);
euclidean = euclidean(euclidean~=min1);

min2 = min(euclidean);
euclidean = euclidean(euclidean~=min2);

min3 = min(euclidean);
euclidean = euclidean(euclidean~=min3);

min4 = min(euclidean);
euclidean = euclidean(euclidean~=min4);

fprintf('Min Distances: %f, %f, %f, %f\n', min1, min2, min3, min4);

end

