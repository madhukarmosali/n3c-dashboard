<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="topic_dropdown" style="text-align:center; font-size: 1.3rem;">
	<h4 class="viz_color_header">Select a Dashboard to Explore:</h4>
	<select id="selectMe">
		<option value="long_covid_1">Long COVID Dashboard Overview</option>
		<optgroup label="Long COVID Diagnosis">
			<option value="long_covid_13">Long COVID ICD-10 Code (U09.9)</option>
			<option value="long_covid_2">Long COVID Clinic Visit</option>
		</optgroup>
		<optgroup label="Potential Long COVID Symptoms">
			<option value="long_covid_3">Cumulative Symptoms Summary</option>
			<option value="long_covid_6">ICD-10 Symptom Counts Before/After COVID+</option>
			<option value="long_covid_4">Grouped ICD-10 Symptom Counts</option>
			<option value="long_covid_5">Ungrouped ICD-10 Symptom Counts</option>
			<option value="long_covid_12">Patients That Have Not Tested Positive For COVID</option>
		</optgroup>
		<optgroup label="Individual Symptoms">
			<option value="long_covid_7">Cognitive Impairment</option>
			<option value="long_covid_8">Fatigue</option>
			<option value="long_covid_9">Mental Health Condition</option>
			<option value="long_covid_10">Postural Orthostatic Tachycardia Syndrome (POTS)</option>
			<option value="long_covid_11">Shortness of Breath</option>
		</optgroup>
	</select>
</div>
<div id="frame">
	<div id="long_covid_13" class="group"></div>
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

function url_map(selection) {
	return selection.substring(selection.lastIndexOf("_")+1);
}

function url_unmap(selector) {
	return 'long_covid_'+selector;
}

var frame_crumbs = [];

<c:choose>
	<c:when test="${empty param.tertiary_tab}">
		frame_load('long_covid_1');
	</c:when>
	<c:otherwise>
		$('#selectMe').val(url_unmap('${param.tertiary_tab}'));
		frame_load(url_unmap('${param.tertiary_tab}'));
	</c:otherwise>
</c:choose>

function frame_load(selection) {
	var $this = $("#"+selection);

	if (!frame_crumbs.includes(selection)) {
		$this.load("<util:applicationRoot/>/new_ph/long_covid/"+selection+".jsp");
		frame_crumbs.push(selection);
	}
	cache_browser_history("new-ph", "new-ph/long-covid/"+url_map(selection));
};

$(document).ready(function () {
	  $('#selectMe').change(function () {
		frame_load($(this).val());
	    $('.group').hide();
	    $('#'+$(this).val()).show();
	  })
	});
	
function modelMatcher (params, data) {
	  data.parentText = data.parentText || "";

	  // Always return the object if there is nothing to compare
	  if ($.trim(params.term) === '') {
	    return data;
	  }

	  // Do a recursive check for options with children
	  if (data.children && data.children.length > 0) {
	    // Clone the data object if there are children
	    // This is required as we modify the object to remove any non-matches
	    var match = $.extend(true, {}, data);

	    // Check each child of the option
	    for (var c = data.children.length - 1; c >= 0; c--) {
	      var child = data.children[c];
	      child.parentText += data.parentText + " " + data.text;

	      var matches = modelMatcher(params, child);

	      // If there wasn't a match, remove the object in the array
	      if (matches == null) {
	        match.children.splice(c, 1);
	      }
	    }

	    // If any children matched, return the new object
	    if (match.children.length > 0) {
	      return match;
	    }

	    // If there were no matching children, check just the plain object
	    return modelMatcher(params, match);
	  }

	  // If the typed-in term matches the text of this term, or the text from any
	  // parent term, then it's a match.
	  var original = (data.parentText + ' ' + data.text).toUpperCase();
	  var term = params.term.toUpperCase();


	  // Check if the text contains the term
	  if (original.indexOf(term) > -1) {
	    return data;
	  }

	  // If it doesn't contain the term, don't return anything
	  return null;
}

$(document).ready(function() {
    $('#selectMe').select2({
		matcher: modelMatcher,
		searchInputPlaceholder: 'Search Topics...'
    });
});

</script>
