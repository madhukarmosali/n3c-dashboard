<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>
#d3viz .dataTables_filter{
    display: none;
}
</style>

<div class="topic_dropdown" style="text-align:center; font-size: 1.3rem;">
	<h4 class="viz_color_header">Select a Dashboard to Explore:</h4>
	<select id="selectMe">
		<option value="reinfection_1">First Diagnosis Versus Reinfected Patients Per COVID+ Cohort</option>
		<option value="reinfection_2">First Diagnosis Versus Number of Reinfections Per Day</option>
		<option value="reinfection_3">Reinfection Counts Grouped by 30 Day Increments</option>	
		<option disabled hidden="hidden">First Diagnosis Versus Reinfected Patients Per COVID+ Cohort++++++++</option>	
	</select>
</div>
<div id="frame">
	<div id="reinfection_1" class="group"></div>
	<div id="reinfection_2" class="group"></div>
	<div id="reinfection_3" class="group"></div>
</div>

<script>



function url_map(selection) {
	return selection.substring(selection.lastIndexOf("_")+1);
}

function url_unmap(selector) {
	return 'reinfection_'+selector;
}

var frame_crumbs = '';

<c:choose>
	<c:when test="${empty param.tertiary_tab || param.tertiary_tab == 'undefined'}">
		frame_load('reinfection_1');
	</c:when>
	<c:otherwise>
		$('#selectMe').val(url_unmap('${param.tertiary_tab}'));
		frame_load(url_unmap('${param.tertiary_tab}'));
	</c:otherwise>
</c:choose>

function frame_load(selection) {
	var $this = $("#"+selection);

	if (!frame_crumbs.includes(selection)) {
		$this.load("<util:applicationRoot/>/new_ph/reinfection/"+selection+".jsp");
		frame_crumbs = frame_crumbs + selection;
	}
	cache_browser_history("public-health", "public-health/reinfection/"+url_map(selection));
};

$(document).ready(function() {
    $('#selectMe').select2({
    	minimumResultsForSearch: Infinity
    });
    $('#selectMe').change(function () {
		frame_load($(this).val());
	    $('.group').hide();
	    $('#'+$(this).val()).show();
	});
});

</script>