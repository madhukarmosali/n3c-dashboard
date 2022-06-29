<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>
	#paxlovid .dataTables_filter{
		display: unset;
	}
</style>

	<div id="paxlovid_2">
		<div class="row">
			<div class="col-12 col-md-6 viz" id="drugs_viz_1">
				<jsp:include page="vizs/" flush="true"/>
			</div>
			<div class="col-12 col-md-6 viz-table" id="drugs_table_1">
				<h4>Top 10 Most Frequent Drugs Seen Between 6 to 29 Days After Paxlovid Treatment</h4>
				<jsp:include page="tables/top10_drugs_table.jsp" flush="true"/>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-6 viz-table" id="drugs_table_2">
				<h4>Drugs Seen Between 6 to 29 Days After Paxlovid Treatment (Occurrences Greater Than 20)</h4>
				<jsp:include page="tables/greater_drugs_table.jsp" flush="true"/>
			</div>
			<div class="col-12 col-md-6 viz-table" id="drugs_table_3">
				<h4>Drugs Seen Between 6 to 29 Days After Paxlovid Treatment (Occurrences Less Than 20)</h4>
				<jsp:include page="tables/less20_drugs_table.jsp" flush="true"/>
			</div>
		</div>
	</div>
	