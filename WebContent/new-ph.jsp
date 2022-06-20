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
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="mb-5" style="margin-top: 30px;">
			<div class="">
				<div id="ph-summary" style="display: block;">
					<c:choose>
						<c:when test="${not empty param.secondary_tab }">
							<script>
 								cache_browser_history("new-ph", "new-ph")
							</script>
							<jsp:include page="new_ph/questions.jsp?secondary_tab=${param.secondary_tab}&tertiary_tab=${param.tertiary_tab}" flush="true" />
						</c:when>
						<c:otherwise>
							<jsp:include page="new_ph/questions.jsp" flush="true" />
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		
	</div>

	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
