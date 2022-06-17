<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div style="text-align:center; font-size: 1.3rem; margin-top: 40px;">
	<h3>Select a Topic to Explore:</h3>
	<select id="selectMe">
		<option value="reinfection_1">Cases and Reinfections per Cohort</option>
		<option value="reinfection_2">Cases and Reinfections per Day</option>
		<option value="reinfection_3">Reinfection Counts Grouped by 30 Day Increments</option>
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
	<c:when test="${empty param.quaternary_tab}">
		frame_load('reinfection_1');
	</c:when>
	<c:otherwise>
		$('#selectMe').val(url_unmap('${param.quaternary_tab}'));
		frame_load(url_unmap('${param.quaternary_tab}'));
	</c:otherwise>
</c:choose>

function frame_load(selection) {
	var $this = $("#"+selection);

	if (!frame_crumbs.includes(selection)) {
		$this.load("<util:applicationRoot/>/new_ph/reinfection/"+selection+".jsp");
		frame_crumbs = frame_crumbs + selection;
	}
	cache_browser_history("new-ph", "new-ph/summary/reinfection/"+url_map(selection));
};

	
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
    	minimumResultsForSearch: Infinity
    });
    $('#selectMe').change(function () {
		frame_load($(this).val());
	    $('.group').hide();
	    $('#'+$(this).val()).show();
	});
});

</script>