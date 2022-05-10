<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<script>
<jsp:include page="../feeds/configuration.jsp"/>
</script>

<jsp:include page="../graph_support/pieChart_local.jsp"/>
<jsp:include page="../graph_support/horizontalBarChart_local.jsp"/>
<jsp:include page="../graph_support/horizontalStackedBarChart_local.jsp"/>
<jsp:include page="../graph_support/horizontalGroupedStackedBarChart_local.jsp"/>
<jsp:include page="../graph_support/verticalBarChart_local.jsp"/>
<jsp:include page="../graph_support/graphic_save.jsp"/>

<c:choose>
	<c:when test="${param.iframe == 'summary'}">
		<jsp:include page="adult_summary/panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'pediatrics'}">
		<jsp:include page="pediatrics_summary/panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'medications'}">
		<jsp:include page="medications/panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'reinfection'}">
		<jsp:include page="reinfection/panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'timeline'}">
		<jsp:include page="timeline/panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'severity-region'}">
		<jsp:include page="severity_region/panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'diabetes-mellitus'}">
		<jsp:include page="diabetes/panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'smoking'}">
		<jsp:include page="smoking/panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'hlh'}">
		<jsp:include page="hlh/panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'hss'}">
		<jsp:include page="hss/panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'long-covid'}">
		<jsp:include page="long_covid/panel2.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'delayed-mortality'}">
		<jsp:include page="delayed_mortality/panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'reinfection-time-series'}">
		<jsp:include page="reinfection_time_series/panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'sotrovimab'}">
		<jsp:include page="sotrovimab/panel.jsp"/>
	</c:when>
	<c:otherwise>
		${param.iframe}
	</c:otherwise>
</c:choose>
