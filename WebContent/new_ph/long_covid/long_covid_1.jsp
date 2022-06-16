<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../summary_blocks/long_summary_block.jsp">
	<jsp:param name="block" value="long_covid_1" />
	<jsp:param name="simple_panel" value="long_covid/covid_long_percentage_simple.jsp" />
	<jsp:param name="datatable" value="long_covid/covid_long_percentage_table.jsp" />
	<jsp:param name="datatable_div" value="covid_long_percentage" />
	<jsp:param name="datatable_feed" value="long_covid/feeds/covid_long_percentage.jsp" />
</jsp:include>

