<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" flush="true" />
<script src="<util:applicationRoot/>/resources/auth.js"></script>
<style>
.btn-select {
	text-align: center;
	margin-bottom: 20px;
}
.center {
	margin: auto;
	width: 70%;
	padding: 5px;
}
</style>

<body>
	<jsp:include page="navbar.jsp" flush="true">
		<jsp:param name="page" value="health" />
	</jsp:include>

	<div class="container-fluid">
		<div class="row">
			<div class="col-11 center">
				<h3 class="header-text">N3C Public Health Browser</h3>
				<div>
					<p>
						The data dashboards provide interactive views of <i>N3C</i> Research Program participant data. The N3C public health browser provides high value health data for policy makers, and investigators
						a snapshot of the clinical status of COVID as well as signal for further investigation within the N3C open science enclave.
					</p>
					<p>
						The data shown in the N3C public health browser comes from the N3C enclave, which is the largest collection of real-world data in the USA. The N3C Enclave comes from 69 health care institutions,
						from 49/50 states across the USA, and as of January 2022 consists of over 12 billion rows of clinical information. In addition to the RWD, the N3C enclave has a library of over 30 external data
						sets from that vary from mortality, pollution index that can be linked to the clinical data. A full list of available external data sets can be found at <a
							href="https://discovery.biothings.io/dataset?guide=/guide/n3c/dataset">https://discovery.biothings.io/dataset?guide=/guide/n3c/dataset</a>.
					</p>
					<p>
						In order to protect participant privacy, the data are de-identified, limited to aggregate counts and summary demographic information, with cell counts &lt;20 not being displayed. For more
						information, please visit our <a href="https://covid.cd2h.org/faq">FAQ</a> page.
					</p>
				</div>
			</div>
		</div>
		<div id="summary_btns" class="btn-select">
			<a id="ph-summary-btn" class="btn btn-primary active" role="button" onclick="toggle_subpanel('summary');">Summary Data</a>
			<a id="ph-pediatrics-btn" class="btn btn-primary" role="button" onclick="toggle_subpanel('pediatrics');">Pediatrics</a>
		</div>
		<div class="row mb-5">
			<div class="col-11 center">
				<div id="ph-summary" style="display: block;">
					<c:choose>
						<c:when test="${empty param.secondary_tab || param.secondary_tab == 'summary' }">
							<script>
 								cache_browser_history("public-health", "public-health/summary")
							</script>
							<jsp:include page="modules/questions.jsp?tertiary_tab=${param.tertiary_tab}" flush="true" />
						</c:when>
						<c:otherwise>
							<jsp:include page="modules/questions.jsp" flush="true" />
						</c:otherwise>
					</c:choose>
				</div>
				<div id="ph-pediatrics" style="display: none;">
					<c:choose>
						<c:when test="${param.secondary_tab == 'pediatrics' }">
							<script>
 								console.log("in peds choose", ${param.tertiary_tab})
								cache_browser_history("public-health", "public-health/pediatrics")
							</script>
							<jsp:include page="modules/pediatrics.jsp?tertiary_tab=${param.tertiary_tab}" flush="true" />
						</c:when>
						<c:otherwise>
							<jsp:include page="modules/pediatrics.jsp" flush="true" />
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<script>

		function toggle_subpanel(selection) {
			if (selection == "summary") {
				$("#ph-summary").css('display', 'block');
				$("#ph-summary-btn").addClass("active");
				$("#ph-pediatrics").css('display', 'none');
				$("#ph-pediatrics-btn").removeClass("active");
				cache_browser_history("public-health", "public-health/summary")
			}
			if (selection == "pediatrics") {
				$("#ph-summary").css('display', 'none');
				$("#ph-summary-btn").removeClass("active");
				$("#ph-pediatrics").css('display', 'block');
				$("#ph-pediatrics-btn").addClass("active");
				cache_browser_history("public-health", "public-health/pediatrics")
			}
		}

		<c:choose>
			<c:when test="${empty param.secondary_tab || param.secondary_tab == 'summary' }">
				toggle_subpanel("summary")
			</c:when>
			<c:when test="${param.secondary_tab == 'pediatrics' }">
				toggle_subpanel("pediatrics")
			</c:when>
		</c:choose>
		</script>
	</div>

	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>