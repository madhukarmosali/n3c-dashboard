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

.kpi tr {
	width: auto;
}

.block_header{
	background:none;
}

.kpi_ind{
	text-align:center;
}

.kpi_section .dropdown-item{
	white-space: unset;
}

#viz_title{
	display:none;
}

#${param.block}_btn_hide{
	position: absolute;
    left: 0px;
    top: 0px;
    transform: rotate(-90deg) translate(-20px, -77px);
    border-radius: 0;
}


#${param.block}_btn_show {
    /* position: absolute; */
    left: 0px;
    top: 0px;
    transform: rotate(-90deg) translate(-24px, 54px);
    border-radius: 0;
}

.drop_filter{
	right: 0;
	left: auto;
	width: max-content;
}

.dash_filter_header{
	margin-right: 30px;
    margin-left: 30px;
}

.show_clear{
	display: inline-block;
}

.no_clear{
	display:none;
}

.show_filt:after{
	border-top: 0.3em solid;
    border-right: 0.3em solid transparent;
    border-bottom: 0;
    border-left: 0.3em solid transparent;
}

.hide_filt:after{
	border-top: 0;
    border-right: 0.3em solid transparent;
    border-bottom: 0.3em solid;
    border-left: 0.3em solid transparent;
}

.viz_options_dropdown{
	text-align: left; 
	font-size: 1.2rem;
}
.filter_button_container{
	text-align:right;
}

@media (max-width: 768px) {
  .viz_options_dropdown, 
  .filter_button_container{
    text-align: center;
  }
}

.select2-container--default .select2-results__option--disabled{
	display:none;
}

.dash_viz{
	text-align:center;
}

.table_search_indicator{
	color: #007bff;
}
</style>

<!-- A block is comprised of a header bar, an optional left column with KPIs and filters, and a main panel
	 that supports a set of optional sub-panels -->

<div class="row stats block2 mx-auto">
	<div class="col-12">
		
