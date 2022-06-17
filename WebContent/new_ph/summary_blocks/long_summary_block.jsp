<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>
#questions li{
	font-size: 1.3rem;
}

.feature_viz_section{
	padding-bottom: 30px; 
	border-bottom: 6px dashed lightgray;
}

.feature_sub_heading{
	font-weight: 600;
	color: #3f3f3f;
}

.summary .viz_footer{
	color: #616161;
}

.summary_heading{
	border-bottom: 3px solid #C9D3E8; 
	padding-bottom: 10px; border-top: 
	3px solid #C9D3E8; padding-top: 10px; 
	display: inline-block;
}
</style>


<div class="row stats block2 mx-auto summary">
	<div class="col-12">
		<h3 class="mt-5 text-center">
			<span class="summary_heading">What <strong style="color: #6E78AF">You</strong> Can Do With the Long COVID Dashboard:</span>
		</h3>
		<h4 class="text-center mt-5 viz_color_header">Explore Symptoms Commonly Associated with Long COVID</h4>
		<p class="text-center mb-4">Click on any bar to navigate to its associated view.</p>
		<div class="row mb-4">
			<div class="col-12 col-xl-6" id="symptom_group">
				<h5 class="text-center mb-2 feature_sub_heading">By Symptom Grouping</h5>
				<div id="symptom_group_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_bar.jsp">
					<jsp:param name="graph_element" value="symptom_group_viz" />
					<jsp:param name="container" value="symptom_group" />
					<jsp:param name="feed" value="long_bar_feed2.jsp" />
					<jsp:param name="color_left" value="#CD5C82" />
					<jsp:param name="color_right" value="#8C5592" />
					<jsp:param name="min_height" value="300" />
				</jsp:include>
				<p class="viz_footer">Number of Distinct Symptom Values by Symptom Grouping.</p>
			</div>
			<div class="col-12 col-xl-6" id="individual_symptom">
				<h5 class="text-center mb-2 feature_sub_heading">By Individual Symptom</h5>
				<div id="individual_symptom_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_tree.jsp">
					<jsp:param name="graph_element" value="individual_symptom_viz" />
					<jsp:param name="container" value="individual_symptom" />
					<jsp:param name="feed" value="long_tree_feed.jsp" />
					<jsp:param name="color_start" value="#0278A7" />
					<jsp:param name="color_end" value="#454F82" />
				</jsp:include>
				<p class="viz_footer">Counts of Patients that Experienced Symptom and have Diagnosed Long COVID (U09.9).</p>
			</div>
		</div>
		
		<div class="row feature_viz_section">
			<div class="col-12 col-xl-6" id="status">
				<h5 class="text-center mb-2 feature_sub_heading">By COVID and Long COVID Status</h5>
				<div id="status_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_tree.jsp">
					<jsp:param name="graph_element" value="status_viz" />
					<jsp:param name="container" value="status" />
					<jsp:param name="feed" value="long_tree_feed2.jsp" />
					<jsp:param name="color_start" value="#8C5592" />
					<jsp:param name="color_end" value="#163F59" />
				</jsp:include>
				<p class="viz_footer">Counts of Patients that Experienced Symptoms by COVID and Long COVID Status.</p>
			</div>
			<div class="col-12 col-xl-6" id="diagnosis">
				<h5 class="text-center mb-2 feature_sub_heading">By Symptom Experience Relative to COVID Diagnosis</h5>
				<div id="diagnosis_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_bar.jsp">
					<jsp:param name="graph_element" value="diagnosis_viz" />
					<jsp:param name="container" value="diagnosis" />
					<jsp:param name="feed" value="long_bar_feed3.jsp" />
					<jsp:param name="color_left" value="#454F82" />
					<jsp:param name="color_right" value="#163F59" />
					<jsp:param name="min_height" value="300" />
				</jsp:include>
				<p class="viz_footer">Counts of Patients that Experienced Symptoms Before and After COVID Diagnosis. Both bars navigate to the same view.</p>
			</div>
		</div>
		
		<h4 class="text-center mb-2 mt-5 viz_color_header">Explore the Demographics Associated with Long COVID</h4>
		<div class="row feature_viz_section">
			<div class="col-12 col-xl-6 mx-auto" id="indicator">
				<h5 class="text-center mb-2 feature_sub_heading">By Long COVID Indicator</h5>
				<div id="indicator_viz"></div>
				<jsp:include page="long_summary_block_vizs/long_bar.jsp">
					<jsp:param name="graph_element" value="indicator_viz" />
					<jsp:param name="container" value="indicator" />
					<jsp:param name="feed" value="long_bar_feed.jsp" />
					<jsp:param name="color_left" value="#454F82" />
					<jsp:param name="color_right" value="#8C5592" />
					<jsp:param name="min_height" value="300" />
				</jsp:include>
				<p class="viz_footer"><strong>Number of Patients Captured by Each Long COVID Indicator.</strong> Click on an indicator bar to navigate to that view.</p>
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


