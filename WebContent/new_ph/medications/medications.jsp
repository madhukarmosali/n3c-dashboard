<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<c:set var="feedPath1">
	<util:applicationRoot />/new_ph/medications/feeds/medications_raw.jsp</c:set>
<div id="diabetes_type1_detail">
	<jsp:include page="../../graph_support/grouped_stacked_bar_horizontal.jsp">
		<jsp:param name="data_page" value="${feedPath1}" />
		<jsp:param name="dom_element" value="#diabetes_type1_detail" />
		<jsp:param name="namespace" value="diabetes_type1_detail" />
		<jsp:param name="primary_group" value="drug_domain" />
		<jsp:param name="secondary_group" value="concept_set_name" />
		<jsp:param name="stack_group" value="age" />
		<jsp:param name="count" value="patient_count" />
		<jsp:param name="xaxis_label" value="Patient Count" />
		<jsp:param name="legend_label" value="Age" />
	</jsp:include>
</div>
<div id="${param.block}_medication_viz" class="col-lg-10 dash_viz"></div>
<p>Sample text.</p>
<script>

function ${param.block}_medication_refresh() {
	console.log("medication graph", "${param.block}_medication_viz", ${param.block}_MedicationArray)
   	d3.select("#${param.block}_medication_viz").select("svg").remove();
	localHorizontalGroupedStackedBarChart(${param.block}_MedicationArray,"${param.block}_medication_viz", 120, age_legend, age_range);	
}

</script>
