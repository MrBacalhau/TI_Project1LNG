function [entropy] = entropia6(x)
    x = nonzeros(x);    %passar zeros a 1
    entropy = -sum(x .* log2(x));
end