function H = ideal_lpf(D, D0)
% IDEAL_LPF - Ideal Low-Pass Filter
    H = double(D <= D0);
end
