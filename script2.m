for iBase = 2:10
    base = iBase;
    maxLen = 150;
    getLen =  @(x) ceil(base ^ floor(log(x) / log(base)));
    getLen2 = @(x) ceil(base ^ round(log(x) / log(base)));
    
    nFName = getLen(1001);
    fName = sprintf('Base%03d-%04dX%04d',iBase,nFName,nFName);
    
    loadVar = true;
    
    if ~loadVar % FIXME
        %X = floor(base .^ ((1:n) ./ 5));
        arr = adicmap(1:n, base, n);
        
        

        save(['AdicMapData/' fName '.mat'], 'arr');
    else
        load(['AdicMapData/' fName '.mat'], 'arr');
    end
    
    n = getLen2(maxLen);
    arr(:,:,2) = flipud(arr(:,:,2));
    arr = arr(1:n, 1:n, :);
    arr(:,:,2) = flipud(arr(:,:,2));
    
    fName = sprintf('Base%03d-%04dX%04d',iBase,n,n);
    
    image = (-arr + (base - 1)) ./ (base - 1);
    imwrite(image(:,:,1), ['AdicMapImages/Frac-' fName '.png']);
    imwrite(image(:,:,2), ['AdicMapImages/Intg-' fName '.png']);
    imageScale = 4;
    range = [0, 1];
    
    CNSUtils.FigureBuilder.setDefaults;
    figure(iBase); clf;
    subplot(1,2,1);
    imshow(imresize(image(:,:,1), imageScale, 'nearest'), range, ...
        'Border', 'tight');
    subplot(1,2,2);
    imshow(imresize(image(:,:,2), imageScale, 'nearest'), range, ...
        'Border', 'tight');

end