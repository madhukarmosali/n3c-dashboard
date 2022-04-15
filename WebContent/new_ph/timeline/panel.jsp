<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block.jsp">
	<jsp:param name="block" value="timeline_1" />
	<jsp:param name="block_header" value="COVID+ Patients: Daily Patient Counts and 7-Day Rolling Averages" />

	<jsp:param name="kpis" value="timeline/kpis_1.jsp?block=timeline_1" />

	<jsp:param name="simple_panel" value="timeline/daily.jsp" />

	<jsp:param name="datatable" value="timeline/positive_cases_by_date.jsp" />
	<jsp:param name="datatable_div" value="positives-by-date" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="timeline_2" />
	<jsp:param name="block_header" value="COVID+ Patients: Cumulative and 7-Day Rolling Average Counts" />

	<jsp:param name="kpis" value="timeline/kpis_2.jsp?block=timeline_2" />

	<jsp:param name="simple_panel" value="timeline/cumulative.jsp" />
</jsp:include>
