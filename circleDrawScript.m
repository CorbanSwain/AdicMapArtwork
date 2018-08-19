tileSize = [100, 100];
numSize = [81, 81];
base = 11;
dirname = 'AdicMapData';
fileGlob = dir(sprintf([dirname, '/' 'Base%03d*.mat'], base));
load([fileGlob.folder, filesep, fileGlob.name], 'AFrac', 'AInt');

AInt = AInt(1:numSize(1), 1:numSize(2));
AFrac = AFrac(1:numSize(1), 1:numSize(2));

tiles = zeros([tileSize, 1, (base - 1)]);
margin = 5;
tiles(:,:,:,1) = circleim(tileSize(1) - (2 * margin), margin);
margin = 5;
tiles(:,:,:,2) = circleim(tileSize(1) - (2 * margin), margin);

IInt = -tileim(AInt, tiles) + 1;
IFrac = -tileim(AFrac, tiles) + 1;
figure;
imshow(IInt);
figure;
imshow(IFrac);

%%

margin = 50;
htri = 90;

tileSize = size(doubleTriTile(1, 1, 1, htri, margin));
numSize = [27, 51];
base = 3;
dirname = 'AdicMapData';
fileGlob = dir(sprintf([dirname, '/', 'Base%03d*.mat'], base));
load([fileGlob.folder, filesep, fileGlob.name], 'AFrac', 'AInt');

AInt = AInt(1:numSize(1), 1:numSize(2));
AFrac = AFrac(1:numSize(1), 1:numSize(2));

[PInt, pMap] = adicmap2pairmap(AInt, base);
[PFrac, ~] = adicmap2pairmap(AFrac, base);

nTiles = length(pMap.keys) - 1;

tiles = zeros([tileSize, 1, nTiles]);

keyList = pMap.keys;
flipmap = zeros(1, nTiles);
for iPair = 1:(nTiles + 1)
    str = keyList{iPair};
    nums = str2num(str);
    iTile = pMap(str);
    if iTile
        tiles(:,:,:,iTile) = doubleTriTile(nums(1), nums(2), base, ...
            htri, margin);
        flipmap(iTile) = pMap(num2str([nums(2), nums(1)]));
    end
end

IInt = -tileim(PInt, tiles, true, flipmap) + 1;
IFrac = -tileim(PFrac, tiles, true, flipmap) + 1;
figure;
imshow(IInt);
figure;
imshow(IFrac);



