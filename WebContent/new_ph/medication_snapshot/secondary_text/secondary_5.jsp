<div class="secondary-description">
	<p>Sample: <span class="tip">
					<a class="viz_secondary_info" title="COVID+ Defined As:" data-html="true" data-toggle="popover" data-placement="top" data-content="<ul style='padding-inline-start: 15px;'><li>Laboratory-confirmed positive COVID-19 PCR or Antigen test</li><li>(or) Laboratory-confirmed positive COVID-19 Antibody test</li><li>(or) Medical visit in which the ICD-10 code for COVID-19 (U07.1) was recorded</li></ul>" aria-describedby="tooltip">
  						<u style="white-space:nowrap;">COVID+ patients <i class="fa fa-info" aria-hidden="true"></i></u> 
  						<span class="sr-only">, or patients who have had, a laboratory-confirmed positive COVID-19 PCR or Antigen test, a laboratory-confirmed positive COVID-19 Antibody test, or a Medical visit in which the ICD-10 code for COVID-19 (U07.1) was recorded</span>
					</a>
				</span>&nbsp;in the N3C Data Enclave whose patient records included Sotrovimab on any date included 
				within the Enclave. Data aggregated by  aggregated by Vaccination Status and Severity. Medications were aggregated based on ingredient included in the medication. 
				Vaccination data comes only from EHR vaccination events recorded by N3C partner sites. This means that if a 
				patient received their vaccination from a site that does not automatically link to their EHR (ex. local 
				pharmacy, doctor's office, or state/federal vaccination site), their vaccination will not be represented 
				in the data. As most vaccination events are not occurring at N3C sites, patients shown here as 'Unknown' 
				may be vaccinated; however, we do not have the records to verify this. Vaccinated patient counts do not 
				indicate that the patient is fully vaccinated. We consider a vaccinated patient to have at least one dose 
				of Pfizer, Moderna, or Johnson & Johnson COVID-19 vaccines. Given that Pfizer and Moderna require two 
				vaccine doses to be considered fully vaccinated, patients shown here may be only partially vaccinated. 
				This same assumption applies to booster shots, as we do not consider shots beyond the first one recorded 
				within the patient's EHR.</p>
</div>


<script>
$(function () {
  $('[data-toggle="popover"]').popover()
})
</script>