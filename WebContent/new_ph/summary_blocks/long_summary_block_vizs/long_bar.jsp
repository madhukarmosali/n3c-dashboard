<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.shared, .bar, .label {
  font-size: 16px;
}

.${param.container}stop-left {
 	stop-color: ${param.color_left};  /* Indigo */
}

.${param.container}stop-right {
	stop-color: ${param.color_right};  /* Teal */
}

.${param.container}longbar_bar {
	fill: url(#${param.container}mainGradient);
}

</style>
<script>


// set the dimensions and margins of the graph
var ${param.container}_margin = {top: 0, right: 0, bottom: 10, left: 0},
	${param.container}_width = 445 - ${param.container}_margin.left - ${param.container}_margin.right,
	${param.container}_height = 445 - ${param.container}_margin.top - ${param.container}_margin.bottom;

var gap = 60;

// read json data
d3.json("<util:applicationRoot/>/new_ph/summary_blocks/long_summary_block_vizs/${param.feed}", function(error, data) {
	if (error) throw error;
	
	var data = data.rows; 
	
	var ${param.container}myObserver = new ResizeObserver(entries => {
		entries.forEach(entry => {
			var newWidth = Math.floor(entry.contentRect.width);
			if (newWidth > 0) {
				d3.select("#${param.container}").select("svg").remove();
				${param.container}_width = newWidth - ${param.container}_margin.left - ${param.container}_margin.right;
				if ((${param.container}_width/2 - ${param.container}_margin.top - ${param.container}_margin.bottom) > ${param.min_height}){
					${param.container}_height = ${param.container}_width/2 - ${param.container}_margin.top - ${param.container}_margin.bottom;
				} else { 
					${param.container}_height = ${param.min_height};
				}

				draw();
				
			}
		});
	});

	${param.container}myObserver.observe(d3.select("#${param.container}").node());

	draw();

	function draw(){
		

		var dataRange = d3.max(data.map(function(d) { return Math.max(d.count) }));
		
		/* edit with care */
		var barWidth = ${param.container}_height / data.length,
		    yScale = d3.scaleLinear().domain([0, data.length]).range([0, ${param.container}_height-${param.container}_margin.top]),
		    total = d3.scaleLinear().domain([0, dataRange]).range([0, ${param.container}_width]);


		/* main panel */
		var vis = d3.select("#${param.graph_element}").append("svg")
		    .attr("width", ${param.container}_width)
		    .attr("height", ${param.container}_height + ${param.container}_margin.top + ${param.container}_margin.bottom);

		
		var svgDefs = vis.append('defs');

        var ${param.container}mainGradient = svgDefs.append('linearGradient')
            .attr('id', '${param.container}mainGradient');

        // Create the stops of the main gradient. Each stop will be assigned
        // a class to style the stop using CSS.
        ${param.container}mainGradient.append('stop')
            .attr('class', '${param.container}stop-left')
            .attr('offset', '0');

        ${param.container}mainGradient.append('stop')
            .attr('class', '${param.container}stop-right')
            .attr('offset', '1');
        
		var bar = vis.selectAll("g.bar")
		    .data(data)
				.enter().append("g")
				.attr("class", "bar")
				.attr("transform", function(d, i) {return "translate(0," + (yScale(i) + ${param.container}_margin.top) + ")";});

		bar.append("text")
		    .attr("class", "below")
		    .attr("x", ${param.container}_margin.left+12)
		    .attr("dy", (barWidth-gap)/2)
		    .attr("text-anchor", "left")
		    .text(function(d) { return d.label; })
		    .style("fill", "#000000");
		
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
		};
		
		bar.append("text")
	    	.attr("class", "below")
	    	.attr("x", ${param.container}_margin.left+12)
	    	.attr("dy", ((barWidth-gap)/2)+20)
	    	.attr("text-anchor", "left")
	    	.text(function(d) { return "(" +  nFormatter(d.count,2) + ")"; })
	    	.style("fill", "#000000");
	

		bar.append("a")
			.attr("xlink:href", function(d) {return "<util:applicationRoot/>" + "/new-ph/long-covid/" + d.viz_id;})
			.append("rect")
				.style("cursor", "pointer")
		    	.attr("class", "${param.container}longbar_bar")
		    	.attr("width", function(d) { return total(d.count); })
		    	.attr("height", barWidth - gap)
		    	.attr("x", ${param.container}_margin.left);
		
		

		bar.append("svg")
		    .attr("height", barWidth - gap)
		    .attr("width", function(d) { return total(d.count) ; })
		    .append("text")
		    .attr("class", "up")
		    .attr("x", ${param.container}_margin.left+12)
		    .attr("dy", (barWidth-gap)/2)
		    .attr("text-anchor", "left")
		    .text(function(d) { return d.label; })
		    .style("fill", "#ffffff");
		
		bar.append("svg")
	    	.attr("height", barWidth - gap)
	    	.attr("width", function(d) { return total(d.count) ; })
	    	.append("text")
	    	.attr("class", "up")
	    	.attr("x", ${param.container}_margin.left+12)
	    	.attr("dy", ((barWidth-gap)/2)+20)
	    	.attr("text-anchor", "left")
	    	.text(function(d) { return "(" + nFormatter(d.count,2) + ")"; })
	    	.style("fill", "#ffffff");
			
		
	}
})
</script>