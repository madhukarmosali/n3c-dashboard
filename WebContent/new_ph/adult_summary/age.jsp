<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_age_viz" class="col-lg-7 dash_viz"></div>
<script>

function ${param.block}_constrain_table(filter, constraint) {
	console.log("${param.block}", filter, constraint)
	switch (filter) {
	case 'severity':
	    $("#${param.datatable_div}-table").DataTable().column(0).search(constraint, true, false, true).draw();	
		break;
	case 'gender':
	    $("#${param.datatable_div}-table").DataTable().column(1).search(constraint, true, false, true).draw();	
		break;
	}
}

function ${param.block}_age_refresh() {
	console.log("age graph", "${param.block}_severity_viz", ${param.block}_AgeArray)
	d3.select("#${param.block}_age_viz").select("svg").remove();
    localPieChart(${param.block}_AgeArray,"#${param.block}_age_viz");
}

</script>
