<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>
/* Style the Image Used to Trigger the Modal */
#myImg {
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s;
}

#myImg:hover {opacity: 0.7;}

/* The Modal (background) */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  padding-top: 100px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0,0.9);
}

/* Modal Content (Image) */
.modal-content {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
}

/* Caption of Modal Image (Image Text) - Same Width as the Image */
.modalcaption{
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
  text-align: center;
  color: #ccc;
  padding: 10px 0;
  height: 150px;
}

/* Add Animation - Zoom in the Modal */
.modal-content, #caption {
  animation-name: zoom;
  animation-duration: 0.6s;
}

@keyframes zoom {
  from {transform:scale(0)}
  to {transform:scale(1)}
}

/* The Close Button */
.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
  .modal-content {
    width: 100%;
  }
}

.pax_caption{
	max-width: 500px;
    margin: auto;
    text-align:left;
}
</style>

<div class="row">
	<div class="col-12 mx-auto mt-2 mb-2 text-center">
		<p>All data shown occurred between the first day after the end of the 5-day course of Paxlovid (i.e., day 6 post-Paxlovid) and three weeks following (i.e., day 27 post-Paxlovid).</p>
	</div>
</div>
<div class="row">
	<div class="col-12 col-md-5 mx-auto mt-2 mb-2 text-center">
		<img id="img1" title="Click to Zoom" alt="Figure 1. Cumulative % of patients who have a care visit after a 5 day
		Paxlovid course. Upper Panel: 838 patients with U07.1 visits (a code
		indicating the visit is COVID-related);</b> Lower Panel: 3,676 patients
		with any clinical visit (i.e. those with a diagnosis code). The
		figures illustrate that few patients receiving care post-Paxlovid test
		positive for COVID-19, even when their visits include a COVID-19
		diagnosis (upper panel). Note that 22 Paxlovid-treated individuals
		(not shown) tested positive but did not have a subsequent visit with a
		diagnosis of any kind." src="<util:applicationRoot/>/new_ph/paxlovid/images/image1.png" style="max-width: 100%; max-height:750px; cursor:zoom-in;">
		<p class="pax_caption"><b>Figure 1. Cumulative % of patients who have a care visit after a 5 day
		Paxlovid course. Upper Panel: 838 patients with U07.1 visits (a code
		indicating the visit is COVID-related);</b> Lower Panel: 3,676 patients
		with any clinical visit (i.e. those with a diagnosis code). The
		figures illustrate that few patients receiving care post-Paxlovid test
		positive for COVID-19, even when their visits include a COVID-19
		diagnosis (upper panel). Note that 22 Paxlovid-treated individuals
		(not shown) tested positive but did not have a subsequent visit with a
		diagnosis of any kind.</p>
	</div>
	<div class="col-12 col-md-7 mx-auto mt-2 mb-2 text-center">
		<img id="img2" title="Click to Zoom" alt="Figure 2. Heatmap showing new or continuing diagnoses in the
		three-weeks post-Paxlovid.</b> Shown are major categories of diagnoses
		recorded post-Paxlovid course for patients testing COVID positive,
		negative, or those with unknown test status. Patients largely show a
		moderate increase in pulmonary and urinary/kidney symptomatology for
		those testing positive over those who are testing negative or those
		whose testing status is unknown (which may indicate a lack of need for
		clinical testing and/or evaluation)." src="<util:applicationRoot/>/new_ph/paxlovid/images/image2.png" style="max-width: 100%; max-height:750px; cursor:zoom-in;">
		<p class="pax_caption"><b>Figure 2. Heatmap showing new or continuing diagnoses in the
		three-weeks post-Paxlovid.</b> Shown are major categories of diagnoses
		recorded post-Paxlovid course for patients testing COVID positive,
		negative, or those with unknown test status. Patients largely show a
		moderate increase in pulmonary and urinary/kidney symptomatology for
		those testing positive over those who are testing negative or those
		whose testing status is unknown (which may indicate a lack of need for
		clinical testing and/or evaluation).</p>
	</div>
	
	<div id="myModal" class="modal">
  		<span class="close">&times;</span>
  		<img class="modal-content" id="img01">
  		<div id="caption" class="modalcaption"></div>
	</div>
	<div id="myModal2" class="modal">
  		<span class="close">&times;</span>
  		<img class="modal-content" id="img02">
  		<div id="caption2" class="modalcaption"></div>
	</div>


</div>

<script>
$("#img1").click(function(){
	$("#myModal").css("display", "block");
	$("#img01").attr("src", $(this).prop('src'));
	$("#caption").html($(this).prop('alt'));
});
$("#img2").click(function(){
	$("#myModal2").css("display", "block");
	$("#img02").attr("src", $(this).prop('src'));
	$("#caption2").html($(this).prop('alt'));
});
$(".close").click(function() {
	$(".modal").css("display", "none");
});
</script>