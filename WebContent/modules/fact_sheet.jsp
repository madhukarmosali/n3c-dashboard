<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div style="text-align:center; width:100%; margin-top:30px;">
	<div class="row mx-auto" style="padding: 10px; padding-bottom:30px; padding-top:30px; width:100%;">
		<div class="col-12 text-max" style="text-align:left; margin:auto; margin-bottom:30px;">
			<h4>Data within the N3C Data Enclave is provided by <span style="font-weight:700;"><span id="site_count">&nbsp;</span> 
			sites</span> from across the nation and contains information about 
			<span style="font-weight:700;"><span id="persons">&nbsp;</span> anonymized persons</span>.
			The Enclave has <span style="font-weight:700;"><span id="rows">&nbsp;</span> total rows</span> containing:
			</h4>
		</div>
		<div class="col-12 col-md-6">
			<h4><span id="positive">&nbsp;</span> <strong>COVID+ Cases	<i class="fas fa-virus"></i></strong></h4>
			<h4><span id="observations">&nbsp;</span> <strong>Clinical Observations	<i class="fas fa-notes-medical"></i></strong></h4>
			<h4><span id="results">&nbsp;</span> <strong>Lab Results <i class="fas fa-file-medical-alt"></i></strong></h4>
		</div>
		<div class="col-12 col-md-6">
			<h4><span id="records">&nbsp;</span> <strong>Medication Records <i class="fas fa-pills"></i></strong></h4>
			<h4><span id="procedures">&nbsp;</span> <strong>Procedures <i class="fas fa-procedures"></i></strong></h4>
			<h4><span id="visits"></span> <strong>Visits <i class="far fa-calendar-alt"></i></strong></h4>
		</div>
		<div class="col-12" style="text-align:right; margin-top:20px;">
			<em style="margin-top:10px; font-size:14px;">Data as of	<span id="date"></span></em>
		</div>
	</div>

</div>

<script>
	$.getJSON("<util:applicationRoot/>/feeds/embedded_fact_sheet.jsp", function(json){
		var data = $.parseJSON(JSON.stringify(json));

		$('#date').text(data['release_date']); 


		$('#site_count').text(data['sites_ingested']); 	
		$('#persons').text(data['person_rows']); 
		$('#positive').text(data['covid_positive_patients']); 
		$('#rows').text(data['total_rows']);
		$('#observations').text(data['observation_rows']);
		$('#results').text(data['measurement_rows']);
		$('#records').text(data['drug_exposure_rows']);
		$('#procedures').text(data['procedure_rows']);
		$('#visits').text(data['visit_rows']);  	
	});

</script>