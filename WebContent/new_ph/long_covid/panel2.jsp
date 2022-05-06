<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<select id="selectMe">
  <option value="long_covid_1">U09.9 ICD-10 Code</option>
  <option value="long_covid_2">Clinic Visit</option>
  <option value="long_covid_3">Cumulative Symptoms Summary</option>
  <option value="long_covid_4">Individual ICD-10 Symptom Grouped Counts</option>
  <option value="long_covid_5">Ungrouped ICD-10 Symptom Counts</option>
  <option value="long_covid_6">ICD-10 Symptom Counts Before/After COVID+</option>
  <option value="long_covid_7">Cognitive Impairment</option>
  <option value="long_covid_8">Fatigue</option>
  <option value="long_covid_9">Mental Health Condition</option>
  <option value="long_covid_10">Postural Orthostatic Tachycardia Symdrome (POTS)</option>
  <option value="long_covid_11">Shortness of Breath</option>
  <option value="long_covid_12">Patients That Have Not Tested Positive For COVID</option>
</select>
<div id="frame">
	<div id="long_covid_1" class="group"></div>
	<div id="long_covid_2" class="group"></div>
	<div id="long_covid_3" class="group"></div>
	<div id="long_covid_4" class="group"></div>
	<div id="long_covid_5" class="group"></div>
	<div id="long_covid_6" class="group"></div>
	<div id="long_covid_7" class="group"></div>
	<div id="long_covid_8" class="group"></div>
	<div id="long_covid_9" class="group"></div>
	<div id="long_covid_10" class="group"></div>
	<div id="long_covid_11" class="group"></div>
	<div id="long_covid_12" class="group"></div>
</div>

<script>

var frame_crumbs = '';

frame_load('long_covid_1');

function frame_load(selection) {
	var $this = $("#"+selection);
	console.log("selection", selection, frame_crumbs)

	if (!frame_crumbs.includes(selection)) {
		$this.load("<util:applicationRoot/>/new_ph/long_covid/"+selection+".jsp");
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
