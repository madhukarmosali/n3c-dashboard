<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<style>
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
</style>

<div id="choose_dash">
	<h3>Choose a Dashboard:</h3>
	<select id="dashboard_select">
	</select>
</div>


<script>
$(document).ready(function() {
    $('#dashboard_select').select2({
    	width: "100%",
    	selectionCssClass: "dash_select",
    	searchInputPlaceholder: 'Search Dashboards...'
    });
});

$.getJSON("<util:applicationRoot/>/feeds/questions.jsp", function(data){
	
	var json = $.parseJSON(JSON.stringify(data));

	var data = json['rows'];
	
	for (i in data){
		var option = document.createElement('option');
		option.text = data[i].question;
		option.value = data[i].question.replace('/g, "\\') + 'arguement_value:' + data[i].description.replace(/\"/g,"'").replace(/'/g, "\\'").replace(/\r?\n/g,"") + 'arguement_value:' + data[i].asked + 'arguement_value:' + data[i].limitations.replace(/\"/g,"'").replace(/'/g, "\\'").replace(/\r?\n/g,"") + 'arguement_value:' + data[i].iframe_info + 'arguement_value:' + data[i].seqnum;
		document.getElementById("dashboard_select").appendChild(option);
	}

	(async() => {
		$("body").css("cursor", "wait");
		
		$("body").css("cursor", "default");
		
		var index = data.findIndex(object => {
			return object.iframe_info === '${param.tertiary_tab}';
		});
		
		if ($('.ph-tab .active > a').attr("href") == '#ph-summary'){
			cache_browser_history("new-ph", "new-ph/summary" + (index == -1 ? '' : "/${param.tertiary_tab}"))
		};
		
		if (index < 0) {index = 0;};
			
		document.getElementById("question-tile").removeAttribute("style");
		
		console.log('data');
		console.log(data);
		
		console.log('index');
		console.log(index);
		
		console.log('data-index');
		console.log(data[index]);
		
		frame_render(data[index].question.replace('/g, "\\') , data[index].description.replace(/\"/g,"'").replace(/'/g, "\\'").replace(/\r?\n/g,""), data[index].asked, data[index].limitations.replace(/\"/g,"'").replace(/'/g, "\\'").replace(/\r?\n/g,""), data[index].iframe_info, data[index].seqnum);
		
		$('#dashboard_select').val(data[index].question.replace('/g, "\\') + 'arguement_value:' + data[index].description.replace(/\"/g,"'").replace(/'/g, "\\'").replace(/\r?\n/g,"") + 'arguement_value:' + data[index].asked + 'arguement_value:' + data[index].limitations.replace(/\"/g,"'").replace(/'/g, "\\'").replace(/\r?\n/g,"") + 'arguement_value:' + data[index].iframe_info + 'arguement_value:' + data[index].seqnum);
		
	})();
});



function frame_render(question, description, asked, limitations, frame, seqnum) {
// 	$.getJSON("<util:applicationRoot/>/feeds/questions2.jsp", function(data){
// 		var question = data[seqnum]['question'];
// 		var description = data[seqnum]['description'];
// 		var asked = data[seqnum]['asked'];
// 		var limitations = data[seqnum]['limitations'];
// 		var frame = data[seqnum]['iframe_info'];	
		
	
		console.log(frame);
		
		cache_browser_history("new-ph", "new-ph/summary/"+frame);
		var divContainer = document.getElementById("question-tile");
		
		divContainer.innerHTML = 
			'<p>' + description + '</p>'
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
		;
		$("#d3viz").load("<util:applicationRoot/>/new_ph/frame.jsp?frame="+frame+"&quaternary_tab=${param.quaternary_tab}");
		
		
// 	});
}

function limitlink(){
	$('#limitcollapseOne').collapse('show');
	$('html, body').animate({
        scrollTop: $("#limitations-section").offset().top
    }, 500);
}

$(document).ready(function () {
	$('#dashboard_select').change(function () {
		frame_vars = $(this).val().split('arguement_value:');
		frame_render(frame_vars[0], frame_vars[1], frame_vars[2], frame_vars[3], frame_vars[4], Number(frame_vars[5]) );
	})
});

</script>

