/*
 Adapted from: http://pointclouds.org/documentation/tutorials/normal_estimation.php
*/
#include <pcl/point_types.h>
#include <pcl/features/normal_3d.h>
typedef pcl::PointXYZ PointType;

int
main (int argc, char** argv){

//  ... read, pass in or create a point cloud ...
  pcl::PointCloud<PointType>::Ptr point_cloud_ptr (new pcl::PointCloud<PointType>);
  pcl::PointCloud<PointType>& point_cloud = *point_cloud_ptr;
  std::cout << "\nNo *.pcd file given => Genarating example point cloud.\n\n";
  for (float x=-0.5f; x<=0.5f; x+=0.01f)
  {
    for (float y=-0.5f; y<=0.5f; y+=0.01f)
    {
      PointType point;  point.x = x;  point.y = y;  point.z = 2.0f - y;
      point_cloud.points.push_back (point);
    }
  }

  point_cloud.width = (int) point_cloud.points.size ();  point_cloud.height = 1;

  // Create the normal estimation class, and pass the input dataset to it
  pcl::NormalEstimation<pcl::PointXYZ, pcl::Normal> ne;
  ne.setInputCloud (point_cloud_ptr);

  // Create an empty kdtree representation, and pass it to the normal estimation object.
  // Its content will be filled inside the object, based on the given input dataset (as no other search surface is given).
  pcl::search::KdTree<pcl::PointXYZ>::Ptr tree (new pcl::search::KdTree<pcl::PointXYZ> ());
  ne.setSearchMethod (tree);

  // Output datasets
  pcl::PointCloud<pcl::Normal>::Ptr cloud_normals (new pcl::PointCloud<pcl::Normal>);
  pcl::PointCloud<pcl::Normal>& normals = *cloud_normals;

  // Use all neighbors in a sphere of radius 3cm
  ne.setRadiusSearch (0.03);

  // Compute the features
  ne.compute (*cloud_normals);
  std::cout << "Cloud normals";


  for(size_t i = normals.points.size(); i--;) //printing keypoints coordinates
    std::cout << normals.points[i]<<"\n";


  // cloud_normals->points.size () should have the same size as the input cloud->points.size ()*
}
