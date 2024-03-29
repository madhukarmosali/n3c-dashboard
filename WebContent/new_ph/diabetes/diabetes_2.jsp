<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="diabetes_2" />
	<jsp:param name="block_header" value="Diabetes Mellitus Type 1" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp" />

	<jsp:param name="age_filter4" value="true" />

	<jsp:param name="simple_panel" value="diabetes/type_1.jsp" />

	<jsp:param name="datatable" value="diabetes/diabetes_table.jsp" />
	<jsp:param name="datatable_div" value="diabetes_type1" />
	<jsp:param name="datatable_feed" value="diabetes/feeds/t1_summary.jsp" />
</jsp:include>
