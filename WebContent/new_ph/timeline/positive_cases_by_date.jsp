<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<script>

var ${param.block}_constraint_begin = null,
    ${param.block}_constraint_end = null;

function ${param.block}_constraint(begin, end) {
	console.log("constraint", begin, end)
	${param.block}_constraint_begin = begin;
	${param.block}_constraint_end = end;
	var table = $('#${param.target_div}-table').DataTable();
	table.draw();
}

$(document).ready( function () {
	$.fn.dataTable.ext.search.push(
		    function( settings, searchData, index, rowData, counter ) {
		    	if (${param.block}_constraint_begin == null)
		    		return true;
		    	if (${param.block}_constraint_begin <= searchData[0] && searchData[0] <= ${param.block}_constraint_end)
		    		return true;
		    	
		    	return false;
		    }
		);
		 
	$.getJSON("<util:applicationRoot/>/feeds/positive_cases_by_date.jsp?headers=y", function(data){
			
		var json = $.parseJSON(JSON.stringify(data));
	
		var col = [];
	
		for (i in json['headers']){
			col.push(json['headers'][i]['label']);
		}
	
	
		var table = document.createElement("table");
		table.className = 'table table-hover compact site-wrapper';
		table.style.width = '100%';
		table.id="${param.target_div}-table";
	
		var header= table.createTHead();
		var header_row = header.insertRow(0); 
	
		for (i in col) {
			var th = document.createElement("th");
			th.innerHTML = '<span style="color:#333; font-weight:600; font-size:14px;">' + col[i].toString() + '</span>';
			header_row.appendChild(th);
		}
	
		var divContainer = document.getElementById("${param.target_div}");
		divContainer.appendChild(table);
	
		var data = json['rows'];
	
		$('#${param.target_div}-table').DataTable( {
	    	data: data,
	    	dom: 'lfr<"datatable_overflow"t>Bip',
	    	buttons: {
	    	    dom: {
	    	      button: {
	    	        tag: 'button',
	    	        className: ''
	    	      }
	    	    },
	    	    buttons: [{
	    	      extend: 'csv',
	    	      className: 'btn btn-sm btn-light',
	    	      titleAttr: 'CSV export.',
	    	      text: 'CSV',
	    	      filename: 'symptom_before_after_covid_csv_export',
	    	      extension: '.csv'
	    	    }, {
	    	      extend: 'copy',
	    	      className: 'btn btn-sm btn-light',
	    	      titleAttr: 'Copy table data.',
	    	      text: 'Copy'
	    	    }]
	    	},
	       	paging: true,
	    	pageLength: 10,
	    	lengthMenu: [ 10, 25, 50, 75, 100 ],
	    	order: [[0, 'asc']],
	     	columns: [
	        	{ data: 'first_diagnosis_date', visible: true, orderable: true, className: 'text-center' },
	        	{ data: 'positive_cases_display', visible: true, orderable: true, className: 'text-right', orderData: [4] },
	        	{ data: 'cumsum_positivecases_display', visible: true, orderable: true, className: 'text-right', orderData: [5] },
	        	{ data: 'seven_day_rolling_avg_display', visible: true, orderable: true, className: 'text-right', orderData: [6] },
	        	{ data: 'positive_cases', visible: false, orderable: true, className: 'text-right' },
	        	{ data: 'cumsum_positivecases', visible: false, orderable: true, className: 'text-right' },
	        	{ data: 'seven_day_rolling_avg', visible: false, orderable: true, className: 'text-right' }
	    	],
	    	columnDefs: [
	    		{ targets: 1, render: $.fn.dataTable.render.number(',', '.', 0, '') },    		
	    		{ targets: 2, render: $.fn.dataTable.render.number(',', '.', 0, '') },    		
	    		{ targets: 3, render: $.fn.dataTable.render.number(',', '.', 0, '') },   		
	    	]
		} );
	
		
	});
});
</script>
