---
widget: 'github.dipterix.threeBrain'
date: "2016-04-27T00:00:00Z"
external_link: ""
image:
  caption: Screenshot of Collin's Brain
  focal_point: Left
  preview_only: true
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
title: 'Interactive MRI viewer - `threeBrain`'
---

{{< rawhtml >}}
<script src="../../lib/htmlwidgets-1.5.3/htmlwidgets.js"></script>
<link href="../../lib/threejs-0.101.1/css/dat.gui.css" rel="stylesheet" />
<link href="../../lib/dipterixThreeBrain-1.0.1/dipterix.css" rel="stylesheet" />
<script src="../../lib/dipterixThreeBrain-1.0.1/main.js"></script>
<script src="../../lib/threejs_brain-binding-0.2.0/threejs_brain.js"></script>
<body>
<div id="htmlwidget_container">
  <div id="htmlwidget-10b2167231e00d19a0eb" style="width:100%;height:80vh;" class="threejs_brain html-widget"></div>
</div>
<script type="application/json" data-for="htmlwidget-10b2167231e00d19a0eb">{"x":{"data_filename":"config_dc13c2e1fa80edd292dea332a530d87e.json","settings":{"side_camera":true,"side_canvas_zoom":1,"side_canvas_width":250,"side_canvas_shift":[0,0],"color_maps":[],"default_colormap":null,"hide_controls":false,"control_center":[0,0,0],"camera_pos":[500,0,0],"font_magnification":1,"start_zoom":1,"show_legend":true,"render_timestamp":true,"control_presets":["subject2","surface_type2","hemisphere_material","surface_color","map_template","electrodes","voxel","animation","display_highlights"],"cache_folder":"../../lib/threebrain_data-0/","lib_path":"../../lib/","default_controllers":{"Overlay Coronal":true,"Overlay Axial":true,"Overlay Sagittal":true,"Axial (I - S)":-24,"Voxel Type":"aparc_aseg","Surface Color":"sync from voxels","Surface Type":"smoothwm","Blend Factor":1},"debug":true,"background":"#000000","token":null,"coords":null,"show_inactive_electrodes":true,"side_display":true,"control_display":false,"custom_javascript":null},"force_render":false},"evals":[],"jsHooks":[]}</script>
<script type="application/htmlwidget-sizing" data-for="htmlwidget-10b2167231e00d19a0eb">{"viewer":{"width":"100%","height":"100vh","padding":"0px","fill":true},"browser":{"width":"100%","height":"80vh","padding":"0px","fill":false}}</script>
{{< /rawhtml >}}

The package `threeBrain` generates fast, stable, interactive and easy to share 3D viewers for [freesurfer](https://surfer.nmr.mgh.harvard.edu/) and [AFNI/SUMA](https://afni.nimh.nih.gov/Suma) files. It uses `WebGL` as the back-end engine to render 3D objects directly in web browser. The viewer is mainly implemented in `JavaScript` and `R`, with built-in support to be embedded into any websites, `R-shiny` applications, or can be downloaded as standalone widget ready to be shared across different platforms.

During the college, I took a computer graphics course because I thought it was the same as computer vision. It turned out that I was wrong. It was foreseeable that I didn't score well in that class. However, computer graphics was so cool that I kept reshaping my final class project even after the graduation. After reading a news about `WebGL`, I realized how convenient and powerful it was. So I re-implemented my class project in [`three.js`](https://threejs.org/), which becomes the initial version of `threeBrain`.

