<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<style>
	.paxlovid .dataTables_filter{
		display: unset;
	}
</style>

<div class="paxlovid_1">
<jsp:include page="kpis.jsp"/>

	<div class="row">
		<div class="col-12 mx-auto mt-2 mb-2 text-center">
			<p>All data shown occurred between the first day after the end of the 5-day course of Paxlovid 
			(i.e., day 6 post-Paxlovid) and three weeks following (i.e., day 27 post-Paxlovid).</p>
		</div>
		<div class="col-12 mx-auto mt-2 mb-2 text-center">
			<h4>Top 20 Most Frequent Medications Seen Between 6 to 27 Days After Paxlovid Treatment</h4>
		</div>
		<div class="col-12 col-md-6 viz" id="drugs_viz_1">
			<div class="panel-body">
				<h6 style="color:#3F50B0;"><i class="fas fa-filter"></i> COVID Status</h6>
				<select id="drugs_viz-testresult-select" multiple="multiple">
				<sql:query var="cases" dataSource="jdbc/N3CPublic">
					select distinct result_abbrev, result_seq from n3c_dashboard.result_map order by result_seq;
				</sql:query>
				<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
					<option value="${row.result_abbrev}">${row.result_abbrev}</option>
				</c:forEach>
				</select>
			</div>
			<div id="drugs_viz"></div>
			<div id="drugs_viz_table" style="display: none;"></div>
			<jsp:include page="viz_tables/drugs_viz_table.jsp">
				<jsp:param name="domName" value='drugs_viz' />
				<jsp:param name="feed" value="topten_drugs_long.jsp" />
				<jsp:param name="table" value="drugs_viz_table" />
				<jsp:param name="primary" value="medication" />
				<jsp:param name="secondary" value="result" />
				<jsp:param name="textmargin" value="400" />
			</jsp:include>
		</div>
		<div class="col-12 col-md-6 viz-table" id="drugs_table_1">
			<jsp:include page="tables/top10_drugs_table.jsp" flush="true"/>
		</div>
	</div>
	<div class="row">
		<div class="col-12 mx-auto mt-2 mb-2 text-center">
			<h4>All Medications Seen Between 6 to 27 Days After Paxlovid Treatment </h4>
		</div>
		<div class="col-12 col-md-6 viz-table" id="drugs_table_2">
			<h5 class="text-center">Total Occurrences Greater Than 20</h5>
			<jsp:include page="tables/greater_drugs_table.jsp" flush="true"/>
		</div>
		<div class="col-12 col-md-6 viz-table" id="drugs_table_3">
			<h5 class="text-center">Total Occurrences Less Than 20</h5>
			<jsp:include page="tables/less20_drugs_table.jsp" flush="true"/>
		</div>
	</div>
</div>

<script>
$('#drugs_viz-testresult-select').multiselect({	
	onChange: function(option, checked, select) {
		var options = $('#drugs_viz-testresult-select');
        var selected = [];
        $(options).each(function(){
            selected.push($(this).val());
        });
		${param.block}_constrain("result",  selected[0].join('|'));
    }
});
</script>
	