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
							<option value="Unavailable">Unavailable</option>
							<option value="Mortality">Mortality</option>
							<option value="ED Visit (not admitted)">ED Visit (not admitted)</option>
							<option value="Severe Ventilation/ECMO/AKI">Severe Ventilation/ECMO/AKI</option>
							<option value="Moderate Hospitalized">Moderate Hospitalized</option>
							<option value="Mild">Mild</option>
						</select>
					</div>
				</c:if>
				<c:if test="${param.age_filter}">
					<div class="panel-body border">
						<h6>Age</h6>
						<select id="${param.block}-age-select" multiple="multiple">
							<option value="18-29">18-29</option>
							<option value="30-49">30-49</option>
							<option value="50-64">50-64</option>
							<option value="65+">65+</option>
						</select>
					</div>
				</c:if>
				<c:if test="${param.race_filter}">
					<div class="panel-body border">
						<h6>Race</h6>
						<select id="${param.block}-race-select" multiple="multiple">
							<option value="Asian">Asian</option>
							<option value="Black or African American">Black or African American</option>
							<option value="Missing/Unknown">Missing/Unknown</option>
							<option value="Native Hawaiian or Other Pacific Islander">Native Hawaiian or Other Pacific Islander</option>
							<option value="Other">Other</option>
							<option value="White">White</option>
						</select>
					</div>
				</c:if>
				<c:if test="${param.gender_filter}">
					<div class="panel-body border">
						<h6>Gender</h6>
						<select id="${param.block}-gender-select" multiple="multiple">
							<option value="Female">Female</option>
							<option value="Male">Male</option>
							<option value="Unknown / Not Reported">Unknown / Not Reported</option>
						</select>
					</div>
				</c:if>
				<c:if test="${param.ethnicity_filter}">
					<div class="panel-body border">
						<h6>Ethnicity</h6>
						<select id="${param.block}-ethnicity-select" multiple="multiple">
							<option value="Hispanic or Latino">Hispanic or Latino</option>
							<option value="Missing/Unknown">Missing/Unknown</option>
							<option value="Not Hispanic or Latino">Not Hispanic or Latino</option>
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
							<div class="col-lg-2">&nbsp;</div>
							<div class="col-lg-8" id="${param.datatable_div}"></div>
							<jsp:include page="${param.datatable}">
								<jsp:param name="target_div" value="${param.datatable_div}"/>
								<jsp:param name="block" value="${param.block}"/>
							</jsp:include>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>			

