% read from pcd files
ptcloud1 = pcread('0.000000000.pcd');
ptcloud2 = pcread('1508533303.477297000.pcd');
ptcloud3 = pcread('1508533302.266977000.pcd');
ptcloud4 = pcread('1508533298.837721000.pcd');
ptcloud5 = pcread('1508533297.929989000.pcd');
ptcloud6 = pcread('1508533297.123091000.pcd');
ptcloud7 = pcread('1508533294.500763000.pcd');
ptcloud8 = pcread('1508533292.987833000.pcd');
ptcloud9 = pcread('1508533289.457697000.pcd');
ptcloud10 = pcread('1508533257.989409000.pcd');
ptcloud11 = pcread('1508533254.761899000.pcd');

%merge point clouds
ptcloud1a2 = pcmerge(ptcloud1, ptcloud2, 0.001);
ptcloud3a4 = pcmerge(ptcloud3, ptcloud4, 0.001);
ptcloud5a6 = pcmerge(ptcloud5, ptcloud6, 0.001);
ptcloud7a8 = pcmerge(ptcloud7, ptcloud8, 0.001);
ptcloud9a10 = pcmerge(ptcloud9, ptcloud10, 0.001);
ptcloud1t4 = pcmerge(ptcloud1a2, ptcloud3a4,0.001);
ptcloud5t8 = pcmerge(ptcloud5a6, ptcloud7a8,0.001);
ptcloud1t8 = pcmerge(ptcloud1t4, ptcloud5t8,0.001);
ptcloud1t1t10= pcmerge(ptcloud1t8, ptcloud9a10,0.001);
ptcloud1t1t102= pcmerge(ptcloud1t1t10, ptcloud11,0.001);

%show
pcshow(ptcloud1t1t102);

%after selecting and creating a variable from the brushed points
cleanedcloud = pointCloud(cleanedroom);

%save point cloud to a pcd file
pcwrite(cleanedcloud,'cleanedcloud.pcd')


%plane fitting
model = pcfitplane(pointCloud(W_cleaned_mid),2);
%show it in the same graph
pcshow(W_cleaned_mid);
hold on;
plot(model);
