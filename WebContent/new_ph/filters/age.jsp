<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body border">
	<h6>Age</h6>
	<select id="${param.block}-age-select" multiple="multiple">
		<option value="18-29">18-29</option>
		<option value="30-49">30-49</option>
		<option value="50-64">50-64</option>
		<option value="65+">65+</option>
	</select>
</div>
