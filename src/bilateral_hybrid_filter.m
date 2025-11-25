function out = bilateral_hybrid_filter(img, sigmaSpatial, sigmaIntensity, edgeThresh)

% BILATERAL_HYBRID_FILTER
% ---------------------------------------------------------
% Adaptive MRI denoiser combining:
%   - Bilateral filtering (edge-preserving)
%   - Median filtering on strong edges
%
% Inputs:
%   img            → raw MRI slice (double), NOT normalized
%   sigmaSpatial   → spatial smoothing (2–4 recommended)
%   sigmaIntensity → intensity smoothing (20–40 recommended for BrainWeb)
%   edgeThresh     → gradient magnitude threshold (0.01–0.05 recommended)
%
% Output:
%   out → denoised MRI slice
% ---------------------------------------------------------

    img = double(img);

    % 1) Edge detection (gradient magnitude)
    [Gx, Gy] = gradient(img);
    gradMag = sqrt(Gx.^2 + Gy.^2);

    % Create edge mask
    edgeMask = gradMag > edgeThresh * max(gradMag(:));

    % 2) Bilateral filter for most regions
    bilat = imbilatfilt(img, sigmaIntensity, sigmaSpatial);

    % 3) Median filter for high-gradient (edge) regions
    medImg = medfilt2(img, [3 3]);

    % 4) Combine
    out = bilat;
    out(edgeMask) = medImg(edgeMask);

end