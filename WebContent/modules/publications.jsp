<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<style>
	.Publication:before{
		content: "\f518  ";
		font-family: "Font Awesome\ 5 Free"; 
  		font-weight: 900;
	}
	
	.Presentation:before{
		content: "\f130  ";
		font-family: "Font Awesome\ 5 Free"; 
  		font-weight: 900;
	}

	.Preprint:before{
		content: "\f15b  ";
		font-family: "Font Awesome\ 5 Free"; 
  		font-weight: 900;
	}
</style>


<script>
$.getJSON("<util:applicationRoot/>/feeds/publications.jsp", function(data){
		
	var json = $.parseJSON(JSON.stringify(data));

	var col = [];

	for (i in json['headers']){
		col.push(json['headers'][i]['label']);
	}


	var table = document.createElement("table");
	table.className = 'table table-hover table-expand';
	table.style.width = '100%';
	table.style.textAlign = "left";
	table.id="publications_table";

	var header= table.createTHead();
	var header_row = header.insertRow(0); 

	for (i in col) {
		var th = document.createElement("th");
		th.innerHTML = '<span style="color:#333; font-weight:600; font-size:16px;">' + col[i].toString() + '</span>';
		header_row.appendChild(th);
	}

	var divContainer = document.getElementById("publications-list");
	divContainer.innerHTML = "";
	divContainer.appendChild(table);

	var data = json['rows'];

	$('#publications_table').DataTable( {
    	data: data,
       	paging: true,
       	language: {
            searchPlaceholder: "title, author, journal ..."
        },
    	pageLength: 5,
    	drawCallback: function( settings ) {$("#publications_table thead").remove(); } ,
    	lengthMenu: [ 5, 10, 25, 50, 75, 100 ],
    	order: [[5, 'desc']],
     	columns: [
     		{ data: 'title', 
     			orderable: false, 
     			render: function ( data, type, row ) {
     				var id = row.id;
        			var title = row.title;
        			var type = row.type
        			var url = row.url;
        			var outlet = row.outlet;
        			var date = row.date;
        			var authors = row.authors;
        			var combo = 
        				'<div class="panel-group" style="margin-bottom:0px;" id="pub'
        				+ id + '_pubs' +
        				'"><div class="panel panel-default" style="background:none; border:none; box-shadow:none;"><div class="panel-heading" style="background:none; text-align:left;"><div class="row"><div class="col-11"><h4 class="mb-3">'
        				+ title + 
        				' </h4> <p class="' + row.type + '">' + row.type + '</p>'
        				+ '</div><div class="col-1" style="margin: auto;"><p class="mb-0" style="text-align: right; font-size:16px;"><a aria-expanded="false" class="accordion-toggle" data-toggle="collapse" data-parent="#'
        				+ 'pub'+ id + '_pubs' + 
        				'" href="#'
        				+ 'pub'+ id + '_pub_description' +
        				'"> </a></p></div></div></div><div id="'
        				+ 'pub'+ id + '_pub_description' +
        				'" class="panel-collapse collapse"><div class="panel-body" style="border:none;">' + 
        				'<strong>Date:<\/strong> ' + date + ' <br> <strong>Authors: <\/strong> '
        				+ authors + '<\/p>' + outlet + ' <br> <a href="' + url + '">'+ url + '<a/>'
        				+ '</div></div></div></div>';
             		return combo; }
     		},
        	{ data: 'type', visible: false },
        	{ data: 'id', visible: false },
        	{ data: 'url', visible: false },
        	{ data: 'outlet', visible: false },
        	{ data: 'date', visible: false },
        	{ data: 'authors', visible: false }
    	]
	} );

	
});


$(document).ready( function () {
	$.fn.dataTable.ext.search.push(
		function( settings, searchData, index, rowData, counter ) {
			var positions = $('#pub_table_section input:checkbox[name="pub_type"]:checked').map(function() {
				return this.value;
			}).get();
		   
			if (positions.length === 0) {
				return true;
			} else if (positions.indexOf(searchData[1]) !== -1) {
				return true;
			} else {
				return false;
			}
		}
	);
	  
	$('#pub_table_section input:checkbox').on('change', function () {
		$('#publications_table').DataTable().draw();
	});

});
</script>