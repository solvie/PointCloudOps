load('204planefitting.mat');

model1 = pcfitplane(pointCloud(Lwallcenter204),150);
model2 = pcfitplane(pointCloud(Rwallcenter2),100);
pcshow(pointCloud(walls_204));
hold on;
plot(model1);
plot(model2);

%vec = distanceToPlane(Lwallcenter204, model);
%histogram(vec)
