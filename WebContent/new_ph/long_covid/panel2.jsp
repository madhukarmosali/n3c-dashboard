<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div style="text-align:center; font-size: 1.3rem; margin-top: 40px;">
	<h3>Select a Topic to Explore:</h3>
	<select id="selectMe">
		<optgroup label="Long COVID Indicators">
			<option value="long_covid_1">U09.9 (Long COVID) ICD-10 Code Diagnosis</option>
			<option value="long_covid_2">Long COVID Clinic Visit</option>
		</optgroup>
		<optgroup label="Controls">
			<option value="long_covid_12">Patients That Have Not Tested Positive For COVID</option>
		</optgroup>
		<optgroup label="Key Long COVID ICD-10 Symptoms">
			<option value="long_covid_3">Symptoms vs. Long COVID & COVID+</option>
			<option value="long_covid_4">Grouped ICD-10 Symptom Counts</option>
			<option value="long_covid_5">Individual ICD-10 Symptom Counts</option>
			<option value="long_covid_6">ICD-10 Symptom Counts Before/After COVID+</option>
		</optgroup>
		<optgroup label="Individual Symptoms">
			<option value="long_covid_7">Cognitive Impairment</option>
			<option value="long_covid_8">Fatigue</option>
			<option value="long_covid_9">Mental Health Condition</option>
			<option value="long_covid_10">Postural Orthostatic Tachycardia Symdrome (POTS)</option>
			<option value="long_covid_11">Shortness of Breath</option>
		</optgroup>
	</select>
</div>
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
