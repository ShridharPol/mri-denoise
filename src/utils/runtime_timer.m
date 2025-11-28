function t = runtime_timer(funcHandle)
% Measure execution time of any function handle
    tic;
    funcHandle();
    t = toc * 1000;   % return milliseconds
end