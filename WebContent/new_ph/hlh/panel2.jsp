<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="topic_dropdown" style="text-align:center; font-size: 1.5rem;">
	<h4 class="viz_color_header">Select a Disease to Explore:</h4>
	<select id="selectMe">
		<option value="comorbidity_1">Cancer</option>
		<option value="comorbidity_2">Congestive Heart Failure</option>
		<option value="comorbidity_3">Dementia</option>
		<option value="comorbidity_4">Diabetes Mellitus</option>
		<option value="comorbidity_5">Diabetes Mellitus with Complications</option>
		<option value="comorbidity_6">HIV</option>
		<option value="comorbidity_7">HLH</option>
		<option value="comorbidity_8">Liver Disease Mild</option>
		<option value="comorbidity_9">Liver Disease Severe</option>
		<option value="comorbidity_10">Metastatis</option>
		<option value="comorbidity_11">Myocardial Infarction</option>
		<option value="comorbidity_12">Paralysis</option>
		<option value="comorbidity_13">Peptic Ulcer Disease</option>
		<option value="comorbidity_14">Peripheral Vascular Disease</option>
		<option value="comorbidity_15">Pulmonary</option>
		<option value="comorbidity_16">Renal Disease</option>
		<option value="comorbidity_17">Rheumatologic Disease</option>
		<option value="comorbidity_18">Stroke</option>
	</select>
</div>
<div id="frame">
	<div id="comorbidity_1" class="group"></div>
	<div id="comorbidity_2" class="group"></div>
	<div id="comorbidity_3" class="group"></div>
	<div id="comorbidity_4" class="group"></div>
	<div id="comorbidity_5" class="group"></div>
	<div id="comorbidity_6" class="group"></div>
	<div id="comorbidity_7" class="group"></div>
	<div id="comorbidity_8" class="group"></div>
	<div id="comorbidity_9" class="group"></div>
	<div id="comorbidity_10" class="group"></div>
	<div id="comorbidity_11" class="group"></div>
	<div id="comorbidity_12" class="group"></div>
	<div id="comorbidity_13" class="group"></div>
	<div id="comorbidity_14" class="group"></div>
	<div id="comorbidity_15" class="group"></div>
	<div id="comorbidity_16" class="group"></div>
	<div id="comorbidity_17" class="group"></div>
	<div id="comorbidity_18" class="group"></div>
</div>

<script>

function url_map(selection) {
	return selection.substring(selection.lastIndexOf("_")+1);
}

function url_unmap(selector) {
	return 'comorbidity_'+selector;
}

var frame_crumbs = [];

<c:choose>
	<c:when test="${empty param.tertiary_tab}">
		frame_load('comorbidity_1');
	</c:when>
	<c:otherwise>
		$('#selectMe').val(url_unmap('${param.tertiary_tab}'));
		frame_load(url_unmap('${param.tertiary_tab}'));
	</c:otherwise>
</c:choose>

function frame_load(selection) {
	var $this = $("#"+selection);

	if (!frame_crumbs.includes(selection)) {
		$this.load("<util:applicationRoot/>/new_ph/hlh/"+selection+".jsp");
		frame_crumbs.push(selection);
	}
	cache_browser_history("new-ph", "new-ph/hlh/"+url_map(selection));
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
