function tile = doubleTriTile(dig1, dig2, base, htri, margin)

maxVal = (base - 1);
valOut = [dig1, dig2] ./ maxVal;

sqrt3 = sqrt(3);

wtri = htri / sqrt3;
sep = 2 * margin / sqrt3;

tileSize = round([htri + margin, wtri + sep]);

tile = zeros(tileSize);

[C, R] = meshgrid(1:tileSize(2), 1:tileSize(1));

tri1Selection = (C <= wtri - (wtri ./ htri .* R));
tri2Selection = (C >= wtri + sep - (wtri ./ htri .* R)) ...
    & (R < (tileSize(1) - margin));

tile(tri1Selection) = valOut(1);
tile(tri2Selection) = valOut(2);


