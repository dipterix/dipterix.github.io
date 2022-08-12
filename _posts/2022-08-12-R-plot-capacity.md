---
layout: post
title:  "Notes on Programming in R (1)"
date:   2022-08-12 13:42:55
description: Notes and tricks
tags: R visualization
categories: R
---

Today I tried to plot a time-series data that had $$861,584$$ time-points. It took very long time for R to generate and render the image. This experience leads me to thinking where the limit of R graphics system is.

This post records several experiments and the profiling results.

## Scatter/Time-series Plot

**Here's the profiling code:**

```{r}

profiling <- function(n = 1000, type = "p") {
  x <- rnorm(n)
  re <-system.time({
    plot(x, type = type)
    cat("Genrated, rendering... \n")
  })[[3]]
  dev.off()
  re
}

```

**Here's the profiling results:**

<table class="table table-sm table-borderless">
  <tr>
    <th scope="row">$$n \text{ points}$$</th>
    <th scope="row">$$10^{2}$$</th>
    <th scope="row">$$10^{3}$$</th>
    <th scope="row">$$10^{4}$$</th>
    <th scope="row">$$2\times 10^{4}$$</th>
    <th scope="row">$$5\times 10^{4}$$</th>
    <th scope="row">$$10^{5}$$</th>
    <th scope="row">$$2\times 10^{5}$$</th>
    <th scope="row">$$5\times 10^{5}$$</th>
    <th scope="row">$$10^{6}$$</th>
  </tr>
  <tr>
    <td>
        Dots (`type="p"`)
    </td>
    <td>0.013</td>
    <td>0.019</td>
    <td>0.098</td>
    <td>0.181</td>
    <td>0.447</td>
    <td>0.882</td>
    <td>1.736</td>
    <td>4.272</td>
    <td>8.543</td>
  </tr>
  <tr>
    <td>
        Lines (`type="l"`)
    </td>
    <td>0.011</td>
    <td>0.013</td>
    <td>0.084</td>
    <td>0.205</td>
    <td>0.724</td>
    <td>1.440</td>
    <td>2.688</td>
    <td>6.538</td>
    <td>12.348</td>
  </tr>
  <tr>
    <td>
        Dots+Lines (`type="o"`)
    </td>
    <td>0.009</td>
    <td>0.022</td>
    <td>0.171</td>
    <td>0.388</td>
    <td>1.182</td>
    <td>2.285</td>
    <td>4.397</td>
    <td>10.906</td>
    <td>21.048</td>
  </tr>
  <caption>Time elapsed (in seconds) to generate the plot (not including rendering)</caption>
</table>

The elapsed time is linear to the number of points. Here's the median time spent per point (elapsed time divided by total number of points).

<table class="table table-sm table-borderless">
  <tr>
    <th scope="row">Dots</th>
    <th scope="row">Lines</th>
    <th scope="row">Dots+Lines</th>
  </tr>
  <tr>
    <td>8.940e-06</td>
    <td>1.311e-05</td>
    <td>2.199e-05</td>
  </tr>
  <caption>Median time (in seconds) to plot the a data point</caption>
</table>

**Initial observation**

-   The time needed to generate a time-series plot is linear to the total number of points.

-   For each point, the time needed by `type="o"` is about the summation of time spent on plotting dots and lines separately

-   To make reactive plots (for example, in `shiny` apps), we might want to control the total number of points under `20k` (\~ 200ms to generate a graph)

## Image/Heat-map Plot

R also supports image/raster plots. Let's profile the speed of R rendering images

**Profiling code**:

``` r

profiling <- function(w = 100, h = w, raster = TRUE) {
  x <- matrix(rnorm(w * h), nrow = w)
  re <- system.time({
    image(x, useRaster = raster)
    cat("Genrated, rendering... \n")
  })[[3]]
  dev.off()
  re <- c(w, h, re)
  re
}

set.seed(1)
planned_dim <- sapply(1:2, \(...){ sort(sample(2000, 40)) })
res1 <- apply(planned_dim, 1, function(x){ profiling(x[1], x[2]) })
res2 <- apply(planned_dim[1:20, ], 1, function(x){ profiling(x[1], x[2], FALSE) })
```

Visualization code:

``` r

prof_res <- res1
plot(prof_res[1,] * prof_res[2, ], prof_res[3, ], type = "p", 
     pch = 16, col = 'orange', las = 1,
     xlab = "Resolution (# pixels)", ylab = "Time (s)", 
     main = "Image Raster Plot")
b <- median(prof_res[3, ] / (prof_res[1,] * prof_res[2, ]))
abline(b = b, a = 0, col = 'dodgerblue3', lwd = 3, lty = 2)
text(x = 2.5e6, y = 0.15, sprintf("Slope: %.2g s/pixel", b), 
     col = "dodgerblue3")
```

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/image-profiling.png" class="img-fluid rounded z-depth-1" zoomable=true %}
    </div>
</div>

**Initial observation**

-   The time needed to generate a time-series plot is linear to the total number of pixels.

-   Raster images are way faster ($$\times 30$$ faster)

-   To make reactive plots (for example, in `shiny` apps), we might want to control the total number of points under `2M` (\~ 200ms to generate a graph) for raster plots.

## Raster images with unbalanced sizes

Does the image dimensions matter? Does R render square images faster?

The answer seems to be no.

``` r

set.seed(1)
planned_dim <- sort(sample(seq(100, 20000), 40))
planned_dim <- cbind(planned_dim, ceiling(2e6 / planned_dim))
res3 <- apply(planned_dim, 1, function(x){ profiling(x[1], x[2]) })
summary(res3[3, ])
#> 
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#>  0.1260  0.1320  0.1350  0.1356  0.1390  0.1470 
```

## How to decimate?

If I have a time-series data with $$10^5$$ time points, it might be wise to remove some time-points and visualize the decimated data.

The method to be used depends on the signal distributions and the purpose of the visualization. In general I found 2 ways to decimate a signal

-   A. Use `decimate` function (can be found in `ravetools` package), which is designed to preserve the periodic patterns

-   B. Subset data with equally-spaced indices. For example, data at time point $$1, 6, 11, 16, …$$

Then signal is periodic and supposed to be smooth, `decimate` (A) can preserve the main features better than (B).

However, when data is spiky (heavy tailed), and the signal features are embedded in the spikes, (A) might smooth out the spikes, and (B) might preserve the features better.