<!-- 		<div class="block_header "> -->
<%-- 			${param.block_header } --%>
<!-- 		</div> -->
	
		
		<div class="row" style="margin-top: 30px;">
		
			<c:if test="${not empty param.kpis}">
			<div class="col-12 col-md-2">
				<div class="row kpi-row">
					<div id="${param.block}-block-kpi-kpi" class="col-12">
						<div class="kpi_containter row" style="justify-content: center;">
							<jsp:include page="${param.kpis}?block=${param.block}&kpi_filter=${param.kpi_filter}"/>
							<div class="kpi-limit"><a onclick="limitlink(); return false;" href="#limitations-section">* See Limitations Below</a></div>
						</div>
					</div>
				</div>
			</div>
			</c:if>
			
			<div id="${param.block}-panel" class="col-12 col-md-10 mx-auto mb-4" >
				
				<c:if test="${not empty param.topic_title}">
					<div id="viz_title" style="text-align:center;"> 
						<h4>${param.topic_title}</h4>
					</div>
				</c:if>
				
				<div class="row">
					<c:if test="${not empty param.severity_panel || not empty param.age_panel || not empty param.gender_panel || not empty param.ethnicity_panel || not empty param.sotrovimab_panel1}">
						<div class="mt-2 col-12 col-md-6">
						<div class="viz_options_dropdown">
							<span class="align-middle">Explore Topic By </span>
							<select id="${param.block}toggle_viz_select">
								<c:if test="${not empty param.severity_panel}">
									<option value="severity">Severity</option>
								</c:if>
								<c:if test="${not empty param.age_panel}">
									<option value="age">Age</option>
								</c:if>
								<c:if test="${not empty param.race_panel}">
									<option value="race">Race</option>
								</c:if>
								<c:if test="${not empty param.gender_panel}">
									<option value="gender">Gender</option>
								</c:if>
								<c:if test="${not empty param.ethnicity_panel}">
									<option value="ethnicity">Ethnicity</option>
								</c:if>
								<c:if test="${not empty param.raceseverity_panel}">
									<option value="raceseverity">Race & Severity</option>
								</c:if>
								<c:if test="${not empty param.comorbidity_panel}">
									<option value="comorbidity">Comorbidities</option>
								</c:if>
								<c:if test="${not empty param.sotrovimab_panel1}">
									<option value="sotrovimab1">Severity & Medications</option>
								</c:if>
								<c:if test="${not empty param.sotrovimab_panel2}">
									<option value="sotrovimab2">Additional Medications</option>
								</c:if>
									<option hidden value="verylongtextverylongtext">verylongtextverylongtext</option>
							</select>
						</div>	
						</div>
					</c:if>
					<c:if test="${not empty param.severity_filter || not empty param.age_filter || not empty param.age_filter2 || not empty param.age_filter4 || not empty param.age_filter5 || not empty param.age_filter6 || not empty param.age_filter7 || not empty param.age_filterpeds || not empty param.age_filterpeds2 || not empty param.race_filter || not empty param.gender_filter || not empty param.ethnicity_filter || not empty param.observation_filter || not empty param.symptom_filter || not empty param.beforeafter_filter || not empty param.result_filter || not empty param.delay_filter || not empty param.diagnosis_filter}">
						<div class="mt-2 ml-auto col-12 col-md-6 filter_button_container">
							<small id="${param.block}_table_clear" class="no_clear table_search_indicator"><i class="fas fa-info-circle"></i> Table Search Applied</small>
							<button id="${param.block}_btn_clear" class="btn button dash-filter-btn2 mt-0 no_clear" onclick="${param.block}_filter_clear()"><i class="fas fa-times-circle"></i> Clear Filters</button>
							<div class="dropdown" style="display: inline-block;">
		  						<button data-bs-auto-close="false" class="btn dash-filter-btn dropdown-toggle mt-0 show_filt" type="button" id="${param.block}dropdownMenuButton" data-toggle="" aria-haspopup="true" aria-expanded="false">
		    						Chart/Table Filters
		  						</button>
			  					<div id="${param.block}filter_options_drop" class="dropdown-menu dropdown-menu-right drop_filter" aria-labelledby="${param.block}dropdownMenuButton">
			    					<div id="${param.block}-block-kpi" class="kpi_section">
										<!-- filters are enabled by passing in a boolean parameter -->
										
										<c:if test="${param.severity_filter}">
											<jsp:include page="filters/severity.jsp"/>
										</c:if>
										<c:if test="${param.age_filter}">
											<jsp:include page="filters/age.jsp"/>
										</c:if>
										<c:if test="${param.age_filter2}">
											<jsp:include page="filters/age_2.jsp"/>
										</c:if>
										<c:if test="${param.age_filter4}">
											<jsp:include page="filters/age_4.jsp"/>
										</c:if>
										<c:if test="${param.age_filter5}">
											<jsp:include page="filters/age_5.jsp"/>
										</c:if>
										<c:if test="${param.age_filter6}">
											<jsp:include page="filters/age_6.jsp"/>
										</c:if>
										<c:if test="${param.age_filter7}">
											<jsp:include page="filters/age_7.jsp"/>
										</c:if>
										<c:if test="${param.age_filter10}">
											<jsp:include page="filters/age_10.jsp"/>
										</c:if>
										<c:if test="${param.age_filterpeds}">
											<jsp:include page="filters/age_peds.jsp"/>
										</c:if>
										<c:if test="${param.age_filterpeds2}">
											<jsp:include page="filters/age_peds2.jsp"/>
										</c:if>
										<c:if test="${param.age_filterall}">
											<jsp:include page="filters/age_all.jsp"/>
										</c:if>
										<c:if test="${param.age_filterall2}">
											<jsp:include page="filters/age_all2.jsp"/>
										</c:if>
										<c:if test="${param.race_filter}">
											<jsp:include page="filters/race.jsp"/>
										</c:if>
										<c:if test="${param.gender_filter}">
											<jsp:include page="filters/gender.jsp"/>
										</c:if>
										<c:if test="${param.gender_filter3}">
											<jsp:include page="filters/gender3.jsp"/>
										</c:if>
										<c:if test="${param.ethnicity_filter}">
											<jsp:include page="filters/ethnicity.jsp"/>
										</c:if>
										<c:if test="${param.observation_filter}">
											<jsp:include page="filters/observation.jsp"/>
										</c:if>
										<c:if test="${param.symptom_filter}">
											<jsp:include page="filters/symptom.jsp"/>
										</c:if>
										<c:if test="${param.vaccinated_filter}">
											<jsp:include page="filters/vaccinated.jsp"/>
										</c:if>
										<c:if test="${param.vaccinated_filter2}">
											<jsp:include page="filters/vaccinated2.jsp"/>
										</c:if>
										<c:if test="${param.comorbidities_filter}">
											<jsp:include page="filters/comorbidities.jsp"/>
										</c:if>
										<c:if test="${param.beforeafter_filter}">
											<jsp:include page="filters/beforeafter.jsp"/>
										</c:if>
										<c:if test="${param.beforeaftersotrovimab_filter}">
											<jsp:include page="filters/beforeafter_sotrovimab.jsp"/>
										</c:if>
										<c:if test="${param.result_filter}">
											<jsp:include page="filters/result.jsp"/>
										</c:if>
										<c:if test="${param.delay_filter}">
											<jsp:include page="filters/death_delay.jsp"/>
										</c:if>
										<c:if test="${param.diagnosis_filter}">
											<jsp:include page="filters/diagnosis.jsp"/>
										</c:if>
										<c:if test="${param.comorbiditynumber_filter}">
											<jsp:include page="filters/comorbidity_number.jsp"/>
										</c:if>
										<c:if test="${param.sotrovimabmeds_filter}">
											<jsp:include page="filters/sotrovimab_meds.jsp"/>
										</c:if>
									</div>
			  					</div>
							</div>
						</div>
					</c:if>
					
				</div>
				
				<c:if test="${not empty param.simple_panel}">
					<div id="${param.block}-simple" class="" style="display: block;">
						<jsp:include page="${param.simple_panel}?panel=${param.simple_panel}&block=${param.block}&datatable_div=${param.datatable_div}&topic_description=${param.topic_description}"/>
					</div>
				</c:if>
				<c:if test="${not empty param.severity_panel}">
					<div id="${param.block}-severity" class="" style="display: none;" src="${param.severity_panel}?panel=${param.severity_panel}&block=${param.block}&datatable_div=${param.datatable_div}<c:if test="${not empty param.severity_labelwidth}">&label_width=${param.severity_labelwidth}</c:if><c:if test="${not empty param.severity_height}">&viz_height=${param.severity_height}</c:if><c:if test="${not empty param.topic_description}">&topic_description=${param.topic_description}</c:if>">
					</div>
				</c:if>
				<c:if test="${not empty param.age_panel}">
					<div id="${param.block}-age" class="" style="display: none;" src="${param.age_panel}?panel=${param.age_panel}&block=${param.block}&datatable_div=${param.datatable_div}<c:if test="${not empty param.symptom}">&symptom=${param.symptom}</c:if><c:if test="${not empty param.age_labelwidth}">&label_width=${param.age_labelwidth}</c:if><c:if test="${not empty param.age_height}">&viz_height=${param.age_height}</c:if><c:if test="${not empty param.topic_description}">&topic_description=${param.topic_description}</c:if>">
					</div>
				</c:if>
				<c:if test="${not empty param.race_panel}">
					<div id="${param.block}-race" class="" style="display: none;" src="${param.race_panel}?panel=${param.race_panel}&block=${param.block}&datatable_div=${param.datatable_div}<c:if test="${not empty param.symptom}">&symptom=${param.symptom}</c:if><c:if test="${not empty param.race_labelwidth}">&label_width=${param.race_labelwidth}</c:if><c:if test="${not empty param.race_height}">&viz_height=${param.race_height}</c:if><c:if test="${not empty param.topic_description}">&topic_description=${param.topic_description}</c:if>">
					</div>
				</c:if>
				<c:if test="${not empty param.gender_panel}">
					<div id="${param.block}-gender" class="" style="display: none;" src="${param.gender_panel}?panel=${param.gender_panel}&block=${param.block}&datatable_div=${param.datatable_div}<c:if test="${not empty param.symptom}">&symptom=${param.symptom}</c:if><c:if test="${not empty param.gender_labelwidth}">&label_width=${param.gender_labelwidth}</c:if><c:if test="${not empty param.gender_height}">&viz_height=${param.gender_height}</c:if><c:if test="${not empty param.topic_description}">&topic_description=${param.topic_description}</c:if>">
					</div>
				</c:if>
				<c:if test="${not empty param.ethnicity_panel}">
					<div id="${param.block}-ethnicity" class="" style="display: none;" src="${param.ethnicity_panel}?panel=${param.ethnicity_panel}&block=${param.block}&datatable_div=${param.datatable_div}<c:if test="${not empty param.symptom}">&symptom=${param.symptom}</c:if><c:if test="${not empty param.ethnicity_labelwidth}">&label_width=${param.ethnicity_labelwidth}</c:if><c:if test="${not empty param.ethnicity_height}">&viz_height=${param.ethnicity_height}</c:if><c:if test="${not empty param.topic_description}">&topic_description=${param.topic_description}</c:if>">
					</div>
				</c:if>
				<c:if test="${not empty param.raceseverity_panel}">
					<div id="${param.block}-raceseverity" class="" style="display: none;" src="${param.raceseverity_panel}?panel=${param.raceseverity_panel}&block=${param.block}&datatable_div=${param.datatable_div}<c:if test="${not empty param.raceseverity_labelwidth}">&label_width=${param.raceseverity_labelwidth}</c:if><c:if test="${not empty param.raceseverity_height}">&viz_height=${param.raceseverity_height}</c:if><c:if test="${not empty param.topic_description}">&topic_description=${param.topic_description}</c:if>">
					</div>
				</c:if>
				<c:if test="${not empty param.comorbidity_panel}">
					<div id="${param.block}-comorbidity" class="" style="display: none;" src="${param.comorbidity_panel}?panel=${param.comorbidity_panel}&block=${param.block}&datatable_div=${param.datatable_div}<c:if test="${not empty param.comorbidity_labelwidth}">&label_width=${param.comorbidity_labelwidth}</c:if><c:if test="${not empty param.comorbidity_height}">&viz_height=${param.comorbidity_height}</c:if><c:if test="${not empty param.topic_description}">&topic_description=${param.topic_description}</c:if>">
					</div>
				</c:if>
				<c:if test="${not empty param.sotrovimab_panel1}">
					<div id="${param.block}-sotrovimab1" class="" style="display: none;" src="${param.sotrovimab_panel1}?panel=${param.sotrovimab_panel1}&block=${param.block}&datatable_div=${param.datatable_div}<c:if test="${not empty param.topic_description}">&topic_description=${param.topic_description}</c:if>">
					</div>
				</c:if>
				<c:if test="${not empty param.sotrovimab_panel2}">
					<div id="${param.block}-sotrovimab2" class="" style="display: none;" src="${param.sotrovimab_panel2}?panel=${param.sotrovimab_panel2}&block=${param.block}&datatable_div=${param.datatable_div}<c:if test="${not empty param.topic_description}">&topic_description=${param.topic_description}</c:if>">
					</div>
				</c:if>
			</div>
		</div>
		
		<div class="row">
			<c:if test="${not empty param.datatable}">
					<div class="col-12 ">
						<div class="block_header"></div>
						<div class="row">
							<div class="col-12 dash-dt-section" id="${param.datatable_div}"></div>
							<jsp:include page="${param.datatable}">
								<jsp:param name="feed" value="${param.datatable_feed}"/>
								<jsp:param name="target_div" value="${param.datatable_div}"/>
								<jsp:param name="target_kpis" value="${param.datatable_kpis}"/>
								<jsp:param name="target_kpis2" value="${param.datatable_kpis2}"/>
								<jsp:param name="target_filtered_kpis" value="${param.datatable_filtered_kpis}"/>
								<jsp:param name="block" value="${param.block}"/>
							</jsp:include>
						</div>
					</div>
				</c:if>
		</div>
	</div>
</div>			

<script>
	$(document).ready(function() {
	    $('#${param.block}toggle_viz_select').select2({
	    	minimumResultsForSearch: Infinity,
    		templateResult: function(option) {
    		      if(option.element && (option.element).hasAttribute('hidden')){
    		         return null;
    		      }
    		      return option.text;
    		   }
	    });
	})
	
	$('#${param.block}dropdownMenuButton').on('click', function() {
		$("#${param.block}filter_options_drop").toggleClass('show');
		$(this).toggleClass('show_filt hide_filt');
	});
	

	function ${param.block}_viz_constrain(element, elementParent) {
		console.log("element", element);
		console.log("parent", elementParent);
		
		var options = $("#${param.block}-"+elementParent.toLowerCase()+"-select");
        var selected = [];
        
        $(options).each(function(){
            selected.push($(this).val());
        });
	        
        console.log("selected", selected);
		if (selected[0].includes( element.secondary_name)){
			$("#${param.block}-"+elementParent.toLowerCase()+"-select").multiselect('deselect', $("#${param.block}-"+elementParent.toLowerCase()+"-select option[value='" + element.secondary_name + "']").val(), true);
		} else {
			$("#${param.block}-"+elementParent.toLowerCase()+"-select").multiselect('select', $("#${param.block}-"+elementParent.toLowerCase()+"-select option[value='" + element.secondary_name + "']").val(), true);
		}
	}

	function ${param.block}_constrain(filter, selection) {
		var selected = selection;
		if (selected != undefined && selected.length > 0){
			var values = selected.split("|");
			var text = "";
			for (let i = 0; i < values.length; ++i) {
				var clean_text = values[i].replace("+", "\\+");

				if (i < (values.length-1)){
		    		search = "^" + clean_text + "$|";
				} else {
					search = "^" + clean_text + "$";
				}
		    	text = text.concat(search);
			}
			selected = text;
		}else{
			selected = '';
		}
		${param.block}_constrain_table(filter, selected);
	}


	$(document).ready(function() {   
		
		$('#${param.block}-severity-select').multiselect({	
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-severity-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
		        
				${param.block}_constrain("severity",  selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
		$('#${param.block}-age-select').multiselect({
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-age-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
		        
				${param.block}_constrain("age",  selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
		$('#${param.block}-race-select').multiselect({
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-race-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
		        
				${param.block}_constrain("race",  selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
		$('#${param.block}-gender-select').multiselect({	
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-gender-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
		        
				${param.block}_constrain("gender",  selected[0].join('|'));
			    ${param.block}_refreshHistograms();

            }
		});
		$('#${param.block}-ethnicity-select').multiselect({	
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-ethnicity-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
		        
				${param.block}_constrain("ethnicity",  selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
		
		
		$('#${param.block}-symptom-select').multiselect({	
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-symptom-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
		        
				${param.block}_constrain("symptom",  selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
		
		$('#${param.block}-vaccinated-select').multiselect({
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-vaccinated-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
		        
				${param.block}_constrain("vaccinated", selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
		
		$('#${param.block}-vaccinationstatus-select').multiselect({
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-vaccinationstatus-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
		        
				${param.block}_constrain("vaccinated", selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
		
		$('#${param.block}-comorbidities-select').multiselect({	
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-comorbidities-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
				${param.block}_constrain("comorbidities",  selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
		
		$('#${param.block}-symptomoccurrence-select').multiselect({	
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-symptomoccurrence-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
				${param.block}_constrain("beforeafter",  selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
	
		$('#${param.block}-testresult-select').multiselect({	
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-testresult-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
				${param.block}_constrain("result",  selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
	
		$('#${param.block}-delay-select').multiselect({	
			maxHeight: 300,
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-delay-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
				${param.block}_constrain("delay",  selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
		
		$('#${param.block}-sotrovimaboccurrence-select').multiselect({	
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-sotrovimaboccurrence-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
				${param.block}_constrain("sotrovimaboccurrence",  selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
		
		$('#${param.block}-diagnosis-select').multiselect({	
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-diagnosis-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
				${param.block}_constrain("diagnosis_type",  selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
		
		$('#${param.block}-numberofcomorbidities-select').multiselect({	
			maxHeight: 300,
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-numberofcomorbidities-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
				${param.block}_constrain("comorbidity_number",  selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
		$('#${param.block}-othermeds-select').multiselect({	
			maxHeight: 300,
			numberDisplayed: 1,
			onChange: function(option, checked, select) {
				var options = $('#${param.block}-othermeds-select');
		        var selected = [];
		        $(options).each(function(){
		            selected.push($(this).val());
		        });
				${param.block}_constrain("medications",  selected[0].join('|'));
			    ${param.block}_refreshHistograms();
            }
		});
	
		var mut = new MutationObserver(function(mutations, mut){
			if($('#${param.block}-block-kpi').find('.multiselect.dropdown-toggle[title!="None selected"]').length !== 0){
				$('#${param.block}_btn_clear').removeClass("no_clear");
				$('#${param.block}_btn_clear').addClass("show_clear");
			} else if ($('#${param.datatable_div}-table').DataTable().search().length > 0){
				// leave things alone, there's an active search
				console.log("active search box", $('#${param.datatable_div}-table').DataTable().search())
			} else {
				$('#${param.block}_btn_clear').removeClass("show_clear");
				$('#${param.block}_btn_clear').addClass("no_clear");
			}
		});
		$( "#${param.block}-block-kpi .multiselect").each(function() {
			mut.observe(this,{
				'attributes': true,
				attributeFilter: ['title']
			});
		});
	});

	function ${param.block}_filter_clear() {
		
		$('#${param.block}_table_clear').removeClass("show_clear");
		$('#${param.block}_table_clear').addClass("no_clear");

		<c:if test="${param.severity_filter}">
			$('#${param.block}-severity-select').multiselect('clearSelection');
			${param.block}_constrain("severity", '');
		</c:if>
		<c:if test="${param.age_filter || param.age_filter2 || param.age_filter4 || param.age_filter5 || param.age_filter6 || param.age_filter7 || param.age_filter10 || param.age_filterpeds || param.age_filterpeds2 || param.age_filterall || param.age_filterall2}">
			$('#${param.block}-age-select').multiselect('clearSelection');
			${param.block}_constrain("age", '');
		</c:if>
		<c:if test="${param.race_filter}">
			$('#${param.block}-race-select').multiselect('clearSelection');
			${param.block}_constrain("race", '');
		</c:if>
		<c:if test="${param.gender_filter3 || param.gender_filter}">
			$('#${param.block}-gender-select').multiselect('clearSelection');
			${param.block}_constrain("gender", '');
		</c:if>
		<c:if test="${param.ethnicity_filter}">
			$('#${param.block}-ethnicity-select').multiselect('clearSelection');
			${param.block}_constrain("ethnicity", '');
		</c:if>
		<c:if test="${param.symptom_filter}">
			$('#${param.block}-symptom-select').multiselect('clearSelection');
			${param.block}_constrain("symptom", '');
		</c:if>
		<c:if test="${param.vaccinated_filter}">
			$('#${param.block}-vaccinated-select').multiselect('clearSelection');
			${param.block}_constrain("vaccinated", '');
		</c:if>
		<c:if test="${param.vaccinated_filter2}">
			$('#${param.block}-vaccinationstatus-select').multiselect('clearSelection');
			${param.block}_constrain("vaccinated", '');
		</c:if>
		<c:if test="${param.comorbidities_filter}">
			$('#${param.block}-comorbidities-select').multiselect('clearSelection');
			${param.block}_constrain("comorbidities", '');
		</c:if>
		<c:if test="${param.beforeafter_filter}">
			$('#${param.block}-symptomoccurrence-select').multiselect('clearSelection');
			${param.block}_constrain("beforeafter", '');
		</c:if>
		<c:if test="${param.beforeaftersotrovimab_filter}">
			$('#${param.block}-sotrovimaboccurrence-select').multiselect('clearSelection');
			${param.block}_constrain("sotrovimaboccurrence", '');
		</c:if>
		<c:if test="${param.result_filter}">
			$('#${param.block}-testresult-select').multiselect('clearSelection');
			${param.block}_constrain("result", '');
		</c:if>
		<c:if test="${param.delay_filter}">
			$('#${param.block}-delay-select').multiselect('clearSelection');
			${param.block}_constrain("delay", '');
		</c:if>
		<c:if test="${param.diagnosis_filter}">
			$('#${param.block}-diagnosis-select').multiselect('clearSelection');
			${param.block}_constrain("diagnosis_type", '');
		</c:if>
		<c:if test="${param.comorbiditynumber_filter}">
			$('#${param.block}-numberofcomorbidities-select').multiselect('clearSelection');
			${param.block}_constrain("comorbidity_number", '');
		</c:if>
		<c:if test="${param.sotrovimabmeds_filter}">
			$('#${param.block}-othermeds-select').multiselect('clearSelection');
			${param.block}_constrain("medications", '');
		</c:if>

		
		
		$("#${param.datatable_div}-table").DataTable().search('');
		$("#${param.datatable_div}-table").DataTable().columns().search('').draw();
	    ${param.block}_refreshHistograms();
	}
	
	var ${param.block}_AgeArray = new Array();
	var ${param.block}_RaceArray = new Array();
	var ${param.block}_EthnicityArray = new Array();
	var ${param.block}_GenderArray = new Array();
	var ${param.block}_SeverityArray = new Array();
	var ${param.block}_DelayArray = new Array();
	
	var ${param.block}_raceSeverityArray = new Array();
	var ${param.block}_diagnosisSeverityArray = new Array();
	var ${param.block}_comorbiditySeverityArray = new Array();
	var ${param.block}_vaccinatedSeverityArray = new Array();
	var ${param.block}_medsSeverityArray = new Array();
	var ${param.block}_sotrovimabMedsArray = new Array();
	
	var ${param.block}_comorbidityArray = new Array();
	
	var ${param.block}_BeforeAfterArray = new Array();

	var ${param.block}_GenderSeverityArray = new Array();
	var ${param.block}_SeverityGenderArray = new Array();
	
	var ${param.block}_ObservationAgeArray = new Array();
	var ${param.block}_ObservationGenderArray = new Array();
	var ${param.block}_ObservationRaceArray = new Array();
	var ${param.block}_IbservationEthnicityArray = new Array();
	
	var ${param.block}_SymptomAgeArray = new Array();
	var ${param.block}_SymptomGenderArray = new Array();
	var ${param.block}_SymptomRaceArray = new Array();
	var ${param.block}_SymptomEthnicityArray = new Array();
	var ${param.block}_SymptomObservationArray = new Array();
	

	var ${param.block}_MedicationArray = new Array();
	var ${param.block}_DiabetesArray = new Array();

	var ${param.block}_AgeGenderArray = new Array();
	var ${param.block}_GenderAgeArray = new Array();

	var ${param.block}_SeverityStatusArray = new Array();
	var ${param.block}_AgeStatusArray = new Array();
	var ${param.block}_RaceStatusArray = new Array();
	var ${param.block}_GenderStatusArray = new Array();

	var ${param.block}_AgeResultArray = new Array();
	var ${param.block}_GenderResultArray = new Array();
	var ${param.block}_RaceResultArray = new Array();
	var ${param.block}_EthnicityResultArray = new Array();
	var ${param.block}_CategoryResultArray = new Array();

	function ${param.block}_refreshHistograms(just_viz) {
	    if (typeof just_viz === 'undefined'){
	    	var data = $("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data().toArray();
	 	    var data2 = $("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data();
	 	    
	    	${param.block}_refreshAgeArray(data);
	    	${param.block}_refreshRaceArray(data);
	    	${param.block}_refreshEthnicityArray(data);
	    	${param.block}_refreshGenderArray(data);
	    	${param.block}_refreshSeverityArray(data);
	    	${param.block}_refreshDelayArray(data);
	    
	    	${param.block}_refreshraceSeverityArray(data);
	    	${param.block}_refreshdiagnosisSeverityArray(data);
	    	${param.block}_refreshcomorbiditySeverityArray(data);
	    	${param.block}_refreshvaccinatedSeverityArray(data);
	    	${param.block}_refreshmedsSeverityArray(data);
	    	${param.block}_refreshsotrovimabMedsArray(data);
	    	
	    	

	    	${param.block}_refreshcomorbidityArray(data);
	    
	    	${param.block}_refreshBeforeAfterArray(data);
	    
	    	${param.block}_refreshGenderSeverityArray(data);
	    	${param.block}_refreshSeverityGenderArray(data);
	    	${param.block}_refreshObservationAgeArray(data);
	    	${param.block}_refreshObservationGenderArray(data);
	    	${param.block}_refreshObservationRaceArray(data);
	    	${param.block}_refreshObservationEthnicityArray(data);

	    	${param.block}_refreshSymptomAgeArray(data);
	    	${param.block}_refreshSymptomGenderArray(data);
	    	${param.block}_refreshSymptomRaceArray(data);
	    	${param.block}_refreshSymptomEthnicityArray(data);
	    	${param.block}_refreshSymptomObservationArray(data);
	    
	    	${param.block}_refreshMedicationArray(data2);
	    	${param.block}_refreshDiabetesArray(data2);
	    
	    	${param.block}_refreshAgeGenderArray(data2);
	    	${param.block}_refreshGenderAgeArray(data2);
	    
	    	${param.block}_refreshSeverityStatusArray(data);
	    	${param.block}_refreshAgeStatusArray(data);
	    	${param.block}_refreshRaceStatusArray(data);
	    	${param.block}_refreshGenderStatusArray(data);
	    
	    	${param.block}_refreshAgeResultArray(data);
	    	${param.block}_refreshGenderResultArray(data);
	    	${param.block}_refreshRaceResultArray(data);
	    	${param.block}_refreshEthnicityResultArray(data);
	    	${param.block}_refreshCategoryResultArray(data);
	    };
	    
	    if ('${param.block}' === 'long_covid_6') {
	    	${param.block}_before_refresh();
	    }
	    if (${param.block}_loaded("severity")) {
	    	${param.block}_severity_refresh();
	    }
	    if (${param.block}_loaded("age")) {
	    	${param.block}_age_refresh();
	    }
	    if (${param.block}_loaded("race")) {
	    	${param.block}_race_refresh();
	    }
	    if (${param.block}_loaded("gender")) {
	    	${param.block}_gender_refresh();
	    }
	    if (${param.block}_loaded("ethnicity")) {
	    	${param.block}_ethnicity_refresh();
	    }
	    if ('${param.block}' === "medications_1") {
	    	${param.block}_medication_refresh();
	    }
	    if (${param.block}_loaded("raceseverity")) {
	    	${param.block}_raceseverity_refresh();
	    }
	    if (${param.block}_loaded("comorbidity")) {
	    	${param.block}_comorbidity_refresh();
	    }  
	    if (${param.block}_loaded("result")) {
	    	${param.block}_result_refresh();
	    }  
	    if ('${param.block}' === 'paxlovid_3') {
	    	${param.block}_visits_refresh();
	    }
	    if ('${param.block}' === 'mortality_2') {
	    	${param.block}_delay_refresh();
	    }
	    if ('${param.block}' === 'med_snap_2') {
	    	${param.block}_severitydiagnosis_refresh();
	    }
	    if ('${param.block}' === 'med_snap_4') {
	    	${param.block}_severitycomorbidity_refresh();
	    }
	    if ('${param.block}' === 'med_snap_5') {
	    	${param.block}_severityvaccinated_refresh();
	    }
	    if (${param.block}_loaded("sotrovimab1")) {
	    	${param.block}_sotrovimab1_refresh();
	    }
	    if (${param.block}_loaded("sotrovimab2")) {
	    	${param.block}_sotrovimab2_refresh();
	    }
	    if ('${param.block}' === "diabetes_1" || '${param.block}' === "diabetes_2") {
	    	${param.block}_refresh();
	    }
	  }
	
	function ${param.block}_toggle(selection) {
		if (selection == "severity") {
			$("#${param.block}-severity").css('display', 'block');
			$("#${param.block}-age").css('display', 'none');
			$("#${param.block}-race").css('display', 'none');
			$("#${param.block}-gender").css('display', 'none');
			$("#${param.block}-ethnicity").css('display', 'none');
			$("#${param.block}-raceseverity").css('display', 'none');
			$("#${param.block}-comorbidity").css('display', 'none');
//			cache_browser_history("admin", "admin/institutions")
		}
		if (selection == "age") {
			$("#${param.block}-severity").css('display', 'none');
			$("#${param.block}-age").css('display', 'block');
			$("#${param.block}-race").css('display', 'none');
			$("#${param.block}-gender").css('display', 'none');
			$("#${param.block}-ethnicity").css('display', 'none');
			$("#${param.block}-raceseverity").css('display', 'none');
			$("#${param.block}-comorbidity").css('display', 'none');
//			cache_browser_history("admin", "admin/institutions")
		}
		if (selection == "race") {
			$("#${param.block}-severity").css('display', 'none');
			$("#${param.block}-age").css('display', 'none');
			$("#${param.block}-race").css('display', 'block');
			$("#${param.block}-gender").css('display', 'none');
			$("#${param.block}-ethnicity").css('display', 'none');
			$("#${param.block}-raceseverity").css('display', 'none');
			$("#${param.block}-comorbidity").css('display', 'none');
//			cache_browser_history("admin", "admin/institutions")
		}
		if (selection == "gender") {
			$("#${param.block}-severity").css('display', 'none');
			$("#${param.block}-age").css('display', 'none');
			$("#${param.block}-race").css('display', 'none');
			$("#${param.block}-gender").css('display', 'block');
			$("#${param.block}-ethnicity").css('display', 'none');
			$("#${param.block}-raceseverity").css('display', 'none');
			$("#${param.block}-comorbidity").css('display', 'none');
//			cache_browser_history("admin", "admin/institutions")
		}
		if (selection == "ethnicity") {
			$("#${param.block}-severity").css('display', 'none');
			$("#${param.block}-age").css('display', 'none');
			$("#${param.block}-race").css('display', 'none');
			$("#${param.block}-gender").css('display', 'none');
			$("#${param.block}-ethnicity").css('display', 'block');
			$("#${param.block}-raceseverity").css('display', 'none');
			$("#${param.block}-comorbidity").css('display', 'none');
//			cache_browser_history("admin", "admin/institutions")
		}
		if (selection == "raceseverity") {
			$("#${param.block}-severity").css('display', 'none');
			$("#${param.block}-age").css('display', 'none');
			$("#${param.block}-race").css('display', 'none');
			$("#${param.block}-gender").css('display', 'none');
			$("#${param.block}-ethnicity").css('display', 'none');
			$("#${param.block}-raceseverity").css('display', 'block');
			$("#${param.block}-comorbidity").css('display', 'none');
//			cache_browser_history("admin", "admin/institutions")
		}
		if (selection == "comorbidity") {
			$("#${param.block}-severity").css('display', 'none');
			$("#${param.block}-age").css('display', 'none');
			$("#${param.block}-race").css('display', 'none');
			$("#${param.block}-gender").css('display', 'none');
			$("#${param.block}-ethnicity").css('display', 'none');
			$("#${param.block}-raceseverity").css('display', 'none');
			$("#${param.block}-comorbidity").css('display', 'block');
//			cache_browser_history("admin", "admin/institutions")
		}
		
		if (selection == "sotrovimab1") {
			$("#${param.block}-sotrovimab2").css('display', 'none');
			$("#${param.block}-sotrovimab1").css('display', 'block');
		}
		
		if (selection == "sotrovimab2") {
			$("#${param.block}-sotrovimab1").css('display', 'none');
			$("#${param.block}-sotrovimab2").css('display', 'block');
		}
		
		${param.block}_load(selection);
	}
	
	$(document).ready(function () {
		  $('#${param.block}toggle_viz_select').change(function () {
			${param.block}_toggle($(this).val());
			// wait for a little bit for new page to load so dropdown doesn't throw error about function not defined
			function stateChange(newState) {
			    setTimeout(function () {
			        	${param.block}_refreshHistograms('just_viz');
			    }, 50);
			}
			stateChange();
		  })
		  
	});

	// manage incremental loading of panels on inner nav bar clicks
	//
	var ${param.block}_crumbs = [];
	
	function ${param.block}_load(selection) {
		var $this = $("#${param.block}-"+selection);
		var which = $this.attr('src');

		//console.log("in main click", "${param.block}-"+selection, "which", which)
		if (!${param.block}_crumbs.includes(selection)) {
			$this.load("<util:applicationRoot/>/new_ph/"+which);
			${param.block}_crumbs.push(selection);
		}
	};
	
	function ${param.block}_loaded(selection) {
		return ${param.block}_crumbs.includes(selection);
	}
</script>

<jsp:include page="singleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="AgeArray"/>
	<jsp:param name="primary" value="age"/>
</jsp:include>

<jsp:include page="singleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="RaceArray"/>
	<jsp:param name="primary" value="race"/>
</jsp:include>

<jsp:include page="singleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="GenderArray"/>
	<jsp:param name="primary" value="gender"/>
</jsp:include>

<jsp:include page="singleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="EthnicityArray"/>
	<jsp:param name="primary" value="ethnicity"/>
</jsp:include>

<jsp:include page="singleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SeverityArray"/>
	<jsp:param name="primary" value="severity"/>
</jsp:include>

<jsp:include page="singleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="DelayArray"/>
	<jsp:param name="primary" value="datediff_bw_death_and_hos"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="BeforeAfterArray"/>
	<jsp:param name="primary" value="symptom"/>
	<jsp:param name="secondary" value="condition_after_covid_positive"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="raceSeverityArray"/>
	<jsp:param name="primary" value="race"/>
	<jsp:param name="secondary" value="severity"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="diagnosisSeverityArray"/>
	<jsp:param name="primary" value="severity"/>
	<jsp:param name="secondary" value="diagnosis"/>
</jsp:include>


<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="comorbiditySeverityArray"/>
	<jsp:param name="primary" value="severity"/>
	<jsp:param name="secondary" value="numberofcomorbidities"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="medsSeverityArray"/>
	<jsp:param name="primary" value="severity"/>
	<jsp:param name="secondary" value="sotrovimaboccurrence"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="sotrovimabMedsArray"/>
	<jsp:param name="primary" value="medications"/>
	<jsp:param name="secondary" value="sotrovimaboccurrence"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="vaccinatedSeverityArray"/>
	<jsp:param name="primary" value="severity"/>
	<jsp:param name="secondary" value="vaccinated"/>
</jsp:include>

<jsp:include page="singleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="comorbidityArray"/>
	<jsp:param name="primary" value="comorbidity"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="GenderSeverityArray"/>
	<jsp:param name="primary" value="gender"/>
	<jsp:param name="primary_abbrev" value="gender_abbrev"/>
	<jsp:param name="secondary" value="severity"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SeverityGenderArray"/>
	<jsp:param name="primary" value="severity"/>
	<jsp:param name="primary_abbrev" value="severity_abbrev"/>
	<jsp:param name="secondary" value="gender"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="ObservationAgeArray"/>
	<jsp:param name="primary" value="observation"/>
	<jsp:param name="secondary" value="age"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="ObservationGenderArray"/>
	<jsp:param name="primary" value="observation"/>
	<jsp:param name="secondary" value="gender"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="ObservationRaceArray"/>
	<jsp:param name="primary" value="observation"/>
	<jsp:param name="secondary" value="race"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="ObservationEthnicityArray"/>
	<jsp:param name="primary" value="observation"/>
	<jsp:param name="secondary" value="ethnicity"/>
</jsp:include>


<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SymptomAgeArray"/>
	<jsp:param name="primary" value="symptom"/>
	<jsp:param name="secondary" value="age"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SymptomGenderArray"/>
	<jsp:param name="primary" value="symptom"/>
	<jsp:param name="secondary" value="gender"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SymptomRaceArray"/>
	<jsp:param name="primary" value="symptom"/>
	<jsp:param name="secondary" value="race"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SymptomEthnicityArray"/>
	<jsp:param name="primary" value="symptom"/>
	<jsp:param name="secondary" value="ethnicity"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SymptomObservationArray"/>
	<jsp:param name="primary" value="symptom"/>
	<jsp:param name="secondary" value="observation"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="AgeResultArray"/>
	<jsp:param name="primary" value="age"/>
	<jsp:param name="secondary" value="result"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="GenderResultArray"/>
	<jsp:param name="primary" value="gender"/>
	<jsp:param name="secondary" value="result"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="RaceResultArray"/>
	<jsp:param name="primary" value="race"/>
	<jsp:param name="secondary" value="result"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="EthnicityResultArray"/>
	<jsp:param name="primary" value="ethnicity"/>
	<jsp:param name="secondary" value="result"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="CategoryResultArray"/>
	<jsp:param name="primary" value="category"/>
	<jsp:param name="secondary" value="result"/>
</jsp:include>

<jsp:include page="tripleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="MedicationArray"/>
	<jsp:param name="wrap" value="no"/>
	<jsp:param name="primary" value="drug_domain"/>
	<jsp:param name="secondary" value="concept_set_name"/>
	<jsp:param name="tertiary" value="age"/>
</jsp:include>

<jsp:include page="tripleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="DiabetesArray"/>
	<jsp:param name="primary" value="observation"/>
	<jsp:param name="secondary" value="gender"/>
	<jsp:param name="tertiary" value="age"/>
</jsp:include>

<jsp:include page="tripleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="AgeGenderArray"/>
	<jsp:param name="wrap" value="no"/>
	<jsp:param name="primary" value="observation"/>
	<jsp:param name="secondary" value="age"/>
	<jsp:param name="tertiary" value="gender"/>
</jsp:include>

<jsp:include page="tripleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="GenderAgeArray"/>
	<jsp:param name="wrap" value="no"/>
	<jsp:param name="primary" value="observation"/>
	<jsp:param name="secondary" value="gender"/>
	<jsp:param name="tertiary" value="age"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="SeverityStatusArray"/>
	<jsp:param name="primary" value="severity"/>
	<jsp:param name="secondary" value="smoking_status"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="AgeStatusArray"/>
	<jsp:param name="primary" value="age"/>
	<jsp:param name="secondary" value="smoking_status"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="RaceStatusArray"/>
	<jsp:param name="primary" value="race"/>
	<jsp:param name="secondary" value="smoking_status"/>
</jsp:include>

<jsp:include page="doubleHistogram.jsp">
	<jsp:param name="block" value="${param.block}"/>
	<jsp:param name="datatable_div" value="${param.datatable_div}"/>
	<jsp:param name="array" value="GenderStatusArray"/>
	<jsp:param name="primary" value="gender"/>
	<jsp:param name="secondary" value="smoking_status"/>
</jsp:include>
