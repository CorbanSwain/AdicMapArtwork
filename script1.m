base = 2;

nRows = 512;
nCols = 512;
arr = zeros(nRows, nCols, 2);
arrSlice = zeros(1,nCols);
test = 0;
parfor i = 1:nRows
    binaryVector = frac2bin2(i, nCols);
    test = max(test, length(binaryVector));
    tempArrSlice = arrSlice;
    for iChar = 1:min(length(binaryVector), nCols)
        tempArrSlice(iChar) = str2double(binaryVector(iChar));
    end
    arr(i,:,1) = tempArrSlice;
    fprintf("%3d-",i);
    if mod(i,20) == 0
        fprintf("\n");
    end
end

parfor i = 1:nRows
    binaryVector = fliplr(dec2bin(i));
    tempArrSlice = arrSlice;
    for iChar = 1:min(length(binaryVector), nCols)
        tempArrSlice(iChar) = str2double(binaryVector(iChar));
    end
    arr(i,:,2) = tempArrSlice;
    fprintf("%3d-",i);
    if mod(i,20) == 0
        fprintf("\n");
    end
end
arr(:,:,2) = arr(fliplr(1:nRows),:,2);

arr = -arr + (base - 1); 

figure(6); clf;
subplot(1, 2, 1);
imshow(imresize(arr(:,:,1), 1, 'nearest'),'Border', 'tight');
subplot(1, 2, 2);
imshow(imresize(arr(:,:,2), 1, 'nearest'), 'Border', 'tight');