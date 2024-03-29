<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>

	#question-table2_filter{
		float: none;
		text-align: center;
	}
	#question-table2_filter input{
		width: 100%;
		margin-left: 0px;
	}
	#question-table2_filter label{
		text-align: center;
	}
	
	.large-ques-nav{
		padding-left: 0px;
		padding-right: 0px;
	}
	
	#question-table2 .row_selected{
		border-color: #006478;
	}
	
	#question-table2 .row_selected td{
		background: #006478;
	}

	
	#question-table2 td{
		border-top: 0px;
	}
	
	#question-table2 .row_selected a{
		color: white;
	}
	
	#question-table2 a {
    	cursor: pointer;
	}
	
	#question-table2 tbody tr:hover td{
  		border: none !important;
	}

	.cards tbody td {
		display: block;
	}
	
	.cards thead {
		display: none;
	}
	
	.cards td:before {
		content: attr(data-label);
		display: inline;
		position: relative;
		font-size: 85%;
		top: -0.5rem;
		float: left;
		color: #808080;
		min-width: 4rem;
		margin-left: 0;
		margin-right: 1rem;
		text-align: left;
	}
	
	
	
	#question-table3 a {
    	cursor: pointer;
	}
	
	#question-roster3 thead{
		display:none;
	}
	#question-roster3 .dataTables_filter{
		float:none;
		text-align:center;
	}
	#question-button{
		display:flex;
	}
	#question-panel{
		border: none;
    	box-shadow: none;
    	-webkit-box-shadow: none;
	}
	#question-button .dropdown-menu{
        height:300px;
        overflow-y:auto;
        width:100%;
    }
    
    .dataTables_paginate {
    	font-size: 11px;
	}

	​

	iframe{
		/* SVGs generated at https://icons8.com/preloaders/en/circular# */
		background:url(<util:applicationRoot/>/images/spinners/fading_wheel.svg) no-repeat center 100px;
		/* to resize, use background-size: 300px 300px; */
	}
	
#limitations_drop a[aria-expanded = "true"] span:after{
	font-family: "Font Awesome\ 5 Free"; 
	content: "\f056";
  	font-weight: 900;
}

#limitations_drop a[aria-expanded = "false"] span:after{
	font-family: "Font Awesome\ 5 Free"; 
	content: "\f055";
	font-weight: 900;
}
	​
</style>


