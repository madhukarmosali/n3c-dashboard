<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>
	#paxlovid .dataTables_filter{
		display: unset;
	}
</style>

<div id="paxlovid">
	<div class="topic_dropdown" style="text-align:center; font-size: 1.3rem;">
	<h4 class="viz_color_header">Select a Dashboard to Explore:</h4>
	<select id="selectMe">
		<option value="pax_1">Visits</option>
		<option value="pax_2">Persons with Visits</option>
		<option value="pax_3">Conditions</option>
		<option value="pax_4">Drugs</option>
	</select>
	</div>

	<div id="pax_3">
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
	
	<div id="pax_4">
		<div class="row">
			<div class="col-12 col-md-6 viz" id="drugs_viz_1">
				<jsp:include page="vizs/" flush="true"/>
			</div>
			<div class="col-12 col-md-6 viz-table" id="drugs_table_1">
				<h4>Top 10 Drugs Related to Paxlovid</h4>
				<jsp:include page="tables/top10_drugs_table.jsp" flush="true"/>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-6 viz-table" id="drugs_table_2">
				<h4>All Drugs Related to Paxlovid where Occurances are Greater Than 20</h4>
				<jsp:include page="tables/greater_drugs_table.jsp" flush="true"/>
			</div>
			<div class="col-12 col-md-6 viz-table" id="drugs_table_3">
				<h4>All Drugs Related to Paxlovid where Occurances are Less Than 20</h4>
				<jsp:include page="tables/less20_drugs_table.jsp" flush="true"/>
			</div>
		</div>
	</div>