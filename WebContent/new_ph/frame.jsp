<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<c:choose>
	<c:when test="${param.iframe == 'summary'}">
		<jsp:include page="adult_summary_panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'pediatrics'}">
		<jsp:include page="pediatrics_summary_panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'medications'}">
		<jsp:include page="medications_panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'reinfection'}">
		<jsp:include page="../modules/reinfection_timeline.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'timeline'}">
		<jsp:include page="../modules/positive_timeline.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'severity-region'}">
		<jsp:include page="severity_region_panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'diabetes-mellitus'}">
		<jsp:include page="diabetes_panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'smoking'}">
		<jsp:include page="smoking_panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'hlh'}">
		<jsp:include page="hlh_panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'hss'}">
		<jsp:include page="hss_panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'long-covid'}">
		<jsp:include page="long_covid_panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'delayed-mortality'}">
		<jsp:include page="delayed_mortality_panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'reinfection-time-series'}">
		<jsp:include page="reinfection_time_series_panel.jsp"/>
	</c:when>
	<c:when test="${param.iframe == 'sotrovimab'}">
		<jsp:include page="sotrovimab_panel.jsp"/>
	</c:when>
	<c:otherwise>
		${param.iframe}
	</c:otherwise>
</c:choose>
