---
widget: 'github.dipterix.threeBrain'
date: "2016-04-27T00:00:00Z"
external_link: ""
image:
  caption: Screenshot of Collin's Brain
  focal_point: Left
links:
- icon: github
  icon_pack: fab
  name: Github
  url: https://github.com/dipterix/threeBrain
- name: CRAN
  url: https://cran.r-project.org/package=threeBrain
summary: A WebGL-based 3D engine for MRI visualization'
tags:
- RAVE
- "R Package"
- "WebGL"
title: 'R CRAN package `threeBrain`'
---

The package `threeBrain` aims at generating fast, stable, interactive and easy to share 3D viewers for [freesurfer](https://surfer.nmr.mgh.harvard.edu/) and [AFNI/SUMA](https://afni.nimh.nih.gov/Suma) files. It uses `WebGL` as the back-end engine to render 3D objects in the web browser. The viewer is mainly implemented in `JavaScript` and `R`, with built-in support to embed into any `R-shiny` applications, or can be downloaded as standalone widget ready to be shared across different platforms.

During the college, I took a course called computer graphics because I thought it was the same thing as computer vision. It turned out that I was wrong. You can imagine how struggle I was when we were told to code C++ on a very complicated template written from ten years ago, while I didn't know how to write C++ programs at all. A big red "C" on my final is totally foreseeable. However, computer graphics was so cool that I kept reshaping my final class project even after the graduation. After reading a news about `WebGL`, I realized how convenient and powerful it was. So I re-implemented my class project in [`three.js`](https://threejs.org/), which becomes the initial version of `threeBrain`.

