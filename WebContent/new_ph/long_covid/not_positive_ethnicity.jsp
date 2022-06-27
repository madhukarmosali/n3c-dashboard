<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_ethnicity_viz" class="col-12 dash_viz"></div>

<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../long_covid/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>


<div id="${param.block}_ethnicity_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_ethnicity_viz', '${param.block}_ethnicity.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_ethnicity_viz', '${param.block}_ethnicity.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_ethnicity_viz', '${param.block}_ethnicity.jpg');">Save as JPEG</button>
</div>

<script>

function ${param.block}_ethnicity_refresh() {
	console.log("ethnicity graph", "${param.block}_ethnicity_viz", ${param.block}_EthnicityArray)
	d3.select("#${param.block}_ethnicity_viz").select("svg").remove();
	localHorizontalBarChart(${param.block}_EthnicityArray,"#${param.block}_ethnicity_viz", 160, 300, 1, ethnicity_range);
}

${param.block}_ethnicity_refresh();

</script>
