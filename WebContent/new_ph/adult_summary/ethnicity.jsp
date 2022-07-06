<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<jsp:include page="../barPieToggle.jsp">
	<jsp:param name="block" value="${param.block}" />
	<jsp:param name="dimension" value="ethnicity" />
	<jsp:param name="dimension_name" value="Ethnicity" />
	<jsp:param name="dimension_range" value="ethnicity_range" />
	<jsp:param name="dimension_legend" value="ethnicity_legend" />
	<jsp:param name="dimension_minheight" value="300" />
</jsp:include>

<div id="${param.block}_ethnicity_viz" class="dash_viz"></div>

<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../adult_summary/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>

<div id="${param.block}_ethnicity_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_ethnicity_viz', '${param.block}_ethnicity.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_ethnicity_viz', '${param.block}_ethnicity.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_ethnicity_viz', '${param.block}_ethnicity.jpg');">Save as JPEG</button>
</div>

<script>

function ${param.block}_ethnicity_refresh() {
	//console.log("ethnicity graph", "${param.block}_ethnicity_viz", ${param.block}_EthnicityArray)
	d3.select("#${param.block}_ethnicity_viz").select("svg").remove();
	localPercentageBarChart(${param.block}_EthnicityArray,"#${param.block}_ethnicity_viz", 150, ethnicity_range, 0, "Ethnicity", ethnicity_legend);
}

${param.block}_ethnicity_refresh();

</script>
