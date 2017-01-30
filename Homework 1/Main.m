function Main() 
matrix = evalin('base', 'DataHW1');
size = length(matrix);
sumMatrix = horzcat(matrix, sum(matrix(:,2:4),2));
minOfSums = min(sumMatrix(:,5));
maxOfSums = max(sumMatrix(:,5));
binSize = (maxOfSums - minOfSums) / 5;

sortedSumMatrix = sortrows(sumMatrix,1);
grades = {};
aCount = 0;
bCount = 0;
cCount = 0;
dCount = 0;
fCount = 0;
for x = 1:size
    if (sortedSumMatrix(x,5) < minOfSums + binSize)
      grades{end+1,1} = sortedSumMatrix(x,1);
      grades{end,2} = 'f';
      fCount = fCount + 1;
    elseif (sortedSumMatrix(x,5) < minOfSums + (binSize*2))
      grades{end+1,1} = sortedSumMatrix(x,1);
      grades{end,2} = 'd';
      dCount = dCount + 1;
    elseif (sortedSumMatrix(x,5) < minOfSums + (binSize*3))
      grades{end+1,1} = sortedSumMatrix(x,1);
      grades{end,2} = 'c';
      cCount = cCount + 1;
    elseif (sortedSumMatrix(x,5) < minOfSums + (binSize*4))
      grades{end+1,1} = sortedSumMatrix(x,1);
      grades{end,2} = 'b';
      bCount = bCount + 1;
    else
      grades{end+1,1} = sortedSumMatrix(x,1);
      grades{end,2} = 'a'
      aCount = aCount + 1;
    end
end
discreteMatrix = discretize(sortedSumMatrix(:,5),minOfSums:binSize:maxOfSums, 'categorical', {'A' 'B' 'C' 'D' 'F'});
%disp(discreteMatrix);
for x = 1:size
   fprintf('%d: %s\r\n', sortedSumMatrix(x,1), char(discreteMatrix(x))); 
end
%disp(grades);
%fprintf('A - %d ', aCount);
%fprintf('B - %d ', bCount);
%fprintf('C - %d ', cCount);
%fprintf('D - %d ', dCount);
%fprintf('F - %d ', fCount);