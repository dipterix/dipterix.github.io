---
abstract: This article is motivated by studying multisensory effects on brain activities in intracranial electroencephalography (iEEG) experiments. Differential brain activities to multisensory stimulus presentations are zero in most regions and non-zero in some local regions, yielding locally sparse functions. Such studies are essentially a function-on-scalar regression problem, with interest being focused not only on estimating nonparametric functions but also on recovering the function supports. We propose a weighted group bridge approach for simultaneous function estimation and support recovery in function-on-scalar mixed effect models, while accounting for heterogeneity present in functional data. We use B-splines to transform sparsity of functions to its sparse vector counterpart of increasing dimension, and propose a fast non-convex optimization algorithm using nested alternative direction method of multipliers (ADMM) for estimation. Large sample properties are established. In particular, we show that the estimated coefficient functions are rate optimal in the minimax sense under the $L_{2}$ norm and resemble a phase transition phenomenon. For support estimation, we derive a convergence rate under the $L_{\infty}$ norm that leads to a sparsistency property under δ-sparsity, and provide a simple sufficient regularity condition under which a strict sparsistency property is established. An adjusted extended Bayesian information criterion is proposed for parameter tuning. The developed method is illustrated through simulation and an application to a novel iEEG dataset to study multisensory integration. We integrate the proposed method into RAVE, an R package that gains increasing popularity in the iEEG community.
authors:
- Zhengjia Wang, John F. Magnotti, Michael S. Beauchamp, and Meng Li
date: "2020-12-20T00:00:00Z"
doi: null
url_preprint: "https://arxiv.org/abs/2006.10163"
url_code: "https://cran.r-project.org/package=spfda"
featured: true
links: null
projects: null
publication: ""
publication_short: ""
publication_types:
- "3"
publishDate: "2020-10-01T00:00:00Z"
summary: Fast function-on-scalar regression with theoretical guarantees on consistency.
tags:
- "Function-on-scalar"
- "B-spline"
- "Group-bridge penalty"
- "Sparsity"
- "ADMM"
- "iEEG"
- "R package"
- "spfda"
title: 'Functional Group Bridge for Simultaneous Regression and Support Estimation'
---


* Arxiv link: [https://arxiv.org/abs/2006.10163](https://arxiv.org/abs/2006.10163)
* Github repository: [https://github.com/dipterix/spfda](https://github.com/dipterix/spfda)
* R CRAN website: [https://cran.r-project.org/package=spfda](https://cran.r-project.org/package=spfda)



