---
title: 'R package `spfda`'
author: Zhengjia Wang
date: '2021-07-20'
slug: []
categories: []
tags:
  - B-spline
  - Function-on-scalar
  - Group-bridge penalty
  - R Package
  - Sparsity
  - spfda
summary: 'Sparse function-on-scalar regression'
external_link: ''
image:
  caption: ""
  focal_point: Left
  preview_only: false
links:
- icon: github
  icon_pack: fab
  name: Github
  url: https://github.com/dipterix/spfda
- name: CRAN
  url: https://cran.r-project.org/package=spfda
- name: Arxiv
  url: "https://arxiv.org/abs/2006.10163"
---

This package implements paper "Functional Group Bridge for Simultaneous Regression and Support Estimation" 

## Installation

You can install the **released** version of `spfda` from [CRAN](https://CRAN.R-project.org/package=spfda) with:

```
install.packages("spfda")
```

The **experimental** version can be installed via

```
# install.packages("remotes")
remotes::install_github("dipterix/spfda")
```

## Example

```
library(spfda)
dat <- spfda_simulate()
x <- dat$X
y <- dat$Y

## basic example code

fit <- spfda(y, x, lambda = 5, CI = TRUE)

## Generics

BIC(fit)
plot(fit, col = c("orange", "dodgerblue3", "darkgreen"),
     main = "Fitted with 95% CI", aty = c(0, 0.5, 1), atx = c(0,0.2,0.8,1))
matpoints(fit$time, t(dat$env$beta), type = 'l', col = 'black', lty = 2)
legend('topleft', c("Fitted", "Underlying"), lty = c(1,2), bty = 'n')
print(fit)
coefficients(fit)
```

## Citation

Use `citation('spfda')` to generate citation information, or check [this link](https://arxiv.org/abs/2006.10163).

```
Wang, Z, Magnotti, JF, Beauchamp, MS. Li, M, Functional Group Bridge for Simultaneous Regression and Support Estimation.
```


