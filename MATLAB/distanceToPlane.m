function [ distance ] = distanceToPlane( pointvector, planemodel )
    a= planemodel.Parameters(1);
    b= planemodel.Parameters(2);
    c= planemodel.Parameters(3);
    d= planemodel.Parameters(4);
    x=pointvector(1);
    y=pointvector(2);
    z=pointvector(3);
    distance = (a*x+b*y+c*z+d)/sqrt(a*a+b*b+c*c);
end

