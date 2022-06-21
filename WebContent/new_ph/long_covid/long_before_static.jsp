<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.shared, .bar, .label {
  font-size: 14px;
  font-weight: 400;
}
</style>

<script>


// set the dimensions and margins of the graph
var ${param.block}_long_margin = {top: 20, right: 90, bottom: 30, left: 210},
	${param.block}_long_width = 445 - ${param.block}_long_margin.left - ${param.block}_long_margin.right,
	${param.block}_long_height = 445 - ${param.block}_long_margin.top - ${param.block}_long_margin.bottom;

var ${param.block}_long_gap = 4;
var ${param.block}_long_barLabelPadding = 5;
var ${param.block}_long_valueLabelWidth = 0; // space reserved for value labels (right)
var min_height = 150;

var ${param.block}_long_paddingInside = 0.2;

var ${param.block}_long_barLabel = function(d) { return d.condition_after_covid_positive; };
var ${param.block}_long_barValue = function(d) { return parseFloat(d.patient_count); };

// read json data
d3.json("<util:applicationRoot/>/new_ph/long_covid/feeds/before_after.jsp?symptom=${param.symptom}", function(error, data) {
	if (error) throw error;
	
	var data = data.rows; 
	
	var ${param.block}_longmyObserver = new ResizeObserver(entries => {
		entries.forEach(entry => {
			var newWidth = Math.floor(entry.contentRect.width);
			if (newWidth > 0) {
				d3.select("#${param.block}-long").select("svg").remove();
				${param.block}_long_width = newWidth - ${param.block}_long_margin.left - ${param.block}_long_margin.right;
				${param.block}_long_height = ${param.block}_long_width/5;
				maxBarWidth = ${param.block}_long_width - ${param.block}_long_margin.left - ${param.block}_long_barLabelPadding - ${param.block}_long_valueLabelWidth;
				if (${param.block}_long_height < min_height) {
					${param.block}_long_height = min_height;
				};
				draw();
			}
		});
	});

	${param.block}_longmyObserver.observe(d3.select("#${param.block}-long").node());

	draw();

	function draw(){
		
		console.log('reached_viz');
		
		var svg = d3.select("#${param.block}-long").append("svg")
		.attr("width", ${param.block}_long_width + ${param.block}_long_margin.left + ${param.block}_long_margin.right)
		.attr("height", ${param.block}_long_height + ${param.block}_long_margin.top + ${param.block}_long_margin.bottom);
		
		var y = d3.scaleBand()			
			.range([0, ${param.block}_long_height - ${param.block}_long_margin.bottom])	
			.paddingInner(${param.block}_long_paddingInside)
			.align(0.1)
			.domain(data.map(function(d) { return d.condition_after_covid_positive; }));
	
		var yText = function(d, i) { return y(d, i) + y.bandwidth() / 2; };
	
		var x = d3.scaleLinear()
			.domain([0, d3.max(data, function(d){ return d.patient_count; })])
			.range([0, ${param.block}_long_width - ${param.block}_long_margin.right]);

		var svgDefs = svg.append('defs');

    	var mainGradient = svgDefs.append('linearGradient')
        	.attr('id', '${param.block}_longmainGradient');

    	// Create the stops of the main gradient.
    	mainGradient.append('stop')
        	.style('stop-color', "#633F8A")
        	.attr('offset', '0');

    	mainGradient.append('stop')
        	.style('stop-color', "#6c508a")
        	.attr('offset', '99%');
	
		var g = svg.append("g")
			.attr("transform", "translate(" + ${param.block}_long_margin.left + "," + ${param.block}_long_margin.top + ")");

		g.append("g")
			.attr("class", "axis")
			.attr("transform", "translate(0,0)") 						
			.call(d3.axisLeft(y));	

		// axis labels & ticks
		var axisContainer = g.append('g')
			.attr("class", "axis xaxis")
			.attr("transform", "translate(0," + (${param.block}_long_height-${param.block}_long_margin.bottom) + ")")				
			.call(d3.axisBottom(x).ticks(Math.round(${param.block}_long_width/100), "s"))
			.append("text")										
			.attr("fill", "#000")
			.attr("font-weight", "bold")
			.attr("text-anchor", "start")
			.text("Patient Count")
			.attr("transform", "translate(" + ((${param.block}_long_width/2)- ${param.block}_long_margin.right) + "," + 40 + ")"); 
		
		d3.selectAll("g.xaxis g.tick")
	    	.append("line")
	    	.attr("class", "gridline")
	    	.attr("x1", 0)
	    	.attr("y1", -${param.block}_long_height+${param.block}_long_margin.top)
	    	.attr("x2", 0)
	    	.attr("y2", 0);
		
		// bars		
		var barsContainer = g.append('g')
			.selectAll("rect")
			.data(data)
			.enter().append("rect")
			.attr("class", "bar")
			.attr("y", function(d) { return y(d.condition_after_covid_positive); })
			.attr('height', y.bandwidth())
			.attr('width', function(d) { return x(d.patient_count); })
			.attr('stroke', 'white')
			.attr('fill', 'url(#${param.block}_longmainGradient)');
	
	
	
		function nFormatter(num, digits) {
			  const lookup = [
			    { value: 1, symbol: "" },
			    { value: 1e3, symbol: "k" },
			    { value: 1e6, symbol: "M" },
			    { value: 1e9, symbol: "G" },
			    { value: 1e12, symbol: "T" },
			    { value: 1e15, symbol: "P" },
			    { value: 1e18, symbol: "E" }
			  ];
			  const rx = /\.0+$|(\.[0-9]*[1-9])0+$/;
			  var item = lookup.slice().reverse().find(function(item) {
			    return num >= item.value;
			  });
			  return item ? (num / item.value).toFixed(digits).replace(rx, "$1") + item.symbol : "0";
			}
		
		// bar value labels
		g.append('g').selectAll("text").data(data).enter().append("text")
			.attr("x", function(d) { return x(${param.block}_long_barValue(d)) + 5; })
			.attr("y", function(d,i) { return (y(d.condition_after_covid_positive)) + ((y.bandwidth()*${param.block}_long_paddingInside)/4) + (y.bandwidth()/2) ; })
			.attr("class", "secondary")
			.style("text-anchor", "start")
			.style("font-size", "12px")
			.style("fill", "#a5a2a2")
			.text(function(d) { return nFormatter(${param.block}_long_barValue(d), 2); });


			
		
	}
})
</script>