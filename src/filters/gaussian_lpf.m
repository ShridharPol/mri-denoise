function H = gaussian_lpf(D, D0)
% GAUSSIAN_LPF - Gaussian Low-Pass Filter
    H = exp(-(D.^2) ./ (2*D0^2));
end
