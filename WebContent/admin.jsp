<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>

<style>
.btn-select{
	text-align: center;
	margin-bottom: 20px;
}

.dataTables_length{
	display:none;
}

.dataTables_filter{
	float:none !important;
	text-align:center !important;
}

#fact_sheet_drop a[aria-expanded = "true"] span:after{
	font-family: "Font Awesome\ 5 Free"; 
	content: "\f056";
  	font-weight: 900;
}

#fact_sheet_drop a[aria-expanded = "false"] span:after{
	font-family: "Font Awesome\ 5 Free"; 
	content: "\f055";
	font-weight: 900;
}



</style>

<jsp:include page="head.jsp" flush="true" />

<body>
	<jsp:include page="navbar.jsp" flush="true">
  		<jsp:param name="page" value="admin"/>
	</jsp:include>

	<div class="container content container-large">
		
		<div class="row mb-5">
			<div class="col-12">
				<div class="accordion" id="fact_sheet_drop">
  					<div class="card">
    					<div class="card-header" id="factheadingOne">
      						<h4 class="mb-0">Weekly Data Release Set:&nbsp;<span id="date">&nbsp;</span>
        						<a href="" style="display:inline; float:right;" class="btn btn-link btn-block text-left collapsed icon-btn p-0 accordion-toggle" type="button" data-toggle="collapse" data-target="#factcollapseOne" aria-expanded="false" aria-controls="collapseOne">
          							<span>&nbsp;</span>
        						</a>
      						</h4>
   						 </div>
    					<div id="factcollapseOne" class="collapse" aria-labelledby="factheadingOne" data-parent="#fact_sheet_drop">
      						<div class="card-body">
       							<jsp:include page="modules/admin_fact.jsp"/>
      						</div>
    					</div>
  					</div>
				</div>
			</div>
		</div>
		
		
		<div class="row">
			<div class="col-12 col-lg-4">
				<h3 class="header-text">Metrics</h3>
				<div id="metric_btns" class="btn-select">
					<a id="metrics-institutions-btn" class="btn btn-primary active" role="button" onclick="toggle_metrics('institutions');">Institutions</a>
					<a id="metrics-users-btn" class="btn btn-primary" role="button" onclick="toggle_metrics('users');">Users</a>
				</div>
				<div id="metrics-institutions" style="display:block;">
					<jsp:include page="admin/institutions.jsp"/>
				</div>
				<div id="metrics-users" style="display:none;">
					<jsp:include page="admin/users.jsp"/>
				</div>
			</div>
			
			<div class="col-12 col-lg-4">
				<h3 class="header-text">Institutions</h3>
				<div id="inst_btns" class="btn-select">
					<a id="graph-btn" class="btn btn-primary active" role="button" onclick="toggle_map('map');">Map</a>
					<a id="site-roster-btn" class="btn btn-primary" role="button" onclick="toggle_map('table');">Table</a>
				</div>
				<div>
					<div id="graph" style="overflow:hidden; display:block;"></div>
					<div id="site-roster" style="display:none;"></div>
					<c:import url="modules/admin_map.jsp"/>
				</div>
			</div>
			
			<div class="col-12 col-lg-4">
				<h3 class="header-text">Groups</h3>
				<div class="btn-select">
					<a id="domain-team-roster-btn" class="btn btn-primary active" role="button" onclick="toggle_groups('domain-teams');">Domain Teams</a>
					<a id="project-roster-btn" class="btn btn-primary" role="button" onclick="toggle_groups('projects');">Projects</a>
				</div>
				<div id="domain-team-roster" style="display:block;">
					<c:import url="modules/domain_team_roster.jsp"/>
				</div>
				<div id="project-roster" style="display:none;">
					<c:import url="modules/project_roster.jsp"/>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" flush="true" />
	
	<script>

	function toggle_metrics(selection) {
		if (selection == "institutions") {
			$("#metrics-institutions").css('display', 'block');
			$("#metrics-institutions-btn").addClass("active");
			$("#metrics-users").css('display', 'none');
			$("#metrics-users-btn").removeClass("active");
		}
		if (selection == "users") {
			$("#metrics-institutions").css('display', 'none');
			$("#metrics-institutions-btn").removeClass("active");
			$("#metrics-users").css('display', 'block');
			$("#metrics-users-btn").addClass("active");
		}
	}
	
	function toggle_map(selection) {
		if (selection == "map") {
			$("#graph").css('display', 'block');
			$("#graph-btn").addClass("active");
			$("#site-roster").css('display', 'none');
			$("#site-roster-btn").removeClass("active");
		}
		if (selection == "table") {
			$("#graph").css('display', 'none');
			$("#graph-btn").removeClass("active");
			$("#site-roster").css('display', 'block');
			$("#site-roster-btn").addClass("active");
		}
	}
	
	function toggle_groups(selection) {
		if (selection == "domain-teams") {
			$("#domain-team-roster").css('display', 'block');
			$("#domain-team-roster-btn").addClass("active");
			$("#project-roster").css('display', 'none');
			$("#project-roster-btn").removeClass("active");
			
			
		}
		if (selection == "projects") {
			$("#domain-team-roster").css('display', 'none');
			$("#domain-team-roster-btn").removeClass("active");
			$("#project-roster").css('display', 'block');
			$("#project-roster-btn").addClass("active");
		}
	}
	
	</script>
	
</body>
</html>

