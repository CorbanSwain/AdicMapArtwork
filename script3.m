%% Pre Calculations
primes = [2,3,5,7,11];
maxLength = (2 ^ 10) + 1;
sizes =  primes .^ floor(log(maxLength) ./ log(primes));

%% Inputs
numsIn = primes;
sizes = round(sizes);
dataDir = 'AdicMapData';
namingFormat = 'Base%03d-%04dX%04d';

%% Main Script
CNSUtils.FigureBuilder.setDefaults;
DATA_EXT = '.mat';
for iNum = 1:length(numsIn)
    base = numsIn(iNum);
    size = sizes(iNum);
    
    fprintf("Beginning Base %3d ... ", base);
        
    [AInt, AFrac] = adicmap(1:size, base, size);
    
    basename = sprintf(namingFormat, base, size, size);
    filename = [dataDir, filesep, basename, DATA_EXT];
    save(filename, 'AInt', 'AFrac');
    
    fh = figure(iNum); clf;
    fh.Name = basename;
    subplot(121);
    imshow(adicmap2im(AInt, base));
    subplot(122);
    imshow(adicmap2im(AFrac, base));
    fprintf("Done!\n");
end