<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div id="reinfection3">
	<div id="reinfection3_graph"></div>
	
	<c:if test="${not empty param.topic_description}">
		<div id="viz_caption">
			<jsp:include page="../reinfection/secondary_text/${param.topic_description}.jsp"/>
		</div>
	</c:if>
	
	<div id="reinfection3_graph_save_viz"> 
		<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('reinfection3_graph', 'reinfection3_graph.svg');">Save as SVG</button>
		<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('reinfection3_graph', 'reinfection3_graph.png');">Save as PNG</button>
		<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('reinfection3_graph', 'reinfection3_graph.jpg');">Save as JPEG</button>
	</div>
	
	<c:set var="feedPath"><util:applicationRoot/>/new_ph/reinfection/feeds/reinfections_30day.jsp</c:set>
	
	<jsp:include page="../../graph_support/reinfection_bar.jsp">
		<jsp:param name="data_page" value="${feedPath}" />
		<jsp:param name="dom_element" value="#reinfection3_graph" />
		<jsp:param name="namespace" value="reinfection3" />
	</jsp:include>
	
	
</div>


