<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<c:choose>
	<c:when test="${param.block == 'long_covid_13'}">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_icd.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'long_covid_2'}">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_concept.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'long_covid_3'}">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_icd_summary.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_tested_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_in_record.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'long_covid_4'}">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_total_grouped.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_tested_positive_grouped.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_in_record_grouped.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'long_covid_5'}">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_total_ungrouped.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_tested_positive_ungrouped.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_in_record_ungrouped.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'long_covid_6'}">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_total_before_after.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_total_before.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_total_after.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'long_covid_7'}">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_tested_positive_individual_symptom.jsp">
			<jsp:param name="block" value="${param.block}" />
			<jsp:param name="symptom" value="${param.symptom}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_in_record_individual_symptom.jsp">
			<jsp:param name="block" value="${param.block}" />
			<jsp:param name="symptom" value="${param.symptom}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'long_covid_8'}">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_tested_positive_individual_symptom.jsp">
			<jsp:param name="block" value="${param.block}" />
			<jsp:param name="symptom" value="${param.symptom}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_in_record_individual_symptom.jsp">
			<jsp:param name="block" value="${param.block}" />
			<jsp:param name="symptom" value="${param.symptom}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'long_covid_9'}">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_tested_positive_individual_symptom.jsp">
			<jsp:param name="block" value="${param.block}" />
			<jsp:param name="symptom" value="${param.symptom}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_in_record_individual_symptom.jsp">
			<jsp:param name="block" value="${param.block}" />
			<jsp:param name="symptom" value="${param.symptom}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'long_covid_10'}">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_tested_positive_individual_symptom.jsp">
			<jsp:param name="block" value="${param.block}" />
			<jsp:param name="symptom" value="${param.symptom}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_in_record_individual_symptom.jsp">
			<jsp:param name="block" value="${param.block}" />
			<jsp:param name="symptom" value="${param.symptom}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'long_covid_11'}">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_tested_positive_individual_symptom.jsp">
			<jsp:param name="block" value="${param.block}" />
			<jsp:param name="symptom" value="${param.symptom}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/long_in_record_individual_symptom.jsp">
			<jsp:param name="block" value="${param.block}" />
			<jsp:param name="symptom" value="${param.symptom}" />
		</jsp:include>
	</c:when>
	<c:when test="${param.block == 'long_covid_12'}">
		<jsp:include page="../kpis/block2_kpis/covid_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/not_positive_total.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
		<jsp:include page="../kpis/block2_kpis/not_positive.jsp">
			<jsp:param name="block" value="${param.block}" />
		</jsp:include>
	</c:when>
</c:choose>
