<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<jsp:include page="../barPieToggle.jsp">
	<jsp:param name="block" value="${param.block}" />
	<jsp:param name="dimension" value="age" />
	<jsp:param name="dimension_name" value="Age" />
	<jsp:param name="dimension_range" value="age_range" />
	<jsp:param name="dimension_legend" value="age_legend_4" />
	<jsp:param name="dimension_minheight" value="300" />
</jsp:include>

<div id="${param.block}_age_viz" class="dash_viz"></div>

<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../medication_snapshot/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>

<div id="${param.block}_age_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_age_viz', '${param.block}_age.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_age_viz', '${param.block}_age.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_age_viz', '${param.block}_age.jpg');">Save as JPEG</button>
</div>

<script>

function ${param.block}_age_refresh() {
	var id = $("#${param.block}-age-mode").find('.text-primary').attr('id');
	var strings = id.split('-');
	var mode = strings[strings.length-1];
	
	d3.select("#${param.block}_age_viz").select("svg").remove();
	
	if (mode =='pie'){		
		localPieChart(${param.block}_AgeArray,"#${param.block}_age_viz", age_legend_4, age_range, 0.5, "Age");
	} else if (mode == 'bar'){
		localHorizontalBarChart_legend(${param.block}_AgeArray,"#${param.block}_age_viz", 120, 300, 0, age_range, "Age", age_legend_4);
	} else {
		localPercentageBarChart(${param.block}_AgeArray,"#${param.block}_age_viz", 120, age_range, 0, "Age", age_legend_4);
	};
	
	
	
}

${param.block}_age_refresh();

</script>
