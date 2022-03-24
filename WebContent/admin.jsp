<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" flush="true" />

<body>
	<jsp:include page="navbar.jsp" flush="true" />

	<div class="container-fluid">
		<h2 class="header-text"><img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo"> The National <strong>COVID-19</strong> Cohort Collaborative (N3C)
		</h2>
	</div>

	<div class="row large-mb">
		<div class="col-xs-4">
			<h3 class="header-text">Metrics</h3>
			<div>
				<a onclick="toggle_metrics('institutions');">Institutions</a>
				<a onclick="toggle_metrics('users');">Users</a>
			</div>
			<div id="metrics-institutions" style="display:block;">
				<jsp:include page="admin/institutions.jsp"/>
			</div>
			<div id="metrics-users" style="display:none;">
				<jsp:include page="admin/users.jsp"/>
			</div>
		</div>
		<div class="col-xs-4">
			<h3 class="header-text">Institutions</h3>
			<div>
				<jsp:include page="admin/map.jsp"/>
			</div>
		</div>
		<div class="col-xs-4">
			<h3 class="header-text">Groups</h3>
			<div>
				<a onclick="toggle_groups('domain-teams');">Domain Teams</a>
				<a onclick="toggle_groups('projects');">Projects</a>
			</div>
			<div id="groups-domain-teams" style="display:block;">
				<jsp:include page="admin/domain_teams.jsp"/>
			</div>
			<div id="groups-projects" style="display:none;">
				<jsp:include page="admin/projects.jsp"/>
			</div style="display:none;">
		</div>
	</div>

	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>

<script>

	function toggle_metrics(selection) {
		if (selection == "institutions") {
			document.getElementById("metrics-institutions").style.display = "block";
			document.getElementById("metrics-users").style.display = "none";
		}
		if (selection == "users") {
			document.getElementById("metrics-institutions").style.display = "none";
			document.getElementById("metrics-users").style.display = "block";
		}
	}
	
	function toggle_groups(selection) {
		if (selection == "domain-teams") {
			document.getElementById("groups-domain-teams").style.display = "block";
			document.getElementById("groups-projects").style.display = "none";
		}
		if (selection == "projects") {
			document.getElementById("groups-domain-teams").style.display = "none";
			document.getElementById("groups-projects").style.display = "block";
		}
	}
	
</script>
