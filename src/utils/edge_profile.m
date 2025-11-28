function edge_profile(clean, noisy, filtered, filterName, noiseFile, savePath)
% EDGE_PROFILE - Compare edge intensity profiles for a filter
%
% clean      = clean slice (normalized)
% noisy      = noisy slice (normalized)
% filtered   = output of filter
% filterName = string, e.g. "Gaussian LPF"
% noiseFile  = full filename, used to detect pn-level
% savePath   = where to save the PNG plot

    % Extract row for profile
    row = round(size(clean,1)/2);

    c = clean(row,:);
    n = noisy(row,:);
    f = filtered(row,:);

    % Extract noise level from filename (pn3, pn5, pn9)
    parts = split(noiseFile, "_");
    pn_level = erase(parts{5}, ".nii");   % remove .nii if present

    fig = figure('Position',[100 100 1100 380]);

    % (1) PROFILE COMPARISON PLOT
    subplot(1,2,1)
    plot(c, 'k', 'LineWidth', 1.5); hold on;
    plot(n, 'r');
    plot(f, 'b', 'LineWidth', 1.3);
    legend('Clean','Noisy','Filtered','Location','best');
    title("Edge Profile — " + filterName + " — " + pn_level, ...
          'FontWeight','bold');

    xlabel("Pixel Position (Column Index)");
    ylabel("Normalized Intensity (0–1)");
    grid on;
    xlim([1 length(c)]);

    % (2) PROFILE LOCATION ON IMAGE
    subplot(1,2,2)
    imshow(clean, []); hold on;
    yline(row, 'r', 'LineWidth', 2);
    title("Profile Location — " + filterName + " — " + pn_level, ...
          'FontWeight','bold');

    % Save the figure
    saveas(fig, savePath);

end