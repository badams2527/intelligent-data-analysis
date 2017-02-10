%Question4;

testingN = 372*2;
validationN = 200*2;
xVals = [ 1 2 5 10 15 20 25 30 35 40 45 50];
testingAccuracies = [ 0 0 0 0 0 0 0 0 0 0 0 0];
validationAccuracies = [ 0 0 0 0 0 0 0 0 0 0 0 0];

for x=1:12
    tree = fitctree(training(:,1:4), training(:,5), 'MinLeafSize', xVals(x));
    predicted = predict(tree, testing(:,1:4));
    matches = all(predicted == testing(:,5),2);
    correctMatches = sum(matches);
    testingAccuracies(x) = correctMatches/testingN;

    predicted = predict(tree, validation(:,1:4));
    matches = all(predicted == validation(:,5),2);
    correctMatches = sum(matches);
    validationAccuracies(x) = correctMatches/validationN;

end

plot(xVals, testingAccuracies, xVals, validationAccuracies);



