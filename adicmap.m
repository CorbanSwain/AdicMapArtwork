function [AInt, AFrac]  = adicmap(X, base, nCols)

nRows = length(X);
AZero = zeros(nRows, nCols);

ACurrent = AZero;
ASlice = ACurrent(1,:);
for iNum = 1:nRows
    naryVector = ASlice;
    out = dec2nary(X(iNum), base);
    out = fliplr(out);
    outLen = min(length(out), nCols);
    naryVector(1:outLen) = out(1:outLen);
    ACurrent(iNum,:) = naryVector;
end %for iNum 
AInt = ACurrent;

ACurrent = AZero;
for iDenom = 1:nRows
    ACurrent(iDenom,:) = frac2nary(1, X(iDenom), base, nCols);
end % for iDenom
AFrac = ACurrent;



