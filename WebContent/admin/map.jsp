<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<div id="graph"></div>
<jsp:include page="../graph_support/site_map.jsp">
	<jsp:param name="ld" value="300" />
	<jsp:param name="map_type" value="${param.map_type}" />
	<jsp:param name="state_page" value="graph_support/us-states.json" />
	<jsp:param name="data_page" value="feeds/map_data.jsp" />
	<jsp:param name="site_page" value="feeds/siteLocations.jsp" />
	<jsp:param name="dom_element" value="#graph" />
</jsp:include>
