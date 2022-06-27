<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>

	@media (max-width:991px){
		.large-ques-nav{
			display:none;
		}
		.viz-col{
			padding:0px;
		}
	}
	
	@media (min-width:991px){
		.small-ques-nav{
			display:none;
		}
	}
	
	#question-select .dropdown-menu{
    	left: 50% !important;
    	transform: translateX(-50%) !important;
    	top: 100% !important;
	}
</style>


<div class="row">
	<div class="col-lg-3 col-xl-2 large-ques-nav">
		<div class="panel panel-primary top_panel">
			<div class="panel-body">
				<div id="question-roster2">
					<jsp:include page="../modules/questions_styled.jsp"/>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-9 col-xl-10">
		<div class="panel panel-primary top_panel">
			<div class="panel-body">
				<div id="question-tile">
					<h4>Click on a question title on the left to view the visualization.</h4>
				</div>
			</div>
		</div>
	</div>
</div>

