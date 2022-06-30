<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<div class="row">
Figure 1. Cumulative % of patients who have a
care visit after a 5 day Paxlovid course. Upper
Panel: 838 patients with U07.1 visits (a code indicating
the visit is COVID-related); Lower Panel: 3,676
patients with any clinical visit (i.e. those with a
diagnosis code). The figures illustrate that few patients
receiving care post-Paxlovid test positive for
COVID-19, even when their visits include a COVID-19
diagnosis (upper panel). Note that 22 Paxlovid-treated
individuals (not shown) tested positive but did not
have a subsequent visit with a diagnosis of any kind.
 
Figure 2. Heatmap showing new or continuing diagnoses
in the three-weeks post-Paxlovid. Shown are major
categories of diagnoses recorded post-Paxlovid course for
patients testing COVID positive, negative, or those with
unknown test status. Patients largely show a moderate
increase in pulmonary and urinary/kidney symptomatology for
those testing positive over those who are testing negative or
those whose testing status is unknown (which may indicate a
lack of need for clinical testing and/or evaluation).
	</div>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="paxlovid_7" />
	<jsp:param name="block_header" value="Paxlovid" />
	<jsp:param name="topic_description" value="secondary_1" />
	<jsp:param name="topic_title" value="Demographics of Patients With Paxlovid" />
	
	<jsp:param name="simple_panel" value="medication_snapshot/ethnicity.jsp" />

	<jsp:param name="datatable" value="medication_snapshot/demographics_ethnicity_table.jsp" />
	<jsp:param name="datatable_div" value="medication_snapshot_paxlovid_ethnicity" />
	<jsp:param name="datatable_feed" value="medication_snapshot/feeds/demographics_ethnicity.jsp" />
</jsp:include>

<script>
	paxlovid_7_toggle("ethnicity");
</script>
