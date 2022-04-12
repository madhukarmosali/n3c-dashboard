<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="block.jsp">
	<jsp:param name="block" value="severity_region_1" />
	<jsp:param name="block_header" value="" />

	<jsp:param name="kpis" value="severity_region_kpis.jsp" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=severity" />
</jsp:include>
