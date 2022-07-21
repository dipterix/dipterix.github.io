---
layout: post
title:  "Neuroimaging Data Processing in iEEG Study"
date:   2022-07-20 23:01:22
description: A simple neuroimaging pipeline
tags: RAVE FreeSurfer AFNI FSL dcm2niix iEEG
categories: RAVE iEEG
---

*Author: Zhengjia Wang*

*License: CC-BY-04 (free to use/share, acknowledgements required)*

*[Click here to edit](https://github.com/dipterix/dipterix.github.io/edit/master/_posts/2022-07-20-neuroimaging-ieeg.md)*

## Background

iEEG is an invasive technique to study the neuroactivity by placing high-sensitive electrodes directly into the human brain, or onto the cortical surface. 
Without barriers such as the sculp to diffuse the signals, iEEG can achieve extraordinary spatial precisions. 

One of the problems that follows is to locate the iEEG signals with reasonable accuracies. Studies have shown that brain patterns might be significantly different on locations that are even millimeters apart. Since the spatial precision is so high, inaccurate localizations can result in wrong conclusions. This is a fencing contest (I was intended to say slap contest here): even if you can attack the same place every time (high precision), there is no guaratee to win if each attack points to the air (low accuracy). 

Another unique challenge is that researchers often have limited/no control over where iEEG electrodes are implanted. In non-invasive methods such as fMRI or sculp-EEG, researchers have full controls on where to collect brain responses because the subjects can be almost anyone with a functioning brain, and the data collection is often safe. iEEG subjects, however, are usually hospital patients who are waiting to be treated. iEEG data is more of a by-product from the entire treatment procedure. There is always a much bigger objective than scientific studies: neurosurgery, hence it is (almost) always the neurosurgeons who decide where to implant the electrodes.

All these problems might create a weird situation. When I started my first iEEG project, I finished preliminary data analysis weeks before obtaining the electrode locations. Three electrodes showed significant responses, but I had no ideas where they were. In this post, I plan to give an introduction on iEEG neuroimaging data processing pipeline from the following four topics:

* Data formats and specifications
* Surface reconstruction
* CT to T1 co-registration
* Electrode localization

