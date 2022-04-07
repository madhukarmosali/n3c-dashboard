<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<script>
$.getJSON("<util:applicationRoot/>/feeds/domain_team_roster.jsp", function(data){
		
	var json = $.parseJSON(JSON.stringify(data));

	var col = [];

	for (i in json['headers']){
		col.push(json['headers'][i]['label']);
	}


	var table = document.createElement("table");
	table.className = 'table table-hover table-expand';
	table.style.width = '100%';
	table.style.textAlign = "left";
	table.id="domain-team-table";

	var header= table.createTHead();
	var header_row = header.insertRow(0); 

	for (i in col) {
		var th = document.createElement("th");
		th.innerHTML = '<span style="color:#333; font-weight:600; font-size:16px;">' + col[i].toString() + '</span>';
		header_row.appendChild(th);
	}

	var divContainer = document.getElementById("domain-team-roster");
	divContainer.innerHTML = "";
	divContainer.appendChild(table);

	var data = json['rows'];

	$('#domain-team-table').DataTable( {
		data: data,
		paging: true,
		drawCallback: function( settings ) {$("#domain-team-table thead").remove(); } ,
		language: {
            searchPlaceholder: "title, description, ..."
        },
		pageLength: 5,
		lengthMenu: [ 5, 10, 25, 50, 75, 100 ],
		order: [[0, 'asc']],
		columns: [
			{ data: 'title',
			orderable: false,
			render: function ( data, type, row ) {
				var id = 'domain' + row.nid;
				var title = row.title;
				var desc = row.description;
				
				var cross = "";
				if (row.cross_cutting){
					var cross = "Cross Cutting";
				}
				
				var created = row.created;
     			  
				var combo = 
    				'<div class="panel-group" style="margin-bottom:0px;" id="' 
    				+ id + '_accordion' +
    				'"><div class="panel panel-default" style="background:none; border:none; box-shadow:none;"><div class="panel-heading" style="background:none; text-align:left;"><div class="row" style="margin-right:0px;"><div class="col-11"><h4 class="mb-0">'
    				+ title + 
    				' </h4></div><div class="col-1" style="margin: auto;"> <p class="mb-0" style="text-align: right; font-size:16px;"><a aria-expanded="false" class="accordion-toggle" data-toggle="collapse" data-parent="#'
    				+ id + '_accordion' + 
    				'" href="#'
    				+ id + '_description' +
    				'"> </a></p></div></div></div><div id="'
    				+ id + '_description' +
    				'" class="panel-collapse collapse"><div class="panel-body" style="border:none;">'
    				+ desc + '<\/p>' + '<strong>' + cross + '<\/strong> <br> <strong>Created: ' + created + '<\/strong>'
    				+ '</div></div></div></div>';
         		return combo; }
        	  },
        	  { data: 'description', visible: false },
        	  { data: 'nid', visible: false },
        	  { data: 'cross_cutting', visible:false},
        	  { data: 'created', visible: false}
    	]
	} );
});
	
	
</script>

