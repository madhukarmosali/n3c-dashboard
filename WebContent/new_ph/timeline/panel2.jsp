<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div style="text-align:center; font-size: 1.3rem; margin-top: 40px;">
	<h3>Select a Topic to Explore:</h3>
	<select id="selectMe">
		<option value="timeline_1">Daily Patient Count & 7-day Rolling Avg.</option>
		<option value="timeline_2">Cumulative Patient Count & 7-day Rolling Avg.</option>
	</select>
</div>
<div id="frame">
	<div id="timeline_1" class="group"></div>
	<div id="timeline_2" class="group"></div>
</div>

<script>

function url_map(selection) {
	return selection.substring(selection.lastIndexOf("_")+1);
}

function url_unmap(selector) {
	return 'timeline_'+selector;
}

var frame_crumbs = '';

<c:choose>
	<c:when test="${empty param.quaternary_tab}">
		frame_load('timeline_1');
	</c:when>
	<c:otherwise>
		$('#selectMe').val(url_unmap('${param.quaternary_tab}'));
		frame_load(url_unmap('${param.quaternary_tab}'));
	</c:otherwise>
</c:choose>

function frame_load(selection) {
	var $this = $("#"+selection);

	if (!frame_crumbs.includes(selection)) {
		$this.load("<util:applicationRoot/>/new_ph/timeline/"+selection+".jsp");
		frame_crumbs = frame_crumbs + selection;
	}
	cache_browser_history("new-ph", "new-ph/summary/timeline/"+url_map(selection));
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