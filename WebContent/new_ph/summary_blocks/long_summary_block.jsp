<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>
#questions li{
	font-size: 1.3rem;
}
</style>


<div class="row stats block2 mx-auto">
	<div class="col-12">
		<h3 class="mt-5 text-center" style="color: #205b80;"><span style="border-bottom: 3px solid; padding-bottom: 10px; display:inline-block">What You Can Do With the Long COVID Dashboard:</span></h3>
		<h4 class="text-center mt-5 mb-4">Explore Symptoms Commonly Associated with Long COVID</h4>
		
		<div class="row">
			<div class="col-12 col-xl-6" id="symptom_group">
				<h5 class="text-center mb-2">By Symptom Grouping</h5>
				<div id="symptom_group_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_bar.jsp">
					<jsp:param name="graph_element" value="symptom_group_viz" />
					<jsp:param name="container" value="symptom_group" />
					<jsp:param name="feed" value="long_bar_feed2.jsp" />
				</jsp:include>
				<p>Number of Distinct Symptom Values by Symptom Grouping. Click on any symptom grouping bar to navigate to that view.</p>
			</div>
			<div class="col-12 col-xl-6" id="individual_symptom">
				<h5 class="text-center mb-2">By Individual Symptom</h5>
				<div id="individual_symptom_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_tree.jsp"/>
				<p>Counts of Patients that Experienced Symptom and have Diagnosed Long COVID (U09.9). Click on any symptom to navigate to that view.</p>
			</div>
		</div>
		
		<h4 class="text-center mb-2 mt-5">Explore the Demographics Associated with Long COVID</h4>
		<div class="row">
			<div class="col-12 col-xl-7 mx-auto" id="indicator">
				<h5 class="text-center mb-2">By Long COVID Indicator</h5>
				<div id="indicator_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_bar.jsp">
					<jsp:param name="graph_element" value="indicator_viz" />
					<jsp:param name="container" value="indicator" />
					<jsp:param name="feed" value="long_bar_feed.jsp" />
				</jsp:include>
				<p>Number of Patients Captured by Each Long COVID Indicator. Click on an indicator bar to navigate to that view.</p>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12 text-max mx-auto mt-5" id="questions">
				<h4 class="text-center mb-2">And Answer Questions Like:</h4>
					<ul>
						<li><a href="<util:applicationRoot/>/new-ph/summary/long-covid/3">How well do the identified common Long COVID symptoms actually capture Long COVID?</a></li>
						<li><a href="<util:applicationRoot/>/new-ph/summary/long-covid/6">When did patients experience the identified common Long COVID symptoms in relation to their COVID diagnosis?</a></li>
						<li><a href="<util:applicationRoot/>/new-ph/summary/long-covid/12">How do the identified common Long COVID symptoms relate to patients without diagnosed COVID?</a></li>
					</ul>
			</div>
		</div>
	</div>
</div>			

<script>


	// manage incremental loading of panels on inner nav bar clicks
	//
	var ${param.block}_crumbs = '';
	
	function ${param.block}_load(selection) {
		var $this = $("#${param.block}-"+selection);
		var which = $this.attr('src');

		//console.log("in main click", "${param.block}-"+selection, "which", which)
		if (!${param.block}_crumbs.includes(selection)) {
			$this.load("<util:applicationRoot/>/new_ph/"+which);
			${param.block}_crumbs = ${param.block}_crumbs + selection;
			//console.log({
			//	which : which
			//});
		}
	};
	
	function ${param.block}_loaded(selection) {
		return ${param.block}_crumbs.includes(selection);
	}
</script>


