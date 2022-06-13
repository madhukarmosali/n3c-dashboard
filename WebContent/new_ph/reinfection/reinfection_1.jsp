<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="reinfection_1" />
	<jsp:param name="block_header" value="Patient Counts: First Diagnosis Versus Reinfected Patients Per COVID+ Cohort" />
	<jsp:param name="topic_description" value="secondary_1" />
	<jsp:param name="topic_title" value="Patient Counts: First Diagnosis Versus Reinfected Patients Per COVID+ Cohort" />

	<jsp:param name="kpis" value="reinfection/kpis_1.jsp" />

	<jsp:param name="simple_panel" value="reinfection/reinfections.jsp" />

	<jsp:param name="datatable" value="reinfection/reinfections_by_date.jsp" />
	<jsp:param name="datatable_div" value="reinfections-by-date1" />
	<jsp:param name="datatable_kpis" value="first_diagnosis,reinfected" />
</jsp:include>