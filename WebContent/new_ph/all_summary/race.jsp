<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<jsp:include page="../barPieToggle.jsp">
	<jsp:param name="block" value="${param.block}" />
	<jsp:param name="dimension" value="race" />
	<jsp:param name="dimension_name" value="Race" />
	<jsp:param name="dimension_range" value="race_range" />
	<jsp:param name="dimension_legend" value="race_legend" />
	<jsp:param name="dimension_minheight" value="300" />
</jsp:include>

<div id="${param.block}_race_viz" class="dash_viz"></div>

<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../all_summary/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>

<div id="${param.block}_race_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_race_viz', '${param.block}_race.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_race_viz', '${param.block}_race.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_race_viz', '${param.block}_race.jpg');">Save as JPEG</button>
</div>

<script>

function ${param.block}_race_refresh() {
	//console.log("race graph", "${param.block}_gender_viz", ${param.block}_RaceArray)
	d3.select("#${param.block}_race_viz").select("svg").remove();
	localPercentageBarChart(${param.block}_RaceArray,"#${param.block}_race_viz", 120, race_range, 0, "Race", race_legend);
}

${param.block}_race_refresh();

</script>
