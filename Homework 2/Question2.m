d10=d1(d1(:,5)==0,:);
d11=d1(d1(:,5)==1,:);

% erase any previous graph
hold off;
scatter(d10(:,1),d10(:,2),'k');
hold on;
scatter(d11(:,1),d11(:,2),'r');


% The data is not linearly separable. The Convex Hull of each set of data 
% would overlap, thus showing that the data cannot be linearly separated
% and there will be some amount of error when classifying.