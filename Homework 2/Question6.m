Question5;

predicted = predict(tree, testing(:,1:4));
[accuracyMatrix, order] = confusionmat(testing(:,5), predicted);

N = sum(sum(accuracyMatrix(:,:)));
accuracy = (accuracyMatrix(1,1) + accuracyMatrix(2,2))/N;
c0precision = accuracyMatrix(1,1) / (accuracyMatrix(1,1) + accuracyMatrix(2,1));
c0recall = accuracyMatrix(1,1) / (accuracyMatrix(1,1) + accuracyMatrix(1,2));
c1precision = accuracyMatrix(2,2) / (accuracyMatrix(1,2) + accuracyMatrix(2,2));
c1recall = accuracyMatrix(2,2) / (accuracyMatrix(2,1) + accuracyMatrix(2,2));

fprintf('Accuracy: %f\n', accuracy);
fprintf('c0 Precision: %f\n', c0precision);
fprintf('c0 Recall: %f\n', c0recall);
fprintf('c1 Precision: %f\n', c1precision);
fprintf('c1 Recall: %f\n', c1recall);
