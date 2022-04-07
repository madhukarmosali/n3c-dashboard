<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <link href="https://unpkg.com/tabulator-tables@5.1.2/dist/css/tabulator.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://unpkg.com/tabulator-tables@5.1.2/dist/js/tabulator.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.26.0/axios.min.js" integrity="sha512-bPh3uwgU5qEMipS/VOmRqynnMXGGSRv+72H/N260MQeXZIK4PG48401Bsby9Nq5P5fz7hy5UGNmC/W1Z51h2GQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/d3@7"></script>

<style>
.btn-select{
	text-align: center;
	margin-bottom: 20px;
}

.dataTables_length{
	display:none;
}

.dataTables_filter{
	float:none !important;
	text-align:center !important;
}


#long-training th{
	word-break: break-word;
}

</style>

<jsp:include page="head.jsp" flush="true" />

<body>
	<jsp:include page="navbar.jsp" flush="true">
  		<jsp:param name="page" value="long-covid"/>
	</jsp:include>

	<div class="container content container-large">
		
		<div class="row">
			<div class="col-12 col-lg-12">
				<h3 class="header-text">Long-COVID</h3>
				<div id="metric_btns" class="btn-select">
					<a id="long-model-btn" class="btn btn-primary active" role="button" onclick="toggle_long('model');">Model Features</a>
					<a id="long-training-btn" class="btn btn-primary" role="button" onclick="toggle_long('training');">Training Cohort Characteristics</a>
					<a id="long-demographics-btn" class="btn btn-primary" role="button" onclick="toggle_long('demographics');">Demographics</a>
				</div>
				<div id="long-model" style="display:block; text-align:center;">
					<h4 class="header-text">Most important model features for predicting visit to a Long-COVID clinic.</h4>
					<jsp:include page="long_covid/fig4.jsp"/>
				</div>
				<div id="long-training" style="display:none;">
					<h4 class="header-text">Characteristics of the three-site cohort used for model training and testing.</h4>
					<jsp:include page="long_covid/table1.html"/>
				</div>
				<div id="long-demographics" style="display:none;">
					<h4 class="header-text">Demographic breakdown of potential Long-COVID patients in the N3C cohort.</h4>
					<jsp:include page="long_covid/table2.html"/>
				</div>
			</div>
			
		</div>
	</div>

	<jsp:include page="footer.jsp" flush="true" />
	
	<script>

	function toggle_long(selection) {
		if (selection == "model") {
			$("#long-model").css('display', 'block');
			$("#long-model-btn").addClass("active");
			$("#long-training").css('display', 'none');
			$("#long-training-btn").removeClass("active");
			$("#long-demographics").css('display', 'none');
			$("#long-demographics-btn").removeClass("active");
			cache_browser_history("long-covid", "long-covid/model")
		}
		if (selection == "training") {
			$("#long-model").css('display', 'none');
			$("#long-model-btn").removeClass("active");
			$("#long-training").css('display', 'block');
			$("#long-training-btn").addClass("active");
			$("#long-demographics").css('display', 'none');
			$("#long-demographics-btn").removeClass("active");
			cache_browser_history("long-covid", "long-covid/training")
		}
		if (selection == "demographics") {
			$("#long-model").css('display', 'none');
			$("#long-model-btn").removeClass("active");
			$("#long-training").css('display', 'none');
			$("#long-training-btn").removeClass("active");
			$("#long-demographics").css('display', 'block');
			$("#long-demographics-btn").addClass("active");
			cache_browser_history("long-covid", "long-covid/demographics")
		}
	}
	

	<c:choose>
		<c:when test="${empty param.secondary_tab || param.secondary_tab == 'model' }">
			toggle_long("model")
		</c:when>
		<c:when test="${param.secondary_tab == 'training' }">
			toggle_long("training")
		</c:when>
		<c:when test="${param.secondary_tab == 'demographics' }">
			toggle_long("demographics")
		</c:when>
	</c:choose>
	</script>
	
</body>
</html>

