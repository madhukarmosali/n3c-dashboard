<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>


</style>


<div class="row">
	<div class="col-12 mx-auto">
		<div id="question-panel" class="panel panel-primary top_panel" style="margin-top:0px;">
			<div class="panel-body">
				<div id="question-select" class="">
					<jsp:include page="questions_styled2.jsp?tertiary_tab=${param.tertiary_tab}&quaternary_tab=${param.quaternary_tab}"/>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="col-12 viz-col mx-auto">
		<div class="panel panel-primary top_panel">
			<div class="panel-body">
				<div id="question-tile" style="width:100%; height:500px; background:url(<util:applicationRoot/>/images/spinners/fading_wheel.svg) no-repeat center 150px;">
				<p><i>Loading...</i></p>
				</div>
			</div>
		</div>
	</div>
</div>

