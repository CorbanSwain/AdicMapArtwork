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