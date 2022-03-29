<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div style="text-align:center; width:100%; margin-top:30px;">	
	<div class="row">
		<div class="col-12 col-md-6">
			<p class="mb-0">Phenotype: Versions 2.1 &amp; 2.2<br />
			Target Common Data Model: OMOP 5.3.1<br />
			CDM Mapping version: v.1.1<br />
			Production version: <span id="production_date">&nbsp;</span></p>
		</div>
		<div class="col-12 col-md-6">
			<p class="mb-0">OMOP Vocabulary Version: V5.0 06-NOV-20<br />
			Vocabulary Update: 2020-12-10<br />
			Source Common Data Models:<br />
			OMOP 5.2.0, 5.3.1&nbsp;&nbsp;&nbsp;PCORnet 5.1, 5.3&nbsp;&nbsp;&nbsp;ACT 2.01, 3.0</p>
		</div>
	</div>

	<div class="row" style="padding: 10px; padding-bottom:30px; padding-top:30px; width:100%;">
		<div class="col-12 col-md-6">
			<h4><i class="fas fa-clinic-medical"></i>  <strong>Sites: </strong> <span id="sites">&nbsp;</span></h4>
			<h4><strong><i class="fas fa-user"></i> Persons: </strong><span id="persons">&nbsp;</span></h4>
			<h4><strong><i class="fas fa-virus"></i> COVID+ Cases: </strong> <span id="positive">&nbsp;</span></h4>
			<h4><strong><i class="fas fa-table"></i> # of Rows: </strong> <span id="rows">&nbsp;</span></h4>
			<h4><strong><i class="fas fa-notes-medical"></i> Clinical Observations: </strong> <span id="observations">&nbsp;</span></h4>
		</div>
		<div class="col-12 col-md-6">
			<h4><strong><i class="fas fa-file-medical-alt"></i> Lab Results: </strong><span id="results">&nbsp;</span></h4>
			<h4><strong><i class="fas fa-pills"></i> Medication Records: </strong><span id="records">&nbsp;</span></h4>
			<h4><strong><i class="fas fa-procedures"></i> Procedures: </strong><span id="procedures">&nbsp;</span></h4>
			<h4><strong><i class="far fa-calendar-alt"></i> Visits: </strong><span id="visits"></span></h4>
		</div>
		<div class="col-12" style="text-align:right; margin-top:20px;">
			<em style="margin-top:10px; font-size:14px;">Data as of	<span id="date2"></span></em>
		</div>
	</div>
</div>

<script>
	$.getJSON("<util:applicationRoot/>/feeds/embedded_fact_sheet.jsp", function(json){
		var data = $.parseJSON(JSON.stringify(json));
		
		$('#date').text(data['release_date']); 
		$('#date2').text(data['release_date']); 
		$('#production_date').text(data['release_name']); 


		$('#sites').text(data['sites_ingested']); 	
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