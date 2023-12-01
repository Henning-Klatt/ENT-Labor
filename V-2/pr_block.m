function [ pvec_hyp ] = pr_block( p, B )

    pvec_hyp = zeros(0, B);

    for i=0 : B
        pvec_hyp(i+1) = p^(i) * (1-p)^(B-i);
        disp(pvec_hyp(i+1));
    end

end

