function I = adicmap2im(A, base)

maxVal = base - 1;
I = A ./ maxVal;
I = -I + 1;
