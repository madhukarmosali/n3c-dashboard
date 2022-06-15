<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>
#questions li{
	font-size: 1.3rem;
}

.feature_heading{
	font-weight: 800;
	color: #205b80;
}

.feature_viz_section{
	padding-bottom: 30px; 
	border-bottom: 6px dashed lightgray;
}

.feature_sub_heading{
	font-weight: 600;
	color: #3f3f3f;
}

.feature_viz_section .viz_footer{
	color: #616161;
}
</style>


<div class="row stats block2 mx-auto">
	<div class="col-12">
		<h3 class="mt-5 text-center"><span style="border-bottom: 3px solid #a3bbc6; padding-bottom: 10px; border-top: 3px solid #a3bbc6; padding-top: 10px; display:inline-block">What <strong style="color: #117a8b">You</strong> Can Do With the Long COVID Dashboard:</span></h3>
		<h4 class="text-center mt-5 mb-4 feature_heading">
			<img alt="step 1" class="step-img align-center" data-entity-type="file" src="<util:applicationRoot/>/images/steps/step1.png" style="width:100%; height:auto; max-width:50px; min-width:20px; display:none;">
			Explore Symptoms Commonly Associated with Long COVID
		</h4>
		
		<div class="row feature_viz_section">
			<div class="col-12 col-xl-6" id="symptom_group">
				<h5 class="text-center mb-2 feature_sub_heading">By Symptom Grouping</h5>
				<div id="symptom_group_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_bar.jsp">
					<jsp:param name="graph_element" value="symptom_group_viz" />
					<jsp:param name="container" value="symptom_group" />
					<jsp:param name="feed" value="long_bar_feed2.jsp" />
				</jsp:include>
				<p class="viz_footer"><strong>Number of Distinct Symptom Values by Symptom Grouping.</strong> Click on any symptom grouping bar to navigate to that view.</p>
			</div>
			<div class="col-12 col-xl-6" id="individual_symptom">
				<h5 class="text-center mb-2 feature_sub_heading">By Individual Symptom</h5>
				<div id="individual_symptom_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_tree.jsp"/>
				<p class="viz_footer"><strong>Counts of Patients that Experienced Symptom and have Diagnosed Long COVID (U09.9).</strong> Click on any symptom to navigate to that view.</p>
			</div>
		</div>
		
		<h4 class="text-center mb-2 mt-5 feature_heading">
		<img alt="step 1" class="step-img align-center" data-entity-type="file" src="<util:applicationRoot/>/images/steps/step2.png" style="width:100%; height:auto; max-width:50px; min-width:20px; display:none;">
		Explore the Demographics Associated with Long COVID
		</h4>
		<div class="row feature_viz_section">
			<div class="col-12 col-xl-7 mx-auto" id="indicator">
				<h5 class="text-center mb-2 feature_sub_heading">By Long COVID Indicator</h5>
				<div id="indicator_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_bar.jsp">
					<jsp:param name="graph_element" value="indicator_viz" />
					<jsp:param name="container" value="indicator" />
					<jsp:param name="feed" value="long_bar_feed.jsp" />
				</jsp:include>
				<p class="viz_footer"><strong>Number of Patients Captured by Each Long COVID Indicator.</strong> Click on an indicator bar to navigate to that view.</p>
			</div>
		</div>
		
		<div class="row feature_viz_section">
			<div class="col-12 text-max mx-auto mt-5" id="questions">
				<h4 class="text-center mb-2 feature_heading">
					<img alt="step 1" class="step-img align-center" data-entity-type="file" src="<util:applicationRoot/>/images/steps/step3.png" style="width:100%; height:auto; max-width:50px; min-width:20px; display:none;">
					And Answer Questions Like:
				</h4>
				<ul>
					<li><a href="<util:applicationRoot/>/new-ph/summary/long-covid/3">How well do the identified common Long COVID symptoms actually capture Long COVID?</a></li>
					<li><a href="<util:applicationRoot/>/new-ph/summary/long-covid/6">When did patients experience the identified common Long COVID symptoms in relation to their COVID diagnosis?</a></li>
					<li><a href="<util:applicationRoot/>/new-ph/summary/long-covid/12">How do the identified common Long COVID symptoms relate to patients without diagnosed COVID?</a></li>
				</ul>
				<p class="viz_footer">Click on any question to navigate to that view.</p>
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


