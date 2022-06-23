<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_delay_viz" class="dash_viz"></div>

<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../adult_summary/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>

<div id="${param.block}_delay_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_delay_viz', '${param.block}_delay.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_delay_viz', '${param.block}_delay.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_delay_viz', '${param.block}_delay.jpg');">Save as JPEG</button>
</div>

<script>

function ${param.block}_delay_refresh() {
	//console.log("delay graph", "${param.block}_delay_viz", ${param.block}_DelayArray)
	d3.select("#${param.block}_delay_viz").select("svg").remove();
	mortalityVerticalBarChart(${param.block}_DelayArray,"#${param.block}_delay_viz", 120);
}

${param.block}_delay_refresh();

</script>
