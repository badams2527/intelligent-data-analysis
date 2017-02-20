% declare and train the perceptron
net = perceptron;
net.trainParam.epochs = 800;
[net, tr] = train(net, training(:,[1 2])',training(:,5)');

% print the weights
fprintf('Weights:\n');
disp(getwb(net));

% plot the points and the perceptron
Question2;
hold on;
plotpc(net.IW{1}, net.b{1});