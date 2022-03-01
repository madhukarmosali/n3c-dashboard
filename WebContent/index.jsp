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
			<img src="<util:applicationRoot/>/images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">The National COVID-19 Cohort Collaborative (N3C)
			<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">The
			National <strong>COVID-19</strong> Cohort Collaborative (N3C)
		</h2>
	</div>

	<div class="row large-mb">
		<div class="col-xs-12 centered">
			<div class="col-xs-3">
				<p>To explore the data in N3C more deeply, try the <a href="https://covid.cd2h.org/dashboard">N3C Dashboard</a>.</p>
				<p>To do your own research in the Enclave, <a href="https://covid.cd2h.org/enclave">register for access</a>.</p>
			</div>
			<div class="col-xs-6">
				<jsp:include page="caption.jsp">
					<jsp:param value="main-intro" name="tag" />
				</jsp:include>
			</div>
		</div>
	</div>
	<div class="row large-mb">
		<div class="col-xs-12 centered">
			<div class="col-xs-2">&nbsp;</div>
			<div class="col-xs-8">
				<h3 class="header-text">How big is the N3C Enclave?</h3>
				<c:import url="https://covid.cd2h.org/dashboard/graph_support/n3c_fact_sheet.jsp"/>
			</div>
		</div>
	</div>
	<div class="row large-mb">
		<div class="col-xs-12 centered">
			<div class="col-xs-2">&nbsp;</div>
			<div class="col-xs-8">
				<h3 class="header-text">Who are the Patients?</h3>
				<c:import url="https://labs.cd2h.org/n3c-cohort/demo1/dashboard.jsp"/>
			</div>
		</div>
	</div>
	<div class="row large-mb">
		<div class="col-xs-12 centered">
			<div class="col-xs-2">&nbsp;</div>
			<div class="col-xs-8">
				<h3 class="header-text">Where are they from?</h3>
					<div class="col-xs-12 col-md-12 col-lg-8">
						<div id="graph"></div>
					</div>
					<div class="col-xs-12 col-md-12 col-lg-4">
 						<div id="site-roster"></div>
				<c:import url="https://labs.cd2h.org/n3c-cohort/tables/site_roster.jsp"/>
					</div>
			<c:import url="https://labs.cd2h.org/n3c-cohort/graph_support/site_map.jsp">
				<c:param name="ld" value="300" />
				<c:param name="map_type" value="${param.map_type}" />
				<c:param name="state_page" value="/n3c_cohort/graph_support/us-states.json" />
				<c:param name="data_page" value="/n3c_cohort/feeds/map_data.jsp" />
				<c:param name="site_page" value="/n3c_cohort/feeds/siteLocations.jsp" />
				<c:param name="dom_element" value="#graph" />
			</c:import>
			</div>
		</div>
	</div>
	<div class="row large-mb">
		<div class="col-xs-12 centered">
			<div class="col-xs-3">&nbsp;</div>
			<div class="col-xs-3">
				<h3 class="header-text">Research Groups</h3>
			</div>
			<div class="col-xs-3">
				<h3 class="header-text">Publications</h3>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
