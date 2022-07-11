<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="mortality_2" />
	<jsp:param name="block_header" value="Mortality: Delayed Mortality" />
	<jsp:param name="topic_description" value="secondary_2" />

	<jsp:param name="kpis" value="mortality/kpis.jsp" />
	
	<jsp:param name="delay_filter" value="true" />

	<jsp:param name="simple_panel" value="mortality/delay.jsp" />

	<jsp:param name="datatable" value="mortality/delayed_table.jsp" />
	<jsp:param name="datatable_div" value="delayed_mortality_delayed" />
	<jsp:param name="datatable_feed" value="mortality/feeds/delayed.jsp" />
	<jsp:param name="datatable_kpis" value="patient_count" />
</jsp:include>

