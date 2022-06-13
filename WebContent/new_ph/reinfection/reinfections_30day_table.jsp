<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<script>


$(document).ready( function () {
	$.getJSON("<util:applicationRoot/>/new_ph/reinfection/feeds/reinfections_30day.jsp", function(data){
			
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
		
		
		$.fn.dataTable.moment('MM/DD/YYYY');
	
		$('#${param.target_div}-table').DataTable( {
	    	data: data,
	    	dom: 'lfrtBip',
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
	        	{ data: 'time_range', visible: true, orderable: true, className: 'text-center', orderData: [2]  },
	        	{ data: 'count', visible: true, orderable: true, className: 'text-center', orderData: [3]},
	        	{ data: 'start', visible: false, orderable: true},
	        	{ data: 'actual_count', visible: false, orderable: true, className: 'text-right'}
	    	]
		} );
	
		
	});
});


</script>

