%Question4;
hold off;

xVals = [ 1 2 5 10 15 20 25 30 35 40 45 50];
trainingAccuracies = [ 0 0 0 0 0 0 0 0 0 0 0 0];
validationAccuracies = [ 0 0 0 0 0 0 0 0 0 0 0 0];

for x=1:12
    tree = fitctree(training(:,1:4), training(:,5), 'MinLeafSize', xVals(x));
    predicted = predict(tree, training(:,1:4));
    trainingMatrix = confusionmat(training(:,5), predicted);
    trainingN = sum(sum(trainingMatrix));
    trainingAccuracies(x) = (trainingMatrix(1,1) + trainingMatrix(2,2))/trainingN;

    predicted = predict(tree, validation(:,1:4));
    validationMatrix = confusionmat(validation(:,5), predicted);
    validationN = sum(sum(validationMatrix));
    validationAccuracies(x) = (validationMatrix(1,1) + validationMatrix(2,2))/validationN;

end

plot(xVals, trainingAccuracies, xVals, validationAccuracies);


% After analyzing the plot, minleafsize of 2 is the most accurate fit
% without overfitting the data. By looking at the plot, you can see a
% convergence where x=2, and the accuracy for both the training and
% validation is still high. After that, it takes a steep decline in
% accuracy, showing overfitting.

tree = fitctree(training(:,1:4), training(:,5), 'MinLeafSize', 2);


