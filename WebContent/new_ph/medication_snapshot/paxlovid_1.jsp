<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>
	#paxlovid .dataTables_filter{
		display: unset;
	}
</style>

<div id="paxlovid_1">
	<div class="row">
		<div class="col-12 col-md-6 viz" id="condition_viz_1">
			<jsp:include page="vizs/" flush="true"/>
		</div>
		<div class="col-12 col-md-6 viz-table" id="condition_table_1">
			<h4>Top 10 Conditions Related to Paxlovid</h4>
			<jsp:include page="tables/top10_table.jsp" flush="true"/>
		</div>
	</div>
	<div class="row">
		<div class="col-12 col-md-6 viz-table" id="condition_table_2">
			<h4>All Conditions Related to Paxlovid where Occurances are Greater Than 20</h4>
			<jsp:include page="tables/greater_table.jsp" flush="true"/>
		</div>
		<div class="col-12 col-md-6 viz-table" id="condition_table_3">
			<h4>All Conditions Related to Paxlovid where Occurances are Less Than 20</h4>
			<jsp:include page="tables/less20_table.jsp" flush="true"/>
		</div>
	</div>
</div>
