<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block.jsp">
	<jsp:param name="block" value="reinfection_1" />
	<jsp:param name="block_header" value="Patient Counts: First Diagnosis Versus Reinfected Patients Per COVID+ Cohort" />

	<jsp:param name="kpis" value="reinfection/kpis_1.jsp?block=reinfection_1" />

	<jsp:param name="simple_panel" value="reinfection/reinfections.jsp" />

	<jsp:param name="datatable" value="reinfection/reinfections_by_date.jsp" />
	<jsp:param name="datatable_div" value="reinfections-by-date" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="reinfection_2" />
	<jsp:param name="block_header" value="Patient Counts: First Diagnosis Versus Number of Reinfections Per Day" />

	<jsp:param name="kpis" value="reinfection/kpis_2.jsp?block=reinfection_2" />

	<jsp:param name="simple_panel" value="reinfection/counts.jsp" />
</jsp:include>
