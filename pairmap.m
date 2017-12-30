function map = pairmap(base)
ind = 0;
map = containers.Map;
range = (1:base) - 1;
for iV1 = range
    for iV2 = range
        map(num2str([iV1, iV2])) = ind;
        ind = ind + 1;
    end
end