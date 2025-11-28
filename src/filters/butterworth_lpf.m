function H = butterworth_lpf(D, D0, n)
% BUTTERWORTH_LPF - Butterworth Low-Pass Filter
    H = 1 ./ (1 + (D./D0).^(2*n));
end
