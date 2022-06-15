<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../summary_blocks/long_summary_block.jsp">
	<jsp:param name="block" value="long_covid_13" />
	<jsp:param name="block_header" value="Long COVID: Patients That Have Not Tested Positive For COVID" />
	<jsp:param name="topic_description" value="secondary_12" />
	<jsp:param name="topic_title" value="Percentage of Long COVID Patients by Demographic" />
	
	
	<jsp:param name="kpis" value="long_covid/kpis2.jsp" />

	<jsp:param name="simple_panel" value="long_covid/covid_long_percentage_simple.jsp" />

	
	<jsp:param name="datatable" value="long_covid/covid_long_percentage_table.jsp" />
	<jsp:param name="datatable_div" value="covid_long_percentage" />
	<jsp:param name="datatable_feed" value="long_covid/feeds/covid_long_percentage.jsp" />

</jsp:include>

