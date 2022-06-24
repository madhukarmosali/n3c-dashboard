<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<c:choose>
	<c:when test="${param.block == 'peds_summary_1' }">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/peds_total_patients.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/peds_patients.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'peds_summary_2' }">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/peds_total_patients.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/peds_vaccinated.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'peds_summary_3' }">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/peds_total_patients.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/peds_vaccinated_comorbidities.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'peds_summary_4' }">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/peds_total_patients.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/peds_unknown_vaccinated.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'peds_summary_5' }">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/peds_total_patients.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/peds_ungrouped.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
	</c:when>
</c:choose>

