<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" flush="true" />

<style>

/* Front Page style */
.n3c-page-head {
	max-width: 750px;
	text-align:left;
}
.n3c-page-header{
	margin-bottom:50px;
	justify-content:center;
}


/* Card overrides front page */
.card{
	border:none;
}
.card-img-top{
	width:100%;
	max-width:200px;
	margin:auto;
}
.list-group-item {
    border-top: 1px solid rgba(0,0,0,.125) !important;
}
.list-group-item:last-child {
	border-bottom: 1px solid rgba(0,0,0,.125) !important;
}
.card-text{
	line-height:1.5em;
    min-height:3.5em;
    text-align:center;
}
.card-title{
	text-align:center;
}

.bkg-img{
	background-position: left;
    background-size: contain;
    background-image: url(/n3c-public-site/images/n3c_half.png);
    background-repeat: no-repeat;
}

@media (max-width: 768px){
	.head-text{
		padding-left:30px;
		padding-right:30px;
	}
}

</style>
<body>
	<jsp:include page="navbar.jsp" flush="true" />
	
	<div class="container container-large">
	
		<div class="row" style="padding-top:40px; padding-bottom:40px; width:100%;">
			<div class="head head-text col-12 col-md-10 col-lg-10 col-xl-11">
				<div class="n3c-page-head">			
					<h1>The National COVID Cohort Collaborative (N3C)</h1>
					<hr>
					<h3 class="hidden">Your Trusted Comprehensive Source for COVID&#x2011;19 Patient-Centric Data.</h3>
					<br>
					<a href="https://covid.cd2h.org/" role="button" class="btn btn-lg btn-n3c">Learn More</a>
				</div>
			</div>
		</div>
	
		
		<div class="container content">
			<div class="row n3c-page-header" padding-top:20px; padding-bottom:20px;">
				<div class="col-12 col-md-4 display-xs-none" style="text-align:center; padding-right:0px; display:flex;">
					<img alt="Spotlight Dashboard Preview" style="width:100%; heigh:auto; margin:auto; border:1px solid lightgray;" src="<util:applicationRoot/>/images/spotlight_preview.png"/>
				</div>
				<div class="col-12 col-md-8" style="display:flex; padding:0px">
					<div style="background: #f8f9fa; padding: 20px; display: flex; flex-direction: column; margin: auto;">
						<h3>In the Spotlight</h3>
						<h4>The N3C Pediatrics Dashboard</h4>
						<p>Funded in part by the National Institutes of Health's Eunice Kennedy Shriver 
						National Institute of Child Health and Human Development (NICHD), the N3C Pediatrics Dashboard seeks to
						make information about the trajectories of pediatric COVID-19 hospitalization rates and disease severity 
						readily available for national-level decision-making. The team is led by 
						<a href="https://som.ucdenver.edu/Profiles/Faculty/Profile/22381">Tell Bennett, MD</a>, who has been a part 
						of the N3C since its inception in March 2020. 
						<br>
						<br>
						<a href="<util:applicationRoot/>/public-health/pediatrics/severity" role="button" class="btn btn-sm btn-n3c">Learn More</a>
					</div>
				</div>	
			</div>
		</div>
			
		<div class="row n3c-page-header">
			<h3>Explore our Dashboards:</h3>
		</div>
			
		<div class="row">
			<div class="col-12 col-lg-6 col-xl-3 hidden">
				<div class="card" style="width: 100%;">
					<img class="card-img-top" src="<util:applicationRoot/>/images/icons/explore.png" alt="Explore Icon">
					<div class="card-body">
 						<h4 class="card-title"><a href="<util:applicationRoot/>/exploration">N3C Exploration <i class="fa fa-external-link" aria-hidden="true"></i></a></h4>
						<h4 class="card-text">Preview the N3C Data Enclave</h4>
					</div>
					<h5>Content:</h5>
					<ul class="list-group list-group-flush">
  						<li class="list-group-item">N3C Enclave Data Explorer</li>
  						<li class="list-group-item">N3C Geographic Distribution</li>
  						<li class="list-group-item">N3C Projects</li>
  						<li class="list-group-item">N3C Publications</li>
					</ul>
				</div>
			</div>
			<div class="col-12 col-lg-6 col-xl-3 hidden">
				<div class="card" style="width: 100%;">
					<img class="card-img-top" src="<util:applicationRoot/>/images/icons/admin.png" alt="Admin Icon">
					<div class="card-body">
 						<h4 class="card-title"><a href="<util:applicationRoot/>/admin">Administration <i class="fa fa-external-link" aria-hidden="true"></i></a></h4>
						<h4 class="card-text">Track the latest status updates for N3C</h4>
					</div>
					<h5>Content:</h5>
					<ul class="list-group list-group-flush">
  						<li class="list-group-item">N3C Metrics</li>
						<li class="list-group-item">Weekly Data Release Set</li>
						<li class="list-group-item">Data Transfer Agreements (DTAs)</li>
						<li class="list-group-item">Data Use Agreements (DUAs)</li>
						<li class="list-group-item">Domain Teams</li>
						<li class="list-group-item">Projects</li>
					</ul>
				</div>
			</div>
			<div class="col-12 col-lg-6 col-xl-3 hidden">
				<div class="card" style="width: 100%;">
					<img class="card-img-top" src="<util:applicationRoot/>/images/icons/health.png" alt="Health Icon">
					<div class="card-body">
 						<h4 class="card-title"><a href="<util:applicationRoot/>/public-health">Public Health <i class="fa fa-external-link" aria-hidden="true"></i></a></h4>
						<h4 class="card-text">Browse public health questions and answers</h4>
					</div>
					<h5>Content:</h5>
					<ul class="list-group list-group-flush">
  						<li class="list-group-item">Public Health Dashboards</li>
						<li class="list-group-item">Pediatrics Dashboard</li>
					</ul>
				</div>
			</div>		
			<div class="col-12 col-lg-6 col-xl-3 hidden">
				<div class="card" style="width: 100%;">
					<img class="card-img-top" src="<util:applicationRoot/>/images/icons/covid.png" alt="Covid Icon">
					<div class="card-body">
 						<h4 class="card-title"><a href="<util:applicationRoot/>/recover">RECOVER <i class="fa fa-external-link" aria-hidden="true"></i></a></h4>
						<h4 class="card-text">Learn about our RECOVER Long COVID models</h4>
					</div>
					<h5>Content:</h5>
					<ul class="list-group list-group-flush">
  						<li class="list-group-item">Most Important Model Features</li>
						<li class="list-group-item">Utilized Characteristics</li>
						<li class="list-group-item">Long COVID Demographics</li>
					</ul>
				</div>
			</div>		
		</div>
		
		
		</div>
	</div>

	<jsp:include page="footer.jsp" flush="true" />	
	
	<jsp:include page="modules/fade_animation_init.jsp" flush="true" />
	<jsp:include page="modules/scroll_down.jsp" flush="true" />
</body>
</html>
