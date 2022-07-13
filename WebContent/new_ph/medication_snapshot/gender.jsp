<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<jsp:include page="../barPieToggle.jsp">
	<jsp:param name="block" value="${param.block}" />
	<jsp:param name="dimension" value="gender" />
	<jsp:param name="dimension_name" value="Gender" />
	<jsp:param name="dimension_range" value="gender_range" />
	<jsp:param name="dimension_legend" value="gender_legend" />
	<jsp:param name="dimension_minheight" value="300" />
</jsp:include>

<div id="${param.block}_gender_viz" class="dash_viz"></div>

<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../all_summary/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>

<div id="${param.block}_gender_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_gender_viz', '${param.block}_gender.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_gender_viz', '${param.block}_gender.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_gender_viz', '${param.block}_gender.jpg');">Save as JPEG</button>
</div>

<script>

function ${param.block}_gender_refresh() {
	var id = $("#${param.block}-gender-mode").find('.text-primary').attr('id');
	var strings = id.split('-');
	var mode = strings[strings.length-1];
	
	d3.select("#${param.block}_gender_viz").select("svg").remove();
	
	if (mode =='pie'){		
		localPieChart(${param.block}_GenderArray,"#${param.block}_gender_viz", gender_legend, gender_range, 0.5, "Gender");
	} else if (mode == 'bar'){
		localHorizontalBarChart_legend(${param.block}_GenderArray,"#${param.block}_gender_viz", 140, 300, 0, gender_range, "Gender", gender_legend);
	} else {
		localPercentageBarChart(${param.block}_GenderArray,"#${param.block}_gender_viz", 140, gender_range, 0, "Gender", gender_legend);
	};
    
}

${param.block}_gender_refresh();

</script>
