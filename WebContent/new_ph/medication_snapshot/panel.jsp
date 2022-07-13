<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="topic_dropdown" style="text-align:center; font-size: 1.3rem;">
	<h4 class="viz_color_header">Select a Dashboard to Explore:</h4>
	<select id="selectMe">
		<optgroup label="Sotrovimab">
			<option value="med_snap_1">Treated Patient Demographics</option>
			<option value="med_snap_2">COVID Diagnosis Type and Severity</option>
			<option value="med_snap_3">Medications Taken Before and After Sotrovimab</option>
			<option value="med_snap_4">Comorbidities</option>
			<option value="med_snap_5">Vaccinations</option>
		</optgroup>
		<optgroup label="Paxlovid">
			<option value="med_snap_6">Demographics</option>
			<option value="med_snap_7">Outcomes</option>
			<option value="med_snap_8">Conditions</option>
			<option value="med_snap_9">Medications</option>
			<option value="med_snap_10">Visits</option>
		</optgroup>
	</select>
</div>
<div id="frame">
	<div id="med_snap_1" class="group"></div>
	<div id="med_snap_2" class="group"></div>
	<div id="med_snap_3" class="group"></div>
	<div id="med_snap_4" class="group"></div>
	<div id="med_snap_5" class="group"></div>
</div>

<script>

function url_map(selection) {
	return selection.substring(selection.lastIndexOf("_")+1);
}

function url_unmap(selector) {
	return 'med_snap_'+selector;
}

var frame_crumbs = [];

<c:choose>
	<c:when test="${empty param.tertiary_tab || param.tertiary_tab == 'undefined'}">
		frame_load('med_snap_1');
	</c:when>
	<c:otherwise>
		$('#selectMe').val(url_unmap('${param.tertiary_tab}'));
		frame_load(url_unmap('${param.tertiary_tab}'));
	</c:otherwise>
</c:choose>

function frame_load(selection) {
	var $this = $("#"+selection);

	if (!frame_crumbs.includes(selection)) {
		$this.load("<util:applicationRoot/>/new_ph/medication_snapshot/"+selection+".jsp");
		frame_crumbs.push(selection);
	}
	cache_browser_history("public-health", "public-health/MedicationsSnapshots/"+url_map(selection));
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