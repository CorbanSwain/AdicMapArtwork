function binaryChar = frac2bin2(denom, nBin)
    precision = ceil(log(2 ^ nBin)) + 2;
    tol = sym(10) ^ -sym(precision); % high precision
    target = 1/sym(int16(denom)); % high precision
    delta = target;
    list = 0;
    listLength = 0;
    exponent = sym(0);
    for i = 1:nBin
        potentialAdd = sym(2) ^ exponent;
        if (potentialAdd - delta) < tol
            delta = delta - potentialAdd;
            if listLength == length(list)
                list =  [list, zeros(1, listLength)];
            end
            listLength = listLength + 1;
            list(listLength) = exponent;
        end
        exponent = exponent - sym(1);
    end
    list = (-1 * list(1:listLength)) + 1;
    binaryChar = repmat('0',1,list(end));
    binaryChar(list) = '1';
end
