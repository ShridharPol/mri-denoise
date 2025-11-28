function show_freq_spectrum(F, fname, savePath)
% SHOW_FREQ_SPECTRUM - Display and save the magnitude spectrum
%
% F      = shifted FFT (fftshift(fft2(img)))
% fname  = filename string (e.g. "t1_icbm_normal_1mm_pn5_rf0.nii")
% savePath = output png path

    % Extract noise level (pn3, pn5, pn9)
    parts = split(fname, "_");
    pn_level = erase(parts{5}, ".nii");

    % Create figure
    fig = figure('Position',[300 200 600 500]);

    imshow(mat2gray(log(1 + abs(F))), []);
    title("Frequency Magnitude Spectrum — " + pn_level, ...
           'FontSize', 14, 'FontWeight', 'bold');

    saveas(fig, savePath);
end