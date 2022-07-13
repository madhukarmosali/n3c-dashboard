<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<script>

$.getJSON("<util:applicationRoot/>/new_ph/paxlovid/feeds/less20_drugs.jsp", function(data){
		
	var json = $.parseJSON(JSON.stringify(data));

	var col = [];

	for (i in json['headers']){
		col.push(json['headers'][i]['label']);
	}


	var table = document.createElement("table");
	table.className = 'table table-hover compact site-wrapper';
	table.style.width = '100%';
	table.id="drugs_table_3-table";

	var header= table.createTHead();
	var header_row = header.insertRow(0); 

	for (i in col) {
		var th = document.createElement("th");
		th.innerHTML = '<span style="color:#333; font-weight:600; font-size:14px;">' + col[i].toString() + '</span>';
		header_row.appendChild(th);
	}

	var divContainer = document.getElementById("drugs_table_3");
	divContainer.appendChild(table);

	var data = json['rows'];

	${param.block}_datatable = $('#drugs_table_3-table').DataTable( {
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
    	      filename: 'severity_csv_export',
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
        	{ data: 'medication', visible: true, orderable: true },
        	{ data: 'KnownPositive', visible: true, orderable: true, orderData: [5] },
        	{ data: 'UnknownCovidTestStatus', visible: true, orderable: true, orderData: [7] },
        	{ data: 'KnownNegative', visible: true, orderable: true, orderData: [6] },
        	{ data: 'total', visible: true, orderable: true, },
        	{ data: 'positive_sort', visible: false},
        	{ data: 'negative_sort', visible: false},
        	{ data: 'unknown_sort', visible: false}
    	]
	} );


	
});

</script>
