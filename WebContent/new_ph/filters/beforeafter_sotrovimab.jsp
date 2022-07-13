<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<h6>Sotrovimab Occurrence</h6>
	<select id="${param.block}-sotrovimaboccurrence-select" multiple="multiple">
			<option value="Before Other Med">Before Other Med</option>
			<option value="After Other Med">After Other Med</option>
	</select>
</div>
