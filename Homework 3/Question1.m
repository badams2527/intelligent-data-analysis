k5sse = inf;
sse5 = [];
idx5 = [];
cluster_centers5 = [];
for i = [1,2,3]
    [idx, cluster_centers, sse] = kmeans(d1(:,2:5), 5);
    if sum(sse) < k5sse
        idx5 = idx;
        cluster_centers5 = cluster_centers;
        sse5 = sse;
        k5sse = sum(sse);
    end
end
disp('k=5 Cluster Centers: ');
disp(cluster_centers5);
disp('k=5 SSE Values: ');
disp(sse5);
disp('k=5 Total SSE: ');
disp(k5sse);

k6sse = inf;
sse6 = [];
idx6 = [];
cluster_centers6 = [];
for i = [1,2,3]
    [idx, cluster_centers, sse] = kmeans(d1(:,2:5), 6);
    if sum(sse) < k6sse
        idx6 = idx;
        cluster_centers6 = cluster_centers;
        sse6 = sse;
        k6sse = sum(sse);
    end
end
disp('k=6 Cluster Centers: ');
disp(cluster_centers6);
disp('k=6 SSE Values: ');
disp(sse6);
disp('k=6 Total SSE: ');
disp(k6sse);

k7sse = inf;
sse7 = [];
idx7 = [];
cluster_centers7 = [];
for i = [1,2,3]
    [idx, cluster_centers, sse] = kmeans(d1(:,2:5), 7);
    if sum(sse) < k7sse
        idx7 = idx;
        cluster_centers7 = cluster_centers;
        sse7 = sse;
        k7sse = sum(sse);
    end
end
disp('k=7 Cluster Centers: ');
disp(cluster_centers7);
disp('k=7 SSE Values: ');
disp(sse7);
disp('k=7 Total SSE: ');
disp(k7sse);

k8sse = inf;
sse8 = [];
idx8 = [];
cluster_centers8 = [];
for i = [1,2,3]
    [idx, cluster_centers, sse] = kmeans(d1(:,2:5), 8);
    if sum(sse) < k8sse
        idx8 = idx;
        cluster_centers8 = cluster_centers;
        sse8 = sse;
        k8sse = sum(sse);
    end
end
disp('k=8 Cluster Centers: ');
disp(cluster_centers8);
disp('k=8 SSE Values: ');
disp(sse8);
disp('k=8 Total SSE: ');
disp(k8sse);

k9sse = inf;
sse9 = [];
idx9 = [];
cluster_centers9 = [];
for i = [1,2,3]
    [idx, cluster_centers, sse] = kmeans(d1(:,2:5), 9);
    if sum(sse) < k9sse
        idx9 = idx;
        cluster_centers9 = cluster_centers;
        sse9 = sse;
        k9sse = sum(sse);
    end
end
disp('k=9 Cluster Centers: ');
disp(cluster_centers9);
disp('k=9 SSE Values: ');
disp(sse9);
disp('k=9 Total SSE: ');
disp(k9sse);

k10sse = inf;
sse10 = [];
idx10 = [];
cluster_centers10 = [];
for i = [1,2,3]
    [idx, cluster_centers, sse] = kmeans(d1(:,2:5), 10);
    if sum(sse) < k10sse
        idx10 = idx;
        cluster_centers10 = cluster_centers;
        sse10 = sse;
        k10sse = sum(sse);
    end
end
disp('k=10 Cluster Centers: ');
disp(cluster_centers10);
disp('k=10 SSE Values: ');
disp(sse10);
disp('k=10 Total SSE: ');
disp(k10sse);

x = [5,6,7,8,9,10];
y = [k5sse, k6sse, k7sse, k8sse, k9sse, k10sse];

figure;
plot(x,y);

figure;
silhouette(d1(:,2:5), idx5);

figure;
silhouette(d1(:,2:5), idx10);

% k=10 clusters provides the most accurate data according to the silhouette
% coefficients.
disp('Clustering-1 centroids: ');
disp(cluster_centers10);
disp('Clustering-1 SSEs: ');
disp(sse10);

ddata= randi([0,100],100,4);
[ddataidx, ddata_centers, ddata_sse] = kmeans(ddata, 10);
kddatasse = sum(ddata_sse);
disp('Part D Centroids: ');
disp(ddata_centers);
disp('Part D Total SSE: ');
disp(kddatasse);
disp('Clustering-1 Total SSE: ');
disp(k10sse);

% The total SSE for part D is significantly higher than that for
% Clustering-1. This is likely due to 10 not being the best k-value for the
% number of clusters