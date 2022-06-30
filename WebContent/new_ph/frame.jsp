<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<script>
<jsp:include page="../feeds/configuration.jsp"/>
</script>

<jsp:include page="../graph_support/pieChart_local.jsp"/>
<jsp:include page="../graph_support/percentage_bar_local.jsp"/>
<jsp:include page="../graph_support/horizontalBarChart_local.jsp"/>
<jsp:include page="../graph_support/horizontalBarChart_local2.jsp"/>
<jsp:include page="../graph_support/horizontalStackedBarChart_local.jsp"/>
<jsp:include page="../graph_support/horizontalGroupedStackedBarChart_local.jsp"/>

<jsp:include page="../graph_support/grouped_stacked_bar_horizontal_alexis_local.jsp"/>

<jsp:include page="../graph_support/verticalBarChart_local.jsp"/>
<jsp:include page="../graph_support/mortalityBarChart_local.jsp"/>
<jsp:include page="../graph_support/graphic_save.jsp"/>

<c:choose>
	<c:when test="${param.frame == 'summary'}">
		<jsp:include page="adult_summary/panel.jsp"/>
	</c:when>
	<c:when test="${param.frame == 'pediatrics'}">
		<jsp:include page="pediatrics/panel.jsp"/>
	</c:when>
	<c:when test="${param.frame == 'medications'}">
		<jsp:include page="medications/panel_qlik.jsp"/>
	</c:when>
	<c:when test="${param.frame == 'reinfection'}">
		<jsp:include page="reinfection/panel2.jsp?tertiary_tab=${param.tertiary_tab}"/>
	</c:when>
	<c:when test="${param.frame == 'timeline'}">
		<jsp:include page="timeline/panel2.jsp"/>
	</c:when>
	<c:when test="${param.frame == 'severity-region'}">
		<jsp:include page="severity_region/iframe.jsp"/>
	</c:when>
	<c:when test="${param.frame == 'diabetes-mellitus'}">
		<jsp:include page="diabetes/panel2.jsp"/>
	</c:when>
	<c:when test="${param.frame == 'smoking'}">
		<jsp:include page="smoking/panel.jsp"/>
	</c:when>
	<c:when test="${param.frame == 'hlh'}">
		<jsp:include page="hlh/panel2.jsp"/>
	</c:when>
	<c:when test="${param.frame == 'hss'}">
		<jsp:include page="hss/panel.jsp"/>
	</c:when>
	<c:when test="${param.frame == 'long-covid'}">
		<jsp:include page="long_covid/panel2.jsp?tertiary_tab=${param.tertiary_tab}"/>
	</c:when>
	<c:when test="${param.frame == 'delayed-mortality'}">
		<jsp:include page="delayed_mortality/panel2.jsp"/>
	</c:when>
	<c:when test="${param.frame == 'reinfection-time-series'}">
		<jsp:include page="reinfection_time_series/panel.jsp"/>
	</c:when>
	<c:when test="${param.frame == 'sotrovimab'}">
		<jsp:include page="sotrovimab/panel.jsp"/>
	</c:when>
	<c:when test="${param.frame == 'SummaryDataAllAges'}">
		<jsp:include page="all_summary/panel.jsp"/>
	</c:when>
	<c:when test="${param.frame == 'MedicationsSnapshots'}">
		<jsp:include page="medication_snapshot/panel2.jsp"/>
	</c:when>
	<c:when test="${param.frame == 'Paxlovid'}">
		<jsp:include page="paxlovid/panel2.jsp"/>
	</c:when>
	<c:otherwise>
		${param.frame}
	</c:otherwise>
</c:choose>
