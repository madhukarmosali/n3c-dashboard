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

#recover-caption{
	display:block;
}

#recover-caption h2{
	font-size: 1.3rem;
}

#metric_btns{
	margin-top:50px;
}

</style>

<jsp:include page="head.jsp" flush="true" />

<body>
	<jsp:include page="navbar.jsp" flush="true">
  		<jsp:param name="page" value="recover"/>
	</jsp:include>

	<div class="container content container-large">
		
		<div class="row">
			<div class="col-12 col-lg-12">
				<div class="header-text">
					<h3>RECOVER Long COVID</h3>
					<h5>Expanding knowledge of Long COVID using N3C data</h5>
				</div>
				<div id="recover-caption" class="text-max mx-auto">
						<jsp:include page="caption.jsp">
							<jsp:param value="n3c_recover.caption" name="schema" />
							<jsp:param value="intro_paragraphs" name="tag" />
						</jsp:include>
				</div>
				<div id="metric_btns" class="btn-select">
					<a id="long-model-btn" class="btn btn-primary active" role="button" onclick="toggle_long('model');">Model Features</a>
					<a id="long-training-btn" class="btn btn-primary" role="button" onclick="toggle_long('training');">Training Cohort Characteristics</a>
					<a id="long-demographics-btn" class="btn btn-primary" role="button" onclick="toggle_long('demographics');">Demographics</a>
				</div>
				<div id="long-model" style="display:block; text-align:center;">
					<h4 class="header-text">
						<jsp:include page="caption.jsp">
							<jsp:param value="n3c_recover.caption" name="schema" />
							<jsp:param value="model_title" name="tag" />
						</jsp:include>
					</h4>
					<jsp:include page="caption.jsp">
						<jsp:param value="n3c_recover.caption" name="schema" />
						<jsp:param value="model_header" name="tag" />
					</jsp:include>
					<jsp:include page="long_covid/fig4.jsp"/>
					<div class="text-max mx-auto" style="text-align:left;">
						<jsp:include page="caption.jsp">
							<jsp:param value="n3c_recover.caption" name="schema" />
							<jsp:param value="model_footer" name="tag" />
						</jsp:include>
					</div>
				</div>
				<div id="long-training" style="display:none;">
					<h4 class="header-text">
						<jsp:include page="caption.jsp">
							<jsp:param value="n3c_recover.caption" name="schema" />
							<jsp:param value="training_title" name="tag" />
						</jsp:include>
					</h4>
					<jsp:include page="caption.jsp">
						<jsp:param value="n3c_recover.caption" name="schema" />
						<jsp:param value="training_header" name="tag" />
					</jsp:include>
					<jsp:include page="long_covid/table1.html"/>
					<div class="text-max mx-auto">
						<jsp:include page="caption.jsp">
							<jsp:param value="n3c_recover.caption" name="schema" />
							<jsp:param value="training_footer" name="tag" />
						</jsp:include>
					</div>
				</div>
				<div id="long-demographics" style="display:none;">
					<h4 class="header-text">
						<jsp:include page="caption.jsp">
							<jsp:param value="n3c_recover.caption" name="schema" />
							<jsp:param value="demographics_title" name="tag" />
						</jsp:include>
					</h4>
					<jsp:include page="caption.jsp">
						<jsp:param value="n3c_recover.caption" name="schema" />
						<jsp:param value="demographics_header" name="tag" />
					</jsp:include>
					<jsp:include page="long_covid/table2.html"/>
					<div class="text-max mx-auto">
						<jsp:include page="caption.jsp">
							<jsp:param value="n3c_recover.caption" name="schema" />
							<jsp:param value="demographics_footer" name="tag" />
						</jsp:include>
					</div>
				</div>
			</div>
			
		</div>
	</div>

	<div style="display: block; text-align: center;">
		<jsp:include page="caption.jsp">
			<jsp:param value="n3c_recover.caption" name="schema" />
			<jsp:param value="grant_ack" name="tag" />
		</jsp:include>
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
			cache_browser_history("recover", "recover/model");
		}
		if (selection == "training") {
			$("#long-model").css('display', 'none');
			$("#long-model-btn").removeClass("active");
			$("#long-training").css('display', 'block');
			$("#long-training-btn").addClass("active");
			$("#long-demographics").css('display', 'none');
			$("#long-demographics-btn").removeClass("active");
			cache_browser_history("recover", "recover/training");
		}
		if (selection == "demographics") {
			$("#long-model").css('display', 'none');
			$("#long-model-btn").removeClass("active");
			$("#long-training").css('display', 'none');
			$("#long-training-btn").removeClass("active");
			$("#long-demographics").css('display', 'block');
			$("#long-demographics-btn").addClass("active");
			cache_browser_history("recover", "recover/demographics");
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

