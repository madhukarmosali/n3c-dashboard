<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<h3 class="header-text">Collaboration Networks</h3>
<div class="row mb-5">
	<div class="col-12 col-lg-4">
		<form>
			<input id="organization_button" name=type type="radio" value="full"	onclick="switch_graph();" checked> Organizations - Research	DURs<br>
			<input id="collaboration_button" name=type type="radio" value="full" onclick="switch_graph();"> Persons - Research DURs<br>
			<input id="operational_button" name=type type="radio" value="operational" onclick="switch_graph();"> Persons - Operational DURs<br>
			<input id="challenge_button" name=type type="radio" value="challenge" onclick="switch_graph();"> Challenge and connected DURs (individuals)<br>
			<input id="challenge_org_button" name=type type="radio"	value="challenge_org" onclick="switch_graph();"> Challenge and connected DURs (organizations)<br>
		</form>
	</div>
	<div class="col-12 col-lg-4">
		<ul>
			<li>Large blue icons are projects - mousing over shows the ID
				and title
			<li>The remaining icons are project members (color key at the
				right) - mouse over to see a name
		</ul>
	</div>
	<div class="col-12 col-lg-4">
		<div id="legend" style="display: block;"></div>
	</div>
</div>

<div class="container content container-large">
	<div id="content">
		<div id="organization_graph" style="display: block;"></div>
		<div id="collaboration_graph" style="display: none;"></div>
		<div id="operational_graph" style="display: none;"></div>
		<div id="challenge_graph" style="display: none;"></div>
		<div id="challenge_org_graph" style="display: none;"></div>
	</div>
</div>

<c:set var="root"><util:applicationRoot/></c:set>

<c:url var="encodedMapURL" value="data.jsp">
	<c:param name="detectionAlg" value="site" />
	<c:param name="resolution" value="1" />
	<c:param name="mode" value="${param.mode}" />
	<c:param name="query" value="${param.query}" />
	<c:param name="selectedNode" value="${param.selectedNode}" />
	<c:param name="radius" value="${param.radius}" />
</c:url>
<jsp:include page="../graph_support/forcePhoto.jsp" flush="true">
	<jsp:param name="charge" value="-350" />
	<jsp:param name="ld" value="70" />
	<jsp:param name="target" value="organization_graph" />
	<jsp:param name="legend_div" value="legend" />
	<jsp:param name="data_page"
		value="${root}/feeds/project_organization_graph.jsp" />
	<jsp:param name="detectionAlg" value="sites" />
</jsp:include>
<jsp:include page="../graph_support/forcePhoto.jsp" flush="true">
	<jsp:param name="charge" value="-350" />
	<jsp:param name="ld" value="70" />
	<jsp:param name="target" value="collaboration_graph" />
	<jsp:param name="data_page" value="${root}/feeds/project_graph.jsp" />
	<jsp:param name="detectionAlg" value="sites" />
</jsp:include>
<jsp:include page="../graph_support/forcePhoto.jsp" flush="true">
	<jsp:param name="charge" value="-350" />
	<jsp:param name="ld" value="70" />
	<jsp:param name="target" value="operational_graph" />
	<jsp:param name="data_page" value="${root}/feeds/project_operational_graph.jsp" />
	<jsp:param name="detectionAlg" value="sites" />
</jsp:include>
<jsp:include page="../graph_support/forcePhoto.jsp" flush="true">
	<jsp:param name="charge" value="-350" />
	<jsp:param name="ld" value="70" />
	<jsp:param name="target" value="challenge_graph" />
	<jsp:param name="data_page" value="${root}/feeds/project_challenge_graph.jsp" />
	<jsp:param name="detectionAlg" value="sites" />
</jsp:include>
<jsp:include page="../graph_support/forcePhoto.jsp" flush="true">
	<jsp:param name="charge" value="-350" />
	<jsp:param name="ld" value="70" />
	<jsp:param name="target" value="challenge_org_graph" />
	<jsp:param name="data_page"
		value="${root}/feeds/project_challenge_organization_graph.jsp" />
	<jsp:param name="detectionAlg" value="sites" />
</jsp:include>

<script>
	function switch_graph() {
		if (document.getElementById("organization_button").checked) {
			document.getElementById("organization_graph").style.display = "block";
			document.getElementById("collaboration_graph").style.display = "none";
			document.getElementById("operational_graph").style.display = "none";
			document.getElementById("challenge_graph").style.display = "none";
			document.getElementById("challenge_org_graph").style.display = "none";
		}
		if (document.getElementById("collaboration_button").checked) {
			document.getElementById("organization_graph").style.display = "none";
			document.getElementById("collaboration_graph").style.display = "block";
			document.getElementById("operational_graph").style.display = "none";
			document.getElementById("challenge_graph").style.display = "none";
			document.getElementById("challenge_org_graph").style.display = "none";
		}
		if (document.getElementById("operational_button").checked) {
			document.getElementById("organization_graph").style.display = "none";
			document.getElementById("collaboration_graph").style.display = "none";
			document.getElementById("operational_graph").style.display = "block";
			document.getElementById("challenge_graph").style.display = "none";
			document.getElementById("challenge_org_graph").style.display = "none";
		}
		if (document.getElementById("challenge_button").checked) {
			document.getElementById("organization_graph").style.display = "none";
			document.getElementById("collaboration_graph").style.display = "none";
			document.getElementById("operational_graph").style.display = "none";
			document.getElementById("challenge_graph").style.display = "block";
			document.getElementById("challenge_org_graph").style.display = "none";
		}
		if (document.getElementById("challenge_org_button").checked) {
			document.getElementById("organization_graph").style.display = "none";
			document.getElementById("collaboration_graph").style.display = "none";
			document.getElementById("operational_graph").style.display = "none";
			document.getElementById("challenge_graph").style.display = "none";
			document.getElementById("challenge_org_graph").style.display = "block";
		}
	}
</script>
