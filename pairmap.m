function map = pairmap(base)
ind = 0;
map = containers.Map;
range = (1:base) - 1;
for iV1 = range
    for iV2 = range
        ind = ind + 1;
        map(num2str([iV1, iV2])) = ind;
    end
end