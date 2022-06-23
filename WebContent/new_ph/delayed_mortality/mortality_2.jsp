<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="delayed_mortality_2" />
	<jsp:param name="block_header" value="Mortality: Delayed Mortality" />

	<jsp:param name="kpis" value="delayed_mortality/kpis.jsp" />

	<jsp:param name="static_secondary_panel" value="delayed_mortality/delay.jsp" />

	<jsp:param name="datatable" value="delayed_mortality/delayed_table.jsp" />
	<jsp:param name="datatable_div" value="delayed_mortality_delayed" />
	<jsp:param name="datatable_feed" value="delayed_mortality/feeds/delayed.jsp" />
</jsp:include>
