<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_gender_viz" class="col-12 dash_viz"></div>
<div id="${param.block}_gender_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_gender_viz', '${param.block}_gender.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_gender_viz', '${param.block}_gender.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_gender_viz', '${param.block}_gender.jpg');">Save as JPEG</button>
</div>


<script>
var labeltest = '${param.label_width}';
var labelWidth = 150;

if (labeltest.length != 0){
	labelWidth = Number('${param.label_width}');
};

function ${param.block}_gender_refresh() {
	console.log("gender graph", "${param.block}_gender_viz", ${param.block}_SymptomGenderArray)
   	d3.select("#${param.block}_gender_viz").select("svg").remove();
	localHorizontalStackedBarChart(${param.block}_SymptomGenderArray,"${param.block}_gender_viz", labelWidth, gender_legend, gender_range, "Gender", "${param.viz_height}");	
}

${param.block}_gender_refresh();
</script>
