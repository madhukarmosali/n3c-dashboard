<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- covid_positive_mab_demo_censored (2022-03-31 05:01) -->

<select id="selectMe">
  <option value="adult_summary_1">COVID+ Patient Demographics</option>
  <option value="adult_summary_2">Vaccination Status</option>
  <option value="adult_summary_3">Vaccination and Comorbidities</option>
  <option value="adult_summary_4">Unknown Vaccination Status and Comorbidities</option>
  <option value="adult_summary_5">Ungrouped Comorbidities</option>
</select>
<div id="frame">
	<div id="adult_summary_1" class="group"></div>
	<div id="adult_summary_2" class="group"></div>
	<div id="adult_summary_3" class="group"></div>
	<div id="adult_summary_4" class="group"></div>
	<div id="adult_summary_5" class="group"></div>
</div>

<script>

var frame_crumbs = '';

frame_load('adult_summary_1');

function frame_load(selection) {
	var $this = $("#"+selection);
	console.log("selection", selection, frame_crumbs)

	if (!frame_crumbs.includes(selection)) {
		$this.load("<util:applicationRoot/>/new_ph/adult_summary/"+selection+".jsp");
		frame_crumbs = frame_crumbs + selection;
	}
};

$(document).ready(function () {
	  $('#selectMe').change(function () {
		frame_load($(this).val());
	    $('.group').hide();
	    $('#'+$(this).val()).show();
	  })
	});

</script>
