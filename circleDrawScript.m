cellSize = [100, 100];
numSize = [64, 64];
base = 3;
dirname = 'AdicMapData';
fileGlob = dir(sprintf([dirname, filesep, 'Base%03d*.mat'], base));
load([fileGlob.folder, filesep, fileGlob.name], 'AFrac', 'AInt');
imSize = cellSize .* numSize;

cellImages = zeros([cellSize, base]);
margin = 9;
ICircle = circleim(cellSize(1) - (2 * margin), margin);
cellImages(:,:,2) = ICircle * adicmap2im(1, base);
cellImages(:,:,3) = ICircle * adicmap2im(0, base);
% FIXME - Assuming Square

[IInt, IFrac] = deal(zeros(imSize));

corners1 = (1:cellSize(1):(numSize(1)*cellSize(1)));
corners2 = (1:cellSize(2):(numSize(2)*cellSize(2)));

for iCorner1 = 1:length(corners1)
    for iCorner2 = 1:length(corners2)
        rows = corners1(iCorner1) + (0:(cellSize(1) - 1));
        cols = corners2(iCorner2) + (0:(cellSize(2) - 1));
        IInt(rows, cols) = cellImages(:,:,AInt(iCorner1,iCorner2) + 1);
        AInt(iCorner1,iCorner2) + 1;
        IFrac(rows, cols) = cellImages(:,:,AFrac(iCorner1,iCorner2) + 1);
    end
end
IInt = -IInt + 1;
IFrac = -IFrac + 1;
figure;
imshow(IInt);
figure;
imshow(IFrac);
