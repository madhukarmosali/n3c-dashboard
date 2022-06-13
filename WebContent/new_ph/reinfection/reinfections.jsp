<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div id="reinfection1">
	<div id="reinfection1_graph"></div>
	
	<c:if test="${not empty param.topic_description}">
		<div id="viz_caption">
			<jsp:include page="../reinfection/secondary_text/${param.topic_description}.jsp"/>
		</div>
	</c:if>
	
	<div id="reinfection1_graph_save_viz"> 
		<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('reinfection1_graph', 'reinfection1_graph.svg');">Save as SVG</button>
		<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('reinfection1_graph', 'reinfection1_graph.png');">Save as PNG</button>
		<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('reinfection1_graph', 'reinfection1_graph.jpg');">Save as JPEG</button>
	</div>

	<c:set var="feedPath"><util:applicationRoot/>/new_ph/reinfection/feeds/reinfections_by_date.jsp</c:set>
	
	<jsp:include page="../../graph_support/time_line_2_column.jsp">
		<jsp:param name="data_page" value="${feedPath}" />
		<jsp:param name="dom_element" value="#reinfection1" />
		<jsp:param name="namespace" value="reinfection1" />
		<jsp:param name="date_column" value="c_date" />
		<jsp:param name="column1" value="first_diagnosis" />
		<jsp:param name="column1_label" value="First Diagnosis Countt" />
		<jsp:param name="column1_tip" value="First Diagnosis" />
		<jsp:param name="column1_tip_offset" value="110" />
		<jsp:param name="column1_color" value="#173f59" />
		<jsp:param name="column1_opacity" value="0.4" />
		<jsp:param name="column2" value="reinfected" />
		<jsp:param name="column2_label" value="Reinfection Count" />
		<jsp:param name="column2_tip" value="Reinfection" />
		<jsp:param name="column2_tip_offset" value="85" />
		<jsp:param name="column2_color" value="#955195" />
		<jsp:param name="column2_opacity" value="0.4" />
		<jsp:param name="constraintPropagator" value="constraint" />
	</jsp:include>
	
	
	
</div>