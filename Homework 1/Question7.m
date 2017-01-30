function [ ] = Question7( )
%QUESTION7 Answer to Question7
%   Select two students for each type of grade from the list of grades 
%   assigned in #1 above. Create a 10X10 table of all pairwise distances 
%   using Euclidean distance

gradeMatrix = [ 13, 4, 80; 24, 0, 90;  46, 14, 80; 55, 15, 90; 55, 19, 100;
    54, 60, 80; 78, 48, 90; 65, 82, 80; 75, 87, 90; 91, 100, 80];

euclidean = pdist(gradeMatrix, 'euclidean');

disp(squareform(euclidean));

end