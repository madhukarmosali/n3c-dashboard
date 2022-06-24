<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>


<html>
<jsp:include page="head.jsp" flush="true" />

<style>
#ph_data_drop a[aria-expanded = "true"] span.btn:after{
	font-family: "Font Awesome\ 5 Free"; 
	content: "\f056";
  	font-weight: 900;
}

#ph_data_drop a[aria-expanded = "false"] span.btn:after{
	font-family: "Font Awesome\ 5 Free"; 
	content: "\f055";
	font-weight: 900;
}

#ph_data_drop .card-header{
	background-color: white;
}

.accordion_text{
	color: #212529!important;
}

#frame .datatable_overflow{
	width: 100%;
	overflow:scroll;
}
</style>

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
							<h3 class="header-text" >N3C Public Health Data Browser</h3>
							
							<div>
								<p>
									The N3C public health browser provides interactive views of N3C Research Program 
									participant data. These dashboards offer policymakers access to high-value health 
									data and investigators access to a snapshot of the clinical status of COVID as well 
									as a signal for further investigation within the N3C open science Enclave.
								</p>
								<div class="accordion" id="ph_data_drop">
  									<div class="card">
  										<a Title="expand/collapse learn more about data" href="" class="accordion-toggle" data-toggle="collapse" data-target="#factcollapseOne" aria-expanded="false" aria-controls="collapseOne">
	    									<div class="card-header" id="ph_data_heading_one">
	      										<h4 class="mb-0">
	      											<span class="accordion_text">More about the Data:</span>
	      											<span style="display:inline; float:right;" class="btn btn-link btn-block text-left collapsed icon-btn p-0 accordion-toggle">
	      											</span>
	      										</h4>
	   						 				</div>
   						 				</a>
    									<div id="factcollapseOne" class="collapse" aria-labelledby="ph_data_heading_one" data-parent="#ph_data_drop">
      										<div class="card-body">
       											<p>
													The data shown in the N3C public health browser comes from the N3C Data Enclave, 
													the largest collection of real-world COVID-19 data in the USA. Data in the Enclave 
													comes from <span id="sites">&nbsp;</span> health care institutions, from 49/50 states in the USA, 
													and consists of <span id="rows">&nbsp;</span> rows of clinical information. 
													The Enclave also has an additional library of over 30 external data sets 
													varying in scope from mortality to pollution that can be linked to its real-world 
													clinical data. A full list of available external data sets can be found 
													<a href="https://discovery.biothings.io/dataset?guide=/guide/n3c/dataset" title="Full External Dataset Browser">here</a>.
												</p>
												<div style="line-height: 1rem;">
													<small>
													In order to protect participant privacy, the data are de-identified and limited to aggregate counts and summary demographic information, with cell counts <20 not being displayed. For more information, please visit our <a href="https://covid.cd2h.org/faq" Title="N3C FAQ Page">FAQ page</a>.
													</small>
												</div>
      										</div>
    									</div>
  									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-7">
						<div id="ph-dash-top" style="padding-top: 20px;">
							<div id="choose_dash">
								<h3>Choose a Topic:</h3>
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
		
		
		
		<script>
		$.getJSON("<util:applicationRoot/>/feeds/embedded_fact_sheet.jsp", function(json){
			var data = $.parseJSON(JSON.stringify(json));
			
			$('#rows').text(data['total_rows']);
			$('#sites').text(data['sites_ingested']); 	
		});
		
// 		Trying to get back broswer button to load, currently only saves last broswer
		window.addEventListener('popstate', function (event) {
			location.reload();
		});
		</script>
	</div>

	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
