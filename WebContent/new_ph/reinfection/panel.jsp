<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- new_km_analysis (2022-03-31 04:59) -->
<!-- reinfection_leonie_requested (2022-03-31 05:00) -->

<jsp:include page="../block.jsp">
	<jsp:param name="block" value="reinfection_1" />
	<jsp:param name="block_header" value="Patient Counts: First Diagnosis Versus Reinfected Patients Per COVID+ Cohort" />

	<jsp:param name="kpis" value="reinfection/kpis_1.jsp" />

	<jsp:param name="simple_panel" value="reinfection/reinfections.jsp" />

	<jsp:param name="datatable" value="reinfection/reinfections_by_date.jsp" />
	<jsp:param name="datatable_div" value="reinfections-by-date1" />
	<jsp:param name="datatable_kpis" value="first_diagnosis,reinfected" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="reinfection_2" />
	<jsp:param name="block_header" value="Patient Counts: First Diagnosis Versus Number of Reinfections Per Day" />

	<jsp:param name="kpis" value="reinfection/kpis_2.jsp" />

	<jsp:param name="simple_panel" value="reinfection/counts.jsp" />

	<jsp:param name="datatable" value="reinfection/reinfections_by_date.jsp" />
	<jsp:param name="datatable_div" value="reinfections-by-date2" />
	<jsp:param name="datatable_kpis" value="first_diagnosis,subsequent_test" />
</jsp:include>