<script>

	$('#${param.block}-severity-select').change(function() {
	    $("#${param.datatable_div}-table").DataTable().column(4).search($(this).val().join('|'), true, false, true).draw();
	    ${param.block}_refreshHistograms();
    	console.log("severity", $(this).val())
  	});

	$('#${param.block}-age-select').change(function() {
	    $("#${param.datatable_div}-table").DataTable().column(2).search($(this).val().join('|'), true, false, true).draw();
	    ${param.block}_refreshHistograms();
    	console.log("age", $(this).val())
  	});

	$('#${param.block}-race-select').change(function() {
	    $("#${param.datatable_div}-table").DataTable().column(0).search($(this).val().join('|'), true, false, true).draw();
	    ${param.block}_refreshHistograms();
    	console.log("race", $(this).val())
  	});

	$('#${param.block}-gender-select').change(function() {
	    $("#${param.datatable_div}-table").DataTable().column(3).search($(this).val().join('|'), true, false, true).draw();
	    ${param.block}_refreshHistograms();
    	console.log("gender", $(this).val())
  	});

	$('#${param.block}-ethnicity-select').change(function() {
	    $("#${param.datatable_div}-table").DataTable().column(1).search($(this).val().join('|'), true, false, true).draw();
	    ${param.block}_refreshHistograms();
    	console.log("ethnicity", $(this).val())
  	});

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
		
		$("#${param.datatable_div}-table").DataTable().columns().search('').draw();
	    ${param.block}_refreshHistograms();
	}
	
	var ${param.block}_ageArray = new Array();
	var ${param.block}_raceArray = new Array();
	var ${param.block}_ethnicityArray = new Array();
	var ${param.block}_genderArray = new Array();
	var ${param.block}_severityArray = new Array();

	function ${param.block}_refreshHistograms() {
	    var data = $("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data().toArray();
	    console.log("table data", data)
	    ${param.block}_refreshAgeArray(data);
	    ${param.block}_refreshRaceArray(data);
	    ${param.block}_refreshEthnicityArray(data);
	    ${param.block}_refreshGenderArray(data);
	    ${param.block}_refreshSeverityArray(data);
	    
	    if (${param.block}_loaded("severity")) {
	    	d3.select("#${param.block}_severity_viz").select("svg").remove();
		    localPieChart(${param.block}_severityArray,"#${param.block}_severity_viz");
	    }
	    if (${param.block}_loaded("age")) {
		    d3.select("#${param.block}_age_viz").select("svg").remove();
		    localVerticalBarChart(${param.block}_ageArray,"#${param.block}_age_viz", 120);
	    }
	    if (${param.block}_loaded("race")) {
		    d3.select("#${param.block}_race_viz").select("svg").remove();
		    localPieChart(${param.block}_raceArray,"#${param.block}_race_viz", 0.66);
	    }
	    if (${param.block}_loaded("gender")) {
		    d3.select("#${param.block}_gender_viz").select("svg").remove();
		    localHorizontalBarChart(${param.block}_genderArray,"#${param.block}_gender_viz", 140);
	    }
	    if (${param.block}_loaded("ethnicity")) {
		    d3.select("#${param.block}_ethnicity_viz").select("svg").remove();
		    localPieChart(${param.block}_ethnicityArray,"#${param.block}_ethnicity_viz");
	    }
	  }
	
	
	function ${param.block}_refreshAgeArray(data) {
		var aData = new Object;
		$("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data().each( function ( group, i ) {
	    	var group = data[i].age_bin;
	    	var count = data[i].patient_count;
	        if (typeof aData[group] == 'undefined') {
	            aData[group] = count;
	         } else
	        	 aData[group] += count;
		});

		${param.block}_ageArray = new Array();
	    for(var i in aData) {
	    	var obj = new Object();
	    	Object.defineProperty(obj, 'element', {
	    		  value: i
	    		});
	    	Object.defineProperty(obj, 'count', {
	  		  value: aData[i]
	  		});
	    	${param.block}_ageArray.push(obj);
	    }
	    ${param.block}_ageArray.sort((a,b) => (a.element > b.element) ? 1 : ((b.element > a.element) ? -1 : 0));
	    console.log("refreshed age", ${param.block}_ageArray);
	}

	function ${param.block}_refreshRaceArray(data) {
		var aData = new Object;
		var bData = new Object;
		$("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data().each( function ( group, i ) {
	   	var group = data[i].race;
	   	switch (data[i].race) {
	   	case "White":
	   		group = "White";
	   		break;
		case "Black or African American":
			group = "Black";
			break;
		case "Asian":
			group = "Asian";
			break;
	   	case "Native Hawaiian or Other Pacific Islander":
	   		group = "NHPI";
	   		break;
	   	case "Other":
	   		group = "Other";
	   		break;
	   	case "Missing/Unknown":
	   		group = "Missing";
	   		break;
	   	};
		var count = data[i].patient_count;
		var seq = data[i].race_seq;
	        if (typeof aData[group] == 'undefined') {
	            aData[group] = count;
	            bData[group] = seq;
	         } else
	        	 aData[group] += count;
		});

		${param.block}_raceArray = new Array();
	    for(var i in aData) {
	    	var obj = new Object();
	    	Object.defineProperty(obj, 'element', {
	    		  value: i
	    		});
	    	Object.defineProperty(obj, 'count', {
	  		  value: aData[i]
	  		});
	    	Object.defineProperty(obj, 'seq', {
	    		  value: bData[i]
	    		});
	    	${param.block}_raceArray.push(obj);
	    }
	    ${param.block}_raceArray.sort((a,b) => (a.seq > b.seq) ? 1 : ((b.seq > a.seq) ? -1 : 0));
	    console.log("refreshed race", ${param.block}_raceArray);
	}

	function ${param.block}_refreshEthnicityArray(data) {
		var aData = new Object;
		var bData = new Object;
		$("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data().each( function ( group, i ) {
	    	var group = data[i].ethnicity_abbrev;
	    	var count = data[i].patient_count;
	    	var seq = data[i].ethnicity_seq;
	        if (typeof aData[group] == 'undefined') {
	            aData[group] = count;
	            bData[group] = seq;
	         } else
	        	 aData[group] += count;
		});

		${param.block}_ethnicityArray = new Array();
	    for(var i in aData) {
	    	var obj = new Object();
	    	Object.defineProperty(obj, 'element', {
	    		  value: i
	    		});
	    	Object.defineProperty(obj, 'count', {
	  		  value: aData[i]
	  		});
	    	Object.defineProperty(obj, 'seq', {
	  		  value: bData[i]
	  		});
	    	${param.block}_ethnicityArray.push(obj);
	    }
	    ${param.block}_ethnicityArray.sort((a,b) => (a.seq > b.seq) ? 1 : ((b.seq > a.seq) ? -1 : 0));
	    console.log("refreshed ethnicity", ${param.block}_ethnicityArray);
	}

	function ${param.block}_refreshGenderArray(data) {
		var aData = new Object;
		var bData = new Object;
		$("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data().each( function ( group, i ) {
	    	var group = data[i].gender;
	       	switch (data[i].gender) {
	       	case "MALE":
	       		group = "Male";
	       		break;
	    	case "FEMALE":
	    		group = "Female";
	    		break;
	    	case "OTHER":
	    		group = "Other";
	    		break;
	       	case "Other":
	       		group = "Other";
	       		break;
	       	case "Unkown":
	       		group = "Unkown";
	       		break;
	       	case "Gender unkown":
	       		group = "Unkown";
	       		break;
	       	};
	    	var count = data[i].patient_count;
	    	var seq = data[i].gender_seq;
	      if (typeof aData[group] == 'undefined') {
	            aData[group] = count;
	            bData[group] = seq;
	        } else
	        	 aData[group] += count;
		});

		${param.block}_genderArray = new Array();
	    for(var i in aData) {
	    	var obj = new Object();
	    	Object.defineProperty(obj, 'element', {
	    		  value: i
	    		});
	    	Object.defineProperty(obj, 'count', {
	  		  value: aData[i]
	  		});
	    	Object.defineProperty(obj, 'seq', {
	    		  value: bData[i]
	    		});
	    	${param.block}_genderArray.push(obj);
	    }
	    ${param.block}_genderArray.sort((a,b) => (a.seq > b.seq) ? 1 : ((b.seq > a.seq) ? -1 : 0));
	    console.log("refreshed gender", ${param.block}_genderArray);
	}

	function ${param.block}_refreshSeverityArray(data) {
		var aData = new Object;
		var bData = new Object;
		$("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data().each( function ( group, i ) {
	    	var group = data[i].severity;
	       	switch (data[i].severity) {
	       	case "Mild":
	       		group = "Mild";
	       		break;
	    	case "Mild_ED":
	    		group = "Mild in ED ";
	    		break;
	    	case "Moderate":
	    		group = "Moderate";
	    		break;
	       	case "Severe":
	       		group = "Severe";
	       		break;
	       	case "Dead_w_COVID":
	       		group = "Dead w/ COVID";
	       		break;
	       	};
	    	var count = data[i].patient_count;
	    	var seq = data[i].severity_seq;
	        if (typeof aData[group] == 'undefined') {
	            aData[group] = count;
	            bData[group] = seq;
	         } else
	        	 aData[group] += count;
		});

		${param.block}_severityArray = new Array();
	    for(var i in aData) {
	    	var obj = new Object();
	    	Object.defineProperty(obj, 'element', {
	    		  value: i
	    		});
	    	Object.defineProperty(obj, 'count', {
	  		  value: aData[i]
	  		});
	    	Object.defineProperty(obj, 'seq', {
	  		  value: bData[i]
	  		});
	    	${param.block}_severityArray.push(obj);
	    }
	    ${param.block}_severityArray.sort((a,b) => (a.seq > b.seq) ? 1 : ((b.seq > a.seq) ? -1 : 0));
	    console.log("refreshed severity", ${param.block}_severityArray);
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
	
	function ${param.block}_loaded(selection) {
		return ${param.block}_crumbs.includes(selection);
	}
</script>