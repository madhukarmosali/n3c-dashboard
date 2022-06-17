<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>


<html>
<jsp:include page="head.jsp" flush="true" />

<body>
	<jsp:include page="navbar.jsp" flush="true">
		<jsp:param name="page" value="health" />
	</jsp:include>

	<div class="container-fluid content" style="margin-top: 30px;">
		<div class="row">
			<div class="col-12 mx-auto">
				<div class="row">
					<div class="col-12 col-md-5">
						<div class="text-max mx-auto" style="padding: 20px; background: #f1f1f1; border: 1px solid lightgray;">
							<h3 class="header-text" >N3C Public Health Browser</h3>
							
							<div id="summary_btns" class="btn-select">
								<btn id="ph-summary-btn" class="btn btn-primary active" role="button" onclick="toggle_subpanel('summary');">Summary Data</btn>
								<btn id="ph-pediatrics-btn" class="btn btn-primary" role="button" onclick="toggle_subpanel('pediatrics');">Pediatrics</btn>
							</div>
							
							<div>
								<p style="display:none;">
									The public health dashboards provide policymakers and investigators with high-value insights into COVID-19 based on data from the N3C Data Enclave, the largest collection of real-world COVID-19 data in the United States. The data within the Enclave comes from 69 health care institutions from 49/50 states across the United States and consists of over 12 billion rows of clinical information. 
								</p>
								<p>
									Policymakers, investigators, and the general public are invited to use these interactive views to gain high-value insights into COVID-19 and explore the utility of the N3C Data Enclave for their research.
								</p>
								<div style="line-height: 1rem;">
									<small>
									In order to protect participant privacy, the data are de-identified and limited to aggregate counts and summary demographic information, with cell counts <20 not being displayed. For more information, please visit our <a href="">FAQ page</a>.
									</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-7 my-auto">
<%-- 						<img style="width:100%; height:auto; max-width:400px;" src="<util:applicationRoot/>/images/dash_hero3.png" alt="Person using dashboard"> --%>
						<div id="ph-dash-top">
							<div id="choose_dash">
								<h3>Choose a Dashboard:</h3>
								<select id="dashboard_select">
								</select>
							</div>
							<div id="question-description" style="padding: 10px;"></div>
						</div>
						<div id="ped-dash-top">
							<h3>N3C Pediatrics Dashboard</h3>
							<p>Funded in part by the National Institutes of Health's Eunice Kennedy Shriver 
							National Institute of Child Health and Human Development (NICHD), the N3C Pediatrics Dashboard seeks to
							make information about the trajectories of pediatric COVID-19 hospitalization rates and disease severity 
							readily available for national-level decision-making. The team is led by 
							<a href="https://som.ucdenver.edu/Profiles/Faculty/Profile/22381">Tell Bennett, MD</a>, who has been a part 
							of the N3C since its inception in March 2020. </p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="mb-5" style="margin-top: 30px;">
			<div class="">
				<div id="ph-summary" style="display: block;">
					<c:choose>
						<c:when test="${empty param.secondary_tab || param.secondary_tab == 'summary' }">
							<script>
 								cache_browser_history("new-ph", "new-ph/summary")
							</script>
							<jsp:include page="new_ph/questions.jsp?tertiary_tab=${param.tertiary_tab}&quaternary_tab=${param.quaternary_tab}" flush="true" />
						</c:when>
						<c:otherwise>
							<jsp:include page="new_ph/questions.jsp" flush="true" />
						</c:otherwise>
					</c:choose>
				</div>
				<div id="ph-pediatrics" style="display: none;">
					<c:choose>
						<c:when test="${param.secondary_tab == 'pediatrics' }">
							<script>
 								console.log("in peds choose", ${param.tertiary_tab})
								cache_browser_history("new-ph", "new-ph/pediatrics")
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
				$("#ph-dash-top").css('display', 'block');
				$("#ped-dash-top").css('display', 'none');
				$("#ph-summary").css('display', 'block');
				$("#ph-summary-btn").addClass("active");
				$("#ph-pediatrics").css('display', 'none');
				$("#ph-pediatrics-btn").removeClass("active");
				cache_browser_history("new-ph", "new-ph/summary")
			}
			if (selection == "pediatrics") {
				$("#ped-dash-top").css('display', 'block');
				$("#ph-dash-top").css('display', 'none');
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
