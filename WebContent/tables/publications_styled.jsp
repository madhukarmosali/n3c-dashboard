<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$.getJSON("feeds/papers.jsp", function(data){
		
	var json = $.parseJSON(JSON.stringify(data));

	var col = [];

	for (i in json['headers']){
		col.push(json['headers'][i]['label']);
	}


	var table = document.createElement("table");
	table.className = 'table table-hover';
	table.style.width = '100%';
	table.style.textAlign = "left";
	table.id="paper-table";


	var divContainer = document.getElementById("paper-list");
	divContainer.innerHTML = "";
	divContainer.appendChild(table);

	var data = json['rows'];

	$('#paper-table').DataTable( {
    	data: data,
       	paging: true,
    	pageLength: 5,
    	lengthMenu: [ 5, 10, 25, 50, 75, 100 ],
    	order: [[4, 'desc']],
    	columns: [
        	{
        		data: 'title',
        		orderable: false,
        		render: function ( data, type, row ) {
        			var title = row.title;
        			var pmid = row.pmid;
        			var pmcid = row.pmcid;
        			var journal = row.journal;
        			var published = row.published;
        			var combo = 
        				'<div class="panel-group" style="margin-bottom:0px;" id="' 
        				+ pmid + '_accordion' +
        				'"><div class="panel panel-default" style="background:none; border:none; box-shadow:none;"><div class="panel-heading" style="background:none; text-align:left;"><h4><a class="accordion-toggle" data-toggle="collapse" data-parent="#'
        				+ pmid + '_accordion' + 
        				'" href="#'
        				+ pmid + '_description' +
        				'">'
        				+ title + 
        				'</a></h4></div><div id="'
        				+ pmid + '_description' +
        				'" class="panel-collapse collapse"><div class="panel-body" style="border:none;">'
        				+ journal + '<\/p>PMID: ' + pmid
        				+ '</div></div></div></div>';
             		return combo; }
             },
        	{ data: 'title', visible: false },
        	{ data: 'pmid', visible: false },
        	{ data: 'pmcid', visible:false},
        	{ data: 'journal', visible: false},
        	{ data: 'published', visible: false}
    	]
	} );

	
});
</script>