<script>
$.getJSON("<util:applicationRoot/>/feeds/questions.jsp", function(data){
		
	var json = $.parseJSON(JSON.stringify(data));

	var col = [];

	for (i in json['headers']){
		col.push(json['headers'][i]['label']);
	}
	
	// table 1
	var table = document.createElement("table");
		table.className = 'table table-hover';
		table.style.width = '100%';
		table.style.textAlign = "left";
		table.style.tableLayout = 'fixed';
		table.id="question-table2";
	
	// table 2
	var table2 = document.createElement("table");
		table2.className = 'table table-hover';
		table2.style.width = '100%';
		table2.style.textAlign = "left";
		table2.id="question-table3";

	// table 1 headers
	var header= table.createTHead();
	var header_row = header.insertRow(0); 
	// table 2 headers
	var header2 = table2.createTHead();
	var header_row2 = header2.insertRow(0); 

	for (i in col) {
		var th = document.createElement("th");
		th.innerHTML = '<span style="color:#333; font-weight:600; font-size:16px;">' + col[i].toString() + '</span>';
		header_row.appendChild(th);
		header_row2.appendChild(th);
	}
	
	// table 1 append
	var divContainer = document.getElementById("question-roster2");
		divContainer.innerHTML = "";
		divContainer.appendChild(table);
	// table 2 append
	var divContainer2 = document.getElementById("question-roster3");
		divContainer2.innerHTML = "";
		divContainer2.appendChild(table2);	
	

	var data = json['rows'];

	(async() => {
		$("body").css("cursor", "wait");
		
		$("body").css("cursor", "default");
				    
		$('#question-table2').addClass("cards");
		$('#question-table2').DataTable( {
			"dom": '<lf<t>ip>',
			data: data,
	       	select: true,
	       	paging: false,
	    	pageLength: 15,
	    	initComplete: function () {
	    		var index = 0;
	    		<c:if test="${not empty param.tertiary_tab}">
	    			index = data.findIndex(object => {
	  					return object.iframe_info === '${param.tertiary_tab}';
	  				});
	    		</c:if>
	    		if (index <  0)
	    			index = 0;
	    		console.log("initial index", index)
	    		$('#question-table2 tbody tr:eq('+index+')').addClass('row_selected');},
	    	lengthMenu: [ 15, 25, 50, 75, 100 ],
	    	order: [[7, 'asc']],
	    	columns: [
	        	{ 
	        		data: 'qeustion',
	        		orderable: false,
	        		render: function ( data, type, row ) {
	        			var question = row.question;
	        			var asked = row.asked;
	        			var desc = row.description;
	        			var limitations = row.limitations;
	        			var iframe = row.iframe_info;
	        			var iframe_content = row.iframe_content;
	        			var iframe_style = row.iframe_style;
	        			var combo = 
	        				'<div class="panel-group" style="margin-bottom:0px;" id="' + iframe.replace(/\s+/g, '').toLowerCase() + '_stub">'
	        					+'<div class="panel panel-default" style="background:none; border:none; box-shadow:none;">'
	        							+'<h5><a onclick="theclick.call(this); frame_render(\''+ question.replace(/'/g, "\\'") + '\',\''+ desc.replace(/\"/g,"'").replace(/'/g, "\\'").replace(/\r?\n/g,"") +'\',\''+ asked+ '\',\''+ limitations.replace(/\"/g,"'").replace(/'/g, "\\'").replace(/\r?\n/g,"") + '\',\'' + iframe +'\');">' + question + '</a></h5>'
	       						+'</div>'
	        				+'</div>';
	             		return combo; }
	             },
	        	{ data: 'description', visible: false },
	        	{ data: 'asked', visible: false },
	        	{ data: 'limitations', visible: false},
	        	{ data: 'iframe_info', visible: false},
	        	{ data: 'iframe_content', visible: false},
	        	{ data: 'iframe_style', visible: false},
	        	{ data: 'seqnum', visible: false}
	    	]
		} );
		
		$('#question-table3').DataTable( {
			"dom": '<lf<t>ip>',
			data: data,
	       	select: true,
	       	paging: false,
	       	searching: false,
	       	bInfo : false,
	    	pageLength: 15,
	    	lengthMenu: [ 5, 15, 25, 50, 75, 100 ],
	    	order: [[7, 'asc']],
	    	columns: [
	        	{ 
	        		data: 'qeustion',
	        		orderable: false,
	        		render: function ( data, type, row ) {
	        			var question = row.question;
	        			var asked = row.asked;
	        			var desc = row.description;
	        			var limitations = row.limitations;
	        			var iframe = row.iframe_info;
	        			var iframe_content = row.iframe_content;
	        			var iframe_style = row.iframe_style;
	        			var combo = 
	        				'<div class="panel-group" style="margin-bottom:0px;" id="' + iframe.replace(/\s+/g, '').toLowerCase() + '_stub">'
	        					+'<div class="panel panel-default" style="background:none; border:none; box-shadow:none;">'
	        					+'<h5><a class="color-link" onclick="changeclick.call(); frame_render(\''+ question.replace(/'/g, "\\'") + '\',\''+ desc.replace(/\"/g,"'").replace(/'/g, "\\'").replace(/\r?\n/g,"") +'\',\''+ asked+ '\',\''+ limitations.replace(/\"/g,"'").replace(/'/g, "\\'").replace(/\r?\n/g,"") + '\',\'' + iframe +'\');">' + question + '</a></h5>'
	       						+'</div>'
	        				+'</div>';
	             		return combo; }
	             },
	        	{ data: 'description', visible: false },
	        	{ data: 'asked', visible: false },
	        	{ data: 'limitations', visible: false},
	        	{ data: 'iframe_info', visible: false},
	        	{ data: 'iframe_content', visible: false},
	        	{ data: 'iframe_style', visible: false},
	        	{ data: 'seqnum', visible: false}
	    	]
		});
		
		var index = data.findIndex(object => {
			  return object.iframe_info === '${param.tertiary_tab}';
			});
		if ($('.ph-tab .active > a').attr("href") == '#ph-summary')
			cache_browser_history("public-health", "public-health/summary" + (index == -1 ? '' : "/${param.tertiary_tab}"))
		if (index < 0)
			index = 0;

		document.getElementById("question-tile").removeAttribute("style");
		frame_render(
						data[index].question.replace(/'/g, "\\'"),
						data[index].description.replace(/'/g, "\\'"),
						data[index].asked,
						data[index].limitations.replace(/\"/g,"'").replace(/'/g, "\\'").replace(/\r?\n/g,""),
						data[index].iframe_info
					);
	})();
});


var theclick = function(){
	$("#question-table2 tbody tr").removeClass('row_selected');        
    $(this).closest( "tr" ).addClass('row_selected');
};

var changeclick = function(){
	$("#question-table2 tbody tr").removeClass('row_selected');        
};

function question_detail_toggle() {
	var divContainer = document.getElementById("question-detail-toggle");
	var panel = document.getElementById("iframe_details");
	if (panel.style.display === "block") {
		divContainer.innerHTML = "<i class='fas fa-chevron-right'></i> Limitations";
		panel.style.display = "none";
	} else {
		divContainer.innerHTML = "<i class='fas fa-chevron-down'></i> Limitations";
		panel.style.display = "block";
	}
	
}



function frame_render(question, description, asked, limitations, iframe) {
	console.log("iframe", iframe)
	cache_browser_history("public-health", "public-health/"+iframe)
	var divContainer = document.getElementById("question-tile");
	divContainer.innerHTML = 
		'<h2 class="header-text">' + question + '</h2>'
	  +'<p>' + description + '</p>'
	  +'<div id="d3viz"></div>'
		+'<br>'+
		'<div id="limitations-section">\
			<div class="accordion" id="limitations_drop">\
				<div class="card">\
					<div class="card-header" id="limitheadingOne">\
  						<h4 class="mb-0">Limitations \
    						<a alt="expand/collapse limitations section button" href="" style="display:inline; float:right;" class="btn btn-link btn-block text-left collapsed icon-btn p-0 accordion-toggle" data-toggle="collapse" data-target="#limitcollapseOne" aria-expanded="false" aria-controls="collapseOne">\
      							<span>&nbsp;</span>\
    						</a>\
  						</h4>\
					</div>\
					<div id="limitcollapseOne" class="collapse" aria-labelledby="limitheadingOne" data-parent="#limitations_drop">\
  						<div class="card-body">' +
   							limitations + 
  						'</div>\
					</div>\
				</div>\
			</div>\
		</div>'
// 		'<a class="accordion-toggle" data-toggle="collapse" data-parent="#iframe_accordion" href="#iframe_details" onclick="question_detail_toggle()"><span id="question-detail-toggle"><i class="fas fa-chevron-right"></i> Limitations</span></a>'
// 		+'<div id="iframe_accordian">'
// 			+'<div id="iframe_details" class="panel-body panel-collapse collapse">'
// 	  			+'<p><strong>Limitations:</strong> ' + limitations + '</p>'
// 	  		+'</div>'
// 	  	+'</div>'
	;
	$("#d3viz").load("<util:applicationRoot/>/new_ph/frame.jsp?iframe="+iframe);
}

function limitlink(){
	$('#limitcollapseOne').collapse('show');
	$('html, body').animate({
        scrollTop: $("#limitations-section").offset().top
    }, 500);
}

</script>