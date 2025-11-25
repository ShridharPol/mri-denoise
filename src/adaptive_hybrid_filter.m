function out = adaptive_hybrid_filter(img, winSize, gaussSigma, varFactor)
%ADAPTIVE_HYBRID_FILTER Custom adaptive filter combining Gaussian and Median
%
% Parameters:
%   winSize     - neighborhood window (e.g., 5)
%   gaussSigma  - sigma for Gaussian smoothing (e.g., 1.0–1.5)
%   varFactor   - threshold multiplier for variance (e.g., 1.2)
%
% Usage example:
% out = adaptive_hybrid_filter(noisy_slice, 5, 1.2, 1.2);

    img = double(img);

    % Local variance estimation
    localMean   = movmean(movmean(img, winSize, 1), winSize, 2);
    localSqMean = movmean(movmean(img.^2, winSize, 1), winSize, 2);
    localVar    = localSqMean - localMean.^2;

    % Threshold for distinguishing edges from smooth tissue
    thresh = mean(localVar(:)) * varFactor;
    edgeMask = localVar > thresh;

    % Gaussian smoothing
    h = fspecial('gaussian', [winSize winSize], gaussSigma);
    gImg = imfilter(img, h, 'replicate');

    % Median filter
    mImg = medfilt2(img, [winSize winSize]);

    % Adaptive combination
    out = gImg;
    out(edgeMask) = mImg(edgeMask);

end