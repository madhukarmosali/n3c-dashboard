<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>
.block_header{
	text-align:center; 
	color:#fff; 
	background: #454F82;
	font-family: Arial, Helvetica, sans-serif;
	font-size:18px; 
	padding: 3px; 
	margin-top:20px;
}
button {
	border-radius: 5px;
    background: #2363ff;
    color: white;
    border: 2px solid #b0afae;
    padding: 7px;
}

</style>

<!-- A block is comprised of a header bar, an optional left column with KPIs and filters, and a main panel
	 that supports a set of optional sub-panels -->

<div class="row stats border">
	<div class="col-12 col-lg-12">
		<div class="block_header border">
			${param.block_header }
		</div>
	
		<div class="row">
		
			<!-- left column for KPIs and filters -->
	
			<div id="${param.block}-block-kpi" class="col-12 col-md-2 border" >
				<c:if test="${not empty param.kpis}">
					<jsp:include page="${param.kpis}"/>
				</c:if>
				<div class="panel-body border">
					<h5>Available Filters</h5>
					click a category below to show/hide options
				</div>

				<!-- filters are enabled by passing in a boolean parameter -->
				
				<c:if test="${param.severity_filter}">
					<div class="panel-body border">
						<h6>Severity</h6>
						<select id="${param.block}-severity-select" multiple="multiple">
							<option value="one">Unavailable</option>
							<option value="two">Mortality</option>
							<option value="three">ED Visit (not admitted)</option>
							<option value="four">Severe Ventilation / ECMO / AKI</option>
							<option value="five">Moderate Hospitalized</option>
							<option value="six">Mild</option>
						</select>
					</div>
				</c:if>
				<c:if test="${param.age_filter}">
					<div class="panel-body border">
						<h6>Age</h6>
						<select id="${param.block}-age-select" multiple="multiple">
							<option value="one">18-29</option>
							<option value="two">30-49</option>
							<option value="three">50-64</option>
							<option value="four">65+</option>
						</select>
					</div>
				</c:if>
				<c:if test="${param.race_filter}">
					<div class="panel-body border">
						<h6>Race</h6>
						<select id="${param.block}-race-select" multiple="multiple">
							<option value="one">Asian</option>
							<option value="two">Black or African American</option>
							<option value="three">Missing / Unknown</option>
							<option value="four">Native Hawaiian or Other Pacific Islander</option>
							<option value="five">Other</option>
							<option value="six">White</option>
						</select>
					</div>
				</c:if>
				<c:if test="${param.gender_filter}">
					<div class="panel-body border">
						<h6>Gender</h6>
						<select id="${param.block}-gender-select" multiple="multiple">
							<option value="one">Female</option>
							<option value="two">Male</option>
							<option value="three">Unknown / Not Reported</option>
						</select>
					</div>
				</c:if>
				<c:if test="${param.ethnicity_filter}">
					<div class="panel-body border">
						<h6>Ethnicity</h6>
						<select id="${param.block}-ethnicity-select" multiple="multiple">
							<option value="one">Hispanic or Latino</option>
							<option value="two">Missing / Unknown</option>
							<option value="three">Not Hispanic or Latino</option>
						</select>
					</div>
				</c:if>

				<button id="${param.block}_btn" class="button" onclick="${param.block}_filter_clear()"><i class="fa fa-filter" aria-hidden="true"></i> Clear all selections</button>
			</div>
			
			<!-- the main panel has a strip of optional selection buttons across the top, controlling the visibility of the matched sub-panel -->
			
			<div id="${param.block}-panel" class="col-12 col-md-10 border" >
				<div id="${param.block}-btns" class="btn-select border">
					<c:if test="${not empty param.severity_panel}">
						<button id="${param.block}-severity-btn" class="btn btn-primary active" role="button" onclick="${param.block}_toggle('severity');">Severity</button>
					</c:if>
					<c:if test="${not empty param.age_panel}">
						<button id="${param.block}-age-btn" class="btn btn-primary" role="button" onclick="${param.block}_toggle('age');">Age</button>
					</c:if>
					<c:if test="${not empty param.race_panel}">
						<button id="${param.block}-race-btn" class="btn btn-primary" role="button" onclick="${param.block}_toggle('race');">Race</button>
					</c:if>
					<c:if test="${not empty param.gender_panel}">
						<button id="${param.block}-gender-btn" class="btn btn-primary" role="button" onclick="${param.block}_toggle('gender');">Gender</button>
					</c:if>
					<c:if test="${not empty param.ethnicity_panel}">
						<button id="${param.block}-ethnicity-btn" class="btn btn-primary" role="button" onclick="${param.block}_toggle('ethnicity');">Ethnicity</button>
					</c:if>
				</div>
				<c:if test="${not empty param.simple_panel}">
					<div id="${param.block}-simple" class="border" style="display: block;">
						<jsp:include page="${param.simple_panel}"/>
					</div>
				</c:if>
				<c:if test="${not empty param.severity_panel}">
					<div id="${param.block}-severity" class="border" style="display: none;" src="${param.severity_panel}">
					</div>
				</c:if>
				<c:if test="${not empty param.age_panel}">
					<div id="${param.block}-age" class="border" style="display: none;" src="${param.age_panel}">
					</div>
				</c:if>
				<c:if test="${not empty param.race_panel}">
					<div id="${param.block}-race" class="border" style="display: none;" src="${param.race_panel}">
					</div>
				</c:if>
				<c:if test="${not empty param.gender_panel}">
					<div id="${param.block}-gender" class="border" style="display: none;" src="${param.gender_panel}">
					</div>
				</c:if>
				<c:if test="${not empty param.ethnicity_panel}">
					<div id="${param.block}-ethnicity" class="border" style="display: none;" src="${param.ethnicity_panel}">
					</div>
				</c:if>

				<c:if test="${not empty param.datatable}">
					<div class="col-xs-12 col-lg-12">
						<div class="block_header"></div>
						<div class="row">
							<div class="col-lg-3">&nbsp;</div>
							<div class="col-lg-7" id="${param.datatable_div}"></div>
							<jsp:include page="${param.datatable}" />
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>			

