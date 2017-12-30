function I = tileim(source, tiles, flip, flipmap)

if nargin < 3
    flip = false;
end

if flip
    parity = false; 
end

tileSize = [size(tiles, 1), size(tiles, 2)];
sourceSize = size(source);
imSize = tileSize .* sourceSize;
I = zeros([imSize, size(tiles,3)]);

rowRange = 1:tileSize(1);
baseColRange = 1:tileSize(2);

hasEvenCols = (0 == mod(sourceSize(1), 2));

for iRow = 1:sourceSize(1)
    colRange = baseColRange;
    for iCol = 1:sourceSize(2)
        iTile = source(iRow, iCol);
        if iTile ~= 0
            if flip 
                if parity                    
                    tile = fliplr(tiles(:,:,:,flipmap(iTile)));
                else
                    tile = tiles(:,:,:,iTile);
                end
            else
                tile = tiles(:,:,:,iTile);
            end  
            I(rowRange, colRange, :) = tile;
        end % validTile
        parity = ~parity;
        colRange = colRange + tileSize(2);
    end
    parity = ~parity;
    rowRange = rowRange + tileSize(1);
end

