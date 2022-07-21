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

iEEG is an invasive technique to study neuroactivities by placing high-sensitive electrodes directly into the human brain, or onto the cortical surface. 
Without barriers such as the scalp to diffuse the signals, iEEG can achieve extraordinary spatial precisions. 

One of the challenges is locating the iEEG signals with reasonable accuracy. Studies have shown that brain patterns might vary significantly with even millimeters apart. With such high spatial precision in iEEG studies, inaccurate signal location can result in wrong conclusions. Think of a fencing contest (I intended to say slap contest here): even if you can attack the same place every time (high precision), there is no guarantee to win if each attack points to the air (low accuracy). 

What makes the situation worse is that researchers often have limited/no control over iEEG electrode implantation. In non-invasive methods such as fMRI or scalp-EEG, subjects can be almost anyone with a functioning brain. The researchers can obtain complete control over the data collection procedures. iEEG subjects, however, are usually hospital patients waiting to be treated. iEEG data is more of a by-product of the entire treatment procedure. There is always a much bigger objective than the scientific studies: brain surgery. As a result, it is (almost) always the neurosurgeons who decide where to implant the electrodes. Researchers  often find it super challenging to even guess the rough coordinates of the electrodes before localizing them in software.

There are several dedicated computer programs for neuroimaging data, such as AFNI, FreeSurfer, dcm2niix, FSL... This post is a technical report on how RAVE uses these tools in its low-level implementation. Here are the four topics that will be covered:

* Data formats
* Surface reconstruction
* CT to T1 co-registration
* Electrode localization

