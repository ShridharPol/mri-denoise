# MRI Denoising (BrainWeb, MATLAB)



This repository contains a MATLAB pipeline for MRI image denoising using the BrainWeb simulated brain dataset.



## Overview

The goal of this project is to compare classical spatial-domain filters (Gaussian, Median, Wiener, Non-Local Means) with frequency-domain filters (Ideal, Butterworth, Gaussian Low-Pass) on T1-weighted brain MRI images at different noise levels (0–9%).



## Folder Structure

mri-denoise/

│

├── data/ # Contains raw (.nii) and processed MRI data

│ ├── raw/ # Original BrainWeb volumes

│ └── processed/ # Preprocessed or denoised images

│

├── src/ # MATLAB source scripts (.m files)

│

├── results/ # Output figures and metrics

│ ├── figures/

│ └── metrics/

│

└── experiments/ # Logs and experiment notes





## Getting Started

1\. Place BrainWeb `.mnc` files in `data/raw/`

2\. Run `MRI\_Denoising\_Pipeline.mlx` in MATLAB

3\. Results will be saved under `results/`



## References

BrainWeb: Cocosco et al., \*HBM\*, 1997  

Collins et al., \*IEEE TMI\*, 1998  

Kwan et al., \*IEEE TMI\*, 1999



