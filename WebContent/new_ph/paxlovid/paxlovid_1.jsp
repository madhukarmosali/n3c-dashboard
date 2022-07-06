<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<style>
	#paxlovid .dataTables_filter{
		display: unset;
	}
</style>

<div class="paxlovid_1">
<jsp:include page="kpis.jsp"/>

	<div class="row">
		<div class="col-12 mx-auto mt-2 mb-2 text-center">
			<h4>Top 20 Most Frequent Conditions Seen Between 6 to 27 Days After Paxlovid Treatment</h4>
		</div>
		<div class="col-12 col-md-6 viz" id="condition_viz_1">
			Category:
			<select id="selectCat">
				<option value="any">Any</option>
				<option value="pulmonary">Pulmonary</option>
				<option value="renal">Renal</option>
			</select>
			
			<div id="condition_viz_any" style="display: block;"></div>
			<jsp:include page="vizs/stacked_bar.jsp">
				<jsp:param name="domName" value='condition_viz_any' />
				<jsp:param name="feed" value="topten_condition.jsp" />
				<jsp:param name="primary" value="condition" />
				<jsp:param name="secondary" value="result" />
				<jsp:param name="textmargin" value="340" />
			</jsp:include>
			<div id="condition_viz_pulmonary" style="display: none;"></div>
			<jsp:include page="vizs/stacked_bar.jsp">
				<jsp:param name="domName" value='condition_viz_pulmonary' />
				<jsp:param name="feed" value="topten_condition_by_category.jsp?category=pulmonary" />
				<jsp:param name="primary" value="condition" />
				<jsp:param name="secondary" value="result" />
				<jsp:param name="textmargin" value="340" />
			</jsp:include>
			<div id="condition_viz_renal" style="display: none;"></div>
			<jsp:include page="vizs/stacked_bar.jsp">
				<jsp:param name="domName" value='condition_viz_renal' />
				<jsp:param name="feed" value="topten_condition_by_category.jsp?category=renal" />
				<jsp:param name="primary" value="condition" />
				<jsp:param name="secondary" value="result" />
				<jsp:param name="textmargin" value="340" />
			</jsp:include>
		</div>
		<div class="col-12 col-md-6 viz-table" id="condition_table_1">
			<jsp:include page="tables/top10_table.jsp" flush="true"/>
		</div>
	</div>
	<div class="row">
		<div class="col-12 mx-auto mt-2 mb-2 text-center">
			<h4>All Conditions Seen Between 6 to 27 Days After Paxlovid Treatment </h4>
		</div>
		<div class="col-12 col-md-6 viz-table" id="condition_table_2">
			<h5 class="text-center">Total Occurrences Greater Than 20</h5>
			<jsp:include page="tables/greater_table.jsp" flush="true"/>
		</div>
		<div class="col-12 col-md-6 viz-table" id="condition_table_3">
			<h5 class="text-center">Total Occurrences Less Than 20</h5>
			<jsp:include page="tables/less20_table.jsp" flush="true"/>
		</div>
	</div>
</div>

<script>
$(document).ready(function () {
	  $('#selectCat').change(function () {
		  console.log("selected", $(this).val())
		  document.getElementById("condition_viz_any").style.display = "none";
		  document.getElementById("condition_viz_pulmonary").style.display = "none";
		  document.getElementById("condition_viz_renal").style.display = "none";
		  document.getElementById("condition_viz_"+$(this).val()).style.display = "block";
	  })
	});
</script>