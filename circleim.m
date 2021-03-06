function I = circleim(width, margin)
% returs a image matrix with a circle drawn in white. 
%
% Image is a square with side length = width + (margin * 2)

width = round(width);
margin = round(margin);

sideLength = width + (margin * 2);
I = zeros(sideLength);
centerPoint = ((sideLength - 1) / 2) + 1;
[X, Y] = meshgrid(1:sideLength, 1:sideLength);
inCircle = ((X - centerPoint) .^ 2 + (Y - centerPoint) .^ 2) ...
    <= ((width / 2) ^ 2);
I(inCircle) = 1;
end

