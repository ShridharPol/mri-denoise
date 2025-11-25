function vol = load_brainweb_nifti(path)
%LOAD_BRAINWEB_NIFTI Loads a BrainWeb NIfTI volume and converts to double.
    vol = niftiread(path);
    vol = double(vol);
end