<script>

	$(document).ready(function() {       
		$('#${param.block}-severity-select').multiselect({		
		});
		$('#${param.block}-age-select').multiselect({		
		});
		$('#${param.block}-race-select').multiselect({		
		});
		$('#${param.block}-gender-select').multiselect({		
		});
		$('#${param.block}-ethnicity-select').multiselect({		
		});
	});

	function ${param.block}_filter_clear() {
		$('#${param.block}-severity-select').multiselect('deselectAll');
		$('#${param.block}-age-select').multiselect('deselectAll');
		$('#${param.block}-race-select').multiselect('deselectAll');
		$('#${param.block}-gender-select').multiselect('deselectAll');
		$('#${param.block}-ethnicity-select').multiselect('deselectAll');
	}
	
	function ${param.block}_toggle(selection) {
		if (selection == "severity") {
			$("#${param.block}-severity").css('display', 'block');
			$("#${param.block}-severity-btn").addClass("active");
			$("#${param.block}-age").css('display', 'none');
			$("#${param.block}-age-btn").removeClass("active");
			$("#${param.block}-race").css('display', 'none');
			$("#${param.block}-race-btn").removeClass("active");
			$("#${param.block}-gender").css('display', 'none');
			$("#${param.block}-gender-btn").removeClass("active");
			$("#${param.block}-ethnicity").css('display', 'none');
			$("#${param.block}-ethnicity-btn").removeClass("active");
//			cache_browser_history("admin", "admin/institutions")
		}
		if (selection == "age") {
			$("#${param.block}-severity").css('display', 'none');
			$("#${param.block}-severity-btn").removeClass("active");
			$("#${param.block}-age").css('display', 'block');
			$("#${param.block}-age-btn").addClass("active");
			$("#${param.block}-race").css('display', 'none');
			$("#${param.block}-race-btn").removeClass("active");
			$("#${param.block}-gender").css('display', 'none');
			$("#${param.block}-gender-btn").removeClass("active");
			$("#${param.block}-ethnicity").css('display', 'none');
			$("#${param.block}-ethnicity-btn").removeClass("active");
//			cache_browser_history("admin", "admin/institutions")
		}
		if (selection == "race") {
			$("#${param.block}-severity").css('display', 'none');
			$("#${param.block}-severity-btn").removeClass("active");
			$("#${param.block}-age").css('display', 'none');
			$("#${param.block}-age-btn").removeClass("active");
			$("#${param.block}-race").css('display', 'block');
			$("#${param.block}-race-btn").addClass("active");
			$("#${param.block}-gender").css('display', 'none');
			$("#${param.block}-gender-btn").removeClass("active");
			$("#${param.block}-ethnicity").css('display', 'none');
			$("#${param.block}-ethnicity-btn").removeClass("active");
//			cache_browser_history("admin", "admin/institutions")
		}
		if (selection == "gender") {
			$("#${param.block}-severity").css('display', 'none');
			$("#${param.block}-severity-btn").removeClass("active");
			$("#${param.block}-age").css('display', 'none');
			$("#${param.block}-age-btn").removeClass("active");
			$("#${param.block}-race").css('display', 'none');
			$("#${param.block}-race-btn").removeClass("active");
			$("#${param.block}-gender").css('display', 'block');
			$("#${param.block}-gender-btn").addClass("active");
			$("#${param.block}-ethnicity").css('display', 'none');
			$("#${param.block}-ethnicity-btn").removeClass("active");
//			cache_browser_history("admin", "admin/institutions")
		}
		if (selection == "ethnicity") {
			$("#${param.block}-severity").css('display', 'none');
			$("#${param.block}-severity-btn").removeClass("active");
			$("#${param.block}-age").css('display', 'none');
			$("#${param.block}-age-btn").removeClass("active");
			$("#${param.block}-race").css('display', 'none');
			$("#${param.block}-race-btn").removeClass("active");
			$("#${param.block}-gender").css('display', 'none');
			$("#${param.block}-gender-btn").removeClass("active");
			$("#${param.block}-ethnicity").css('display', 'block');
			$("#${param.block}-ethnicity-btn").addClass("active");
//			cache_browser_history("admin", "admin/institutions")
		}
		
		${param.block}_load(selection);
	}

	// manage incremental loading of panels on inner nav bar clicks
	//
	var ${param.block}_crumbs = '';
	
	function ${param.block}_load(selection) {
		var $this = $("#${param.block}-"+selection);
		var which = $this.attr('src');

		console.log("in main click", "${param.block}-"+selection, "which", which)
		if (!${param.block}_crumbs.includes(selection)) {
			$this.load("<util:applicationRoot/>/new_ph/"+which);
			${param.block}_crumbs = ${param.block}_crumbs + selection;
			console.log({
				which : which
			});
		}
	};
</script>