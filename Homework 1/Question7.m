function [ ] = Question7( )
%QUESTION7 Answer to Question7
%   Select two students for each type of grade from the list of grades 
%   assigned in #1 above. Create a 10X10 table of all pairwise distances 
%   using Euclidean distance

gradeMatrix = [ 97; 114; 139; 162; 182; 204; 227; 244; 269; 287];

euclidean = pdist(gradeMatrix, 'euclidean');

disp(squareform(euclidean));

end

