<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<select id="selectMe">
  <option value="long_covid_1">Long COVID: U09.9 ICD-10 Code</option>
  <option value="long_covid_2">Long COVID: Clinic Visit</option>
  <option value="long_covid_3">Long COVID Cumulative Symptoms Summary (Dyspnea, Fatigue, Cognition, POTS, Mental Health)</option>
  <option value="long_covid_4">Long COVID: Individual ICD-10 Symptom Grouped Counts</option>
</select>
<div id="long_covid_1" class="group">asdf</div>
<div id="long_covid_2" class="group">kljh</div>
<div id="long_covid_3" class="group">zxcv</div>
<div id="long_covid_4" class="group">qwerty</div>

<script>
$(document).ready(function () {
	  $('.group').hide();
	  $('#long_covid_1').show();
	  $('#selectMe').change(function () {
	    $('.group').hide();
	    $('#'+$(this).val()).show();
	  })
	});
</script>
