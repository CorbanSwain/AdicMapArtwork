function [P, map] = adicmap2pairmap(A, base)
asize = size(A);

apad = zeros(asize + [0, 2]);
apad(:,(1:asize(2)) + 1) = A;

pairConversionMap = pairmap(base);

psize = asize + [0, 1];
P = zeros(psize);

for iRow = 1:psize(1)
    for iCol = 1:psize(2)
        pairStr = num2str(apad(iRow, (0:1) + iCol));
        P(iRow, iCol) = pairConversionMap(pairStr);
    end
end

map = pairConversionMap;