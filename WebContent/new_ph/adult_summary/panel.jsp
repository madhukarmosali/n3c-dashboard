<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- covid_positive_mab_demo_censored (2022-03-31 05:01) -->

<div class="topic_dropdown" style="text-align:center; font-size: 1.3rem;">
	<h4 class="viz_color_header">Select a Dashboard to Explore:</h4>
	<select id="selectMe">
		<option value="adult_summary_1">Demographics of COVID+ Patients</option>
		<optgroup label="Demographics of COVID+ Pateints Filterable By:">
		<option value="adult_summary_2">Vaccination Status</option>
  		<option value="adult_summary_3">Vaccination Status and Grouped Cormobidities</option>
  		<option value="adult_summary_4">Grouped Comorbidities</option>
  		<option value="adult_summary_5">Ungrouped Comorbidities</option>
  		</optgroup>
	</select>
</div>

<div id="frame">
	<div id="adult_summary_1" class="group"></div>
	<div id="adult_summary_2" class="group"></div>
	<div id="adult_summary_3" class="group"></div>
	<div id="adult_summary_4" class="group"></div>
	<div id="adult_summary_5" class="group"></div>
</div>

<script>
function url_map(selection) {
	return selection.substring(selection.lastIndexOf("_")+1);
}

function url_unmap(selector) {
	return 'adult_summary_'+selector;
}

var frame_crumbs = [];

<c:choose>
	<c:when test="${empty param.tertiary_tab || param.tertiary_tab == 'undefined'}">
		frame_load('adult_summary_1');
	</c:when>
	<c:otherwise>
		$('#selectMe').val(url_unmap('${param.tertiary_tab}'));
		frame_load(url_unmap('${param.tertiary_tab}'));
	</c:otherwise>
</c:choose>


function frame_load(selection) {
	var $this = $("#"+selection);

	if (!frame_crumbs.includes(selection)) {
		$this.load("<util:applicationRoot/>/new_ph/adult_summary/"+selection+".jsp");
		frame_crumbs.push(selection);
	}
	cache_browser_history("new-ph", "new-ph/summary/"+url_map(selection));
};

$(document).ready(function () {
	  $('#selectMe').change(function () {
		frame_load($(this).val());
	    $('.group').hide();
	    $('#'+$(this).val()).show();
	  })
	});
	
$(document).ready(function() {
    $('#selectMe').select2({
		searchInputPlaceholder: 'Search Topics...'
    });
});

</script>
