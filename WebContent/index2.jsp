<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" flush="true" />

<body>
	<jsp:include page="navbar.jsp" flush="true" />

	<div class="container-fluid">
		<h2 class="header-text">
			<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">
			The	National <strong>COVID-19</strong> Cohort Collaborative (N3C)
		</h2>
	</div>


	<div class="row large-mb">
		<div class="col-xs-12 centered">
			<div class="col-xs-2">&nbsp;</div>
			<div class="col-xs-8">
				<h3 class="header-text">x Total Patients</h3>
				<c:import url="https://labs.cd2h.org/n3c-cohort/demo1/dashboard.jsp"/>
			</div>
		</div>
	</div>
	<div class="row large-mb">
		<div class="col-xs-12 centered">
			<div class="col-xs-2">&nbsp;</div>
			<div class="col-xs-8">
				<h3 class="header-text">Geographic Distribution of N3C Data</h3>
				<div id="graph"></div>
 			<jsp:include page="graph_support/site_map.jsp">
				<jsp:param name="ld" value="300" />
				<jsp:param name="map_type" value="${param.map_type}" />
				<jsp:param name="state_page" value="graph_support/us-states.json" />
				<jsp:param name="data_page" value="feeds/map_data.jsp" />
				<jsp:param name="site_page" value="feeds/siteLocations.jsp" />
				<jsp:param name="dom_element" value="#graph" />
			</jsp:include>
			</div>
		</div>
	</div>
	<div class="row large-mb">
		<div class="col-xs-12 centered">
			<div class="col-xs-2">&nbsp;</div>
			<div class="col-xs-4">
				<h3 class="header-text">N3C Projects</h3>
				<div class="panel-body">
					<div id="project-roster"></div>
					<jsp:include page="tables/project_roster_styled.jsp"/>
				</div>
			</div>
			<div class="col-xs-4">
				<h3 class="header-text">Publications</h3>
				<div class="panel-body">
					<div id="paper-list"></div>
					<jsp:include page="tables/publications_styled.jsp"/>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
