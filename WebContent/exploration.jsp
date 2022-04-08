<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!DOCTYPE html>
<html>

<style>
.section{
	margin-bottom:100px;
}

.section-description{
	margin-top: 30px;
	margin-bottom: 60px;
}
</style>

<jsp:include page="head.jsp" flush="true" />

<body>
	<jsp:include page="navbar.jsp" flush="true">
  		<jsp:param name="page" value="explore"/>
	</jsp:include>
	
	<div class="row page_nav">
			<a href="#data" class="btn btn-primary" role="button">Data</a>
			<a href="#cohort" class="btn btn-primary" role="button">Cohort</a>
			<a href="#sites" class="btn btn-primary" role="button">Sites</a>
			<a href="#projects" class="btn btn-primary" role="button">Projects</a>
			<a href="#publications" class="btn btn-primary" role="button">Publications</a>
		</div>
		
	<div class="container content">
		<div id="data" class="text-max mx-auto">
			<div class="row text-center">
				<div class="col-12">
					<h3>How big is the N3C Data Enclave?</h3>
				</div>
			</div>
			<div class="row section">
				<div class="col-12">
					<jsp:include page="modules/fact_sheet.jsp" />
				</div>
			</div>
			<hr>
		</div>
		
		<div id="cohort">
			<div class="row text-center">
				<div class="col-12">
					<h3>Who are the Patients?</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<h4 class="section-description text-max mx-auto">The N3C Data Enclave contains data both about patients who 
					have had COVID-19 and those who have not. For those who have, further classification of <em>lab-confirmed</em>, 
					<em>suspected</em>, and <em>possible</em> is applied. For more detailed information about the inclusion criteria, please 
					see the <a href="https://github.com/National-COVID-Cohort-Collaborative/Phenotype_Data_Acquisition/wiki/Latest-Phenotype">N3C Phenotype</a>. 
					Below you can explore the general demographic and severity coverage of the N3C. </h4>
				</div>	
			</div>
			
			<div class="row section">
				<div class="col-12">
					<c:import url="modules/explorer.jsp"/>
				</div>	
			</div>
			<hr>
		</div>
		
		<div id="sites">
			<div class="row text-center">
				<div class="col-12">
					<h3>Where are they from?</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<h4 class="section-description text-max mx-auto">The N3C allows medical sites within the United States to securely transfer 
					anonymized data into the Enclave. The average interval for data transfer from our partners is once a week. 
					To explore the geographic coverage of our current partners, please see the map below.</h4>
				</div>
			</div>
			<div class="section mx-auto text-max">
				<div class="col-12">
					<c:import url="modules/site_map.jsp"/>
				</div>
			</div>
			<hr>
		</div>

		
		<div id="projects">
			<div class="row text-center">
				<div class="col-12">
					<h3>What are Researchers Studying?</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<h4 class="section-description text-max mx-auto">N3C projects are internal and user-led initiatives exploring targeted research questions within 
					the N3C Data Enclave. Many projects are affiliated with <a href="https://covid.cd2h.org/domain-teams" alt="domain team page">Domain Teams</a>, which attempt to coordinate 
					related research efforts, enable more efficient collaboration, and provide other support to the 
					researchers who wish to join. </h4>	
				</div>
			</div>
			<div class="section">
				<div class="row justify-content-center">
					<div class="col-12 col-sm-10">
						<div id="project-roster" class="text-max mx-auto"></div>
						<c:import url="modules/project_roster.jsp"/>
					</div>
				</div>
			</div>
			<hr>
		</div>

		<div id="publications">
			<div class="row text-center">
				<div class="col-12">
					<h3>What is the Scholarly Output?</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<h4 class="section-description text-max mx-auto">Team science and attribution are central to the N3C's mission. 
					Because of this, N3C strives to create a conducive environment for research publication by providing 
					hands-on assistance during the manuscript preparation process and by highlighting research dissemination 
					in both traditional and non-traditional venues, including academic journals, preprint forums, 
					and public presentations. </h4>
				</div>
			</div>
			<div class="section">
				<div class="row justify-content-center">
					<div class="col-12 col-sm-10">
						<div id="pub_table_section">
							<div style="text-align:center; margin-bottom:30px;">
								<div class="form-check form-check-inline">
		  							<input name="pub_type" class="form-check-input filter" type="checkbox" id="inlineCheckbox1" value="Publication">
		  							<label class="form-check-label" for="inlineCheckbox1"><i class="fas fa-book-open"></i>  Publication</label>
								</div>
								<div class="form-check form-check-inline">
		  							<input name="pub_type" class="form-check-input filter" type="checkbox" id="inlineCheckbox2" value="Preprint">
		  							<label class="form-check-label" for="inlineCheckbox2"><i class="fas fa-file"></i>  Preprint</label>
								</div>
								<div class="form-check form-check-inline">
		 							<input name="pub_type" class="form-check-input filter" type="checkbox" id="inlineCheckbox3" value="Presentation">
		  							<label class="form-check-label" for="inlineCheckbox3"><i class="fas fa-microphone"></i>  Presentation</label>
								</div>
							</div>
							<div id="publications-list" class="text-max mx-auto"></div>
							<c:import url="modules/publications.jsp"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	

	<jsp:include page="footer.jsp" flush="true" />
	
	<c:import url="modules/scroll_down.jsp"/>
	<c:import url="modules/popover_init.jsp"/>
	
</body>
</html>