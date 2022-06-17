<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_covid_long_percent_viz" class="col-12 dash_viz"></div>

<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../long_covid/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>

<div id="${param.block}_gender_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_covid_long_percent_viz', '${param.block}_covid_long_percent_viz.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_covid_long_percent_viz', '${param.block}_covid_long_percent_viz.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_covid_long_percent_viz', '${param.block}_covid_long_percent_viz.jpg');">Save as JPEG</button>
</div>

<script>

function ${param.block}_covid_long_percent_refresh() {
    localHorizontalBarChart(${param.block}_covid_long_percent_vizArray, "long_percent", "#${param.block}_covid_long_percent_viz", 70);
}

${param.block}_covid_long_percent_refresh();

</script>