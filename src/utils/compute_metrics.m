function [ps, ss] = compute_metrics(img, ref)
% COMPUTE_METRICS - PSNR and SSIM
    ps = psnr(img, ref);
    ss = ssim(img, ref);
end