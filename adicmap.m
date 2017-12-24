function A = adicmap(X, base, nCols)
nRows = length(X);
A = zeros(nRows, nCols, 2);
page = 1;
ACurrent = A(:,:,page);
for iDenom = 1:nRows
    ACurrent(iDenom,:) = frac2nary(1, X(iDenom), base, nCols);
end % parfor
A(:,:,page) = ACurrent;

page = 2;
ACurrent = A(:,:,page);
ASlice = ACurrent(1,:);
for iNum = 1:nRows
    naryVector = ASlice;
    out = dec2nary(X(iNum), base);
    out = fliplr(out);
    outLen = min(length(out), nCols);
    naryVector(1:outLen) = out(1:outLen);
    ACurrent(iNum,:) = naryVector;
end
A(:,:,page) = ACurrent;
end

function out = frac2nary(numer, denom, base, length)
precision = ceil(log(base ^ length)) + 2;
tol = sym(10) ^ -sym(precision);
target = sym(numer) / sym(denom);
delta = target;
out = zeros(1,length);
exponent = sym(0);
for iDigit = 1:length
    val = sym(base) ^ exponent;
    potentialAdd = val * sym(base);
    for iAdd = 1:(base - 1)
        potentialAdd = potentialAdd - val;
        if (potentialAdd - delta) < tol
            delta = delta - potentialAdd;
            out(iDigit) = base - iAdd;
            break
        end
        
    end
    exponent = exponent - sym(1);
end
end

function out = dec2nary(x, base)
    base = sym(base);
    xNew = sym(x);
    exponentFun = @(x) floor(log(x)/log(base));
    exponent = exponentFun(xNew);
    out = zeros(1, eval(exponent));
    while xNew > 0
        val = base ^ exponent;
        multiplier = floor(xNew / (val));
        xNew = xNew - (val * multiplier);
        out(exponent + 1) = multiplier;
        exponent = exponentFun(xNew);
    end
    out = fliplr(out);
end