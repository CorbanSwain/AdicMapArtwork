function out = frac2nary(numer, denom, base, length)

precision = ceil(log(base ^ length)) + 2;
tol = sym(10) ^ -sym(precision);
target = sym(numer) / sym(denom);
delta = target - sym(0);
base = sym(base);
out = zeros(1,length);
exponent = sym(0);

for iDigit = 1:length
    val = base ^ exponent;
    potentialAdd = val * base;
    for iAdd = 1:(eval(base) - 1)
        potentialAdd = potentialAdd - val;
        if potentialAdd <= delta
            delta = delta - potentialAdd;
            out(iDigit) = eval(base) - iAdd;
            break
        end 
    end
    if delta <= tol
        break
    end
    exponent = exponent - sym(1);
end