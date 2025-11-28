function H = wiener_filter(S_power, noise_var)
% WIENER_FILTER - Frequency-domain Wiener filter
%   S_power   : |S(u,v)|^2 of the clean reference slice
%   noise_var : noise variance (assumed white, constant over (u,v))

    epsilon = 1e-8;  % to avoid division by zero
    H = S_power ./ (S_power + noise_var + epsilon);

end