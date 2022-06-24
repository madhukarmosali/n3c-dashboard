<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_medication_viz" class="dash_viz"></div>
<p>Sample text.</p>
<script>

function ${param.block}_medication_refresh() {
	console.log("medication graph", "${param.block}_medication_viz", ${param.block}_MedicationArray);
   	d3.select("#${param.block}_medication_viz").select("svg").remove(); 
	localHorizontalGroupedStackedBarChart(${param.block}_MedicationArray,"${param.block}_medication_viz", "drug_domain", "concept_set_name", "patient_count", 'age', "Age", age_range, "Drug Class", "Medications");	
}

</script>
