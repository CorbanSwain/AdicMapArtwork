function I = tileim(source, tiles)

tileSize = [size(tiles, 1), size(tiles, 2)];
sourceSize = size(source);
imSize = tileSize .* sourceSize;
I = zeros([imSize, size(tiles,3)]);

rowRange = 1:tileSize(1);
baseColRange = 1:tileSize(2);

for iRow = 1:sourceSize(1)
    colRange = baseColRange;
    for iCol = 1:sourceSize(2)
        iTile = source(iRow, iCol);
        if iTile ~= 0
            I(rowRange, colRange, :) = tiles(:,:,:,iTile);
        end
        colRange = colRange + tileSize(2);
    end
    rowRange = rowRange + tileSize(1);
end
