% pvec = [0.2 0.3 0.4]

function H = entropy(pvec)

    if sum(pvec) > 1
        error("sum(pl) > 1 :(")
    end

    H = 0;

    for k = 1:size(pvec, 2)
        if pvec(k) <= 0
            continue;
        else
            H = H - pvec(k)*log2(pvec(k));
        end
    end
end

