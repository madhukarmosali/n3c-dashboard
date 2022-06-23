<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- cases_by_severity_by_state_censored (2022-03-31 04:59) -->

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="severity_region_1" />
	<jsp:param name="block_header" value="" />

	<jsp:param name="kpis" value="severity_region/kpis.jsp" />

	<jsp:param name="simple_panel" value="severity_region/map.jsp" />
</jsp:include>
