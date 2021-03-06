function [ distancevector ] = distanceToPlane( pointsmatrix, planemodel )
    distancevector= zeros(1,size(pointsmatrix,1));
    for i = 1: size(pointsmatrix,1)
        a= planemodel.Parameters(1);
        b= planemodel.Parameters(2);
        c= planemodel.Parameters(3);
        d= planemodel.Parameters(4);
        x=pointsmatrix(i,1);
        y=pointsmatrix(i,2);
        z=pointsmatrix(i,3);
        distancevector(i) = (a*x+b*y+c*z+d)/sqrt(a*a+b*b+c*c);
    end
end

