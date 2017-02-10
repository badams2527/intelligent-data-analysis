% create random array of 1...1372 to random selection of data
indexSeed = randperm(1372, 1372);

trainingSeedIdx = indexSeed(1:800);
validationSeedIdx = indexSeed(801:1000);
testingSeedIdx = indexSeed(1001:1372);

training = d1(trainingSeedIdx, :);
validation = d1(validationSeedIdx, :);
testing = d1(testingSeedIdx, :);

