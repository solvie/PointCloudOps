%
rawlidar = pcread('raw_lidar.pcd');
blam = pcread('BLAM.pcd');

initialtransform=affine3d(rotm2tform(rotz(145)));
disp(initialtransform.T);
rawlidar = pctransform(rawlidar,initialtransform);

gridSize = 0.1;
fixed = pcdownsample(rawlidar, 'gridAverage', gridSize);
moving = pcdownsample(blam, 'gridAverage', gridSize);

tform = pcregrigid(moving, fixed);

disp(tform.T);
tform2 = invert(tform);
ptCloudAligned = pctransform(blam,tform);
%pcshow(ptCloudAligned);
%pcwrite(ptCloudAligned,'Aligned.pcd','Encoding','ascii');
mergeSize = 0.015;
ptCloudScene = pcmerge(rawlidar, ptCloudAligned, mergeSize);

pcshowpair(rawlidar,ptCloudAligned);
