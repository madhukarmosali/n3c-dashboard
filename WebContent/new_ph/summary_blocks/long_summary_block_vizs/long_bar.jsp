<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.shared, .bar, .label {
  font-size: 16px;
}
.malebar {
/*   fill: #535960; */
/* 	fill: #117a8b; */
	fill: #2a8d9e;
}
</style>
<script>


// set the dimensions and margins of the graph
var ${param.container}_margin = {top: 0, right: 0, bottom: 10, left: 0},
	${param.container}_width = 445 - ${param.container}_margin.left - ${param.container}_margin.right,
	${param.container}_height = 445 - ${param.container}_margin.top - ${param.container}_margin.bottom;

var gap = 20;

// read json data
d3.json("../../../new_ph/summary_blocks/long_summary_block_vizs/${param.feed}", function(error, data) {
	if (error) throw error;
	
	var data = data.rows; 
	
	var ${param.container}myObserver = new ResizeObserver(entries => {
		entries.forEach(entry => {
			var newWidth = Math.floor(entry.contentRect.width);
			if (newWidth > 0) {
				d3.select("#${param.container}").select("svg").remove();
				${param.container}_width = newWidth - ${param.container}_margin.left - ${param.container}_margin.right;
				if ((${param.container}_width/2 - ${param.container}_margin.top - ${param.container}_margin.bottom) > 300){
					${param.container}_height = ${param.container}_width/2 - ${param.container}_margin.top - ${param.container}_margin.bottom;
				} else { 
					${param.container}_height = 300;
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
		
		bar.append("text")
	    	.attr("class", "below")
	    	.attr("x", ${param.container}_margin.left+12)
	    	.attr("dy", ((barWidth-gap)/2)+20)
	    	.attr("text-anchor", "left")
	    	.text(function(d) { return "(" +  d.count + ")"; })
	    	.style("fill", "#000000");
	

		bar.append("a")
			.attr("xlink:href", function(d) {return "<util:applicationRoot/>" + "/new-ph/summary/long-covid/" + d.viz_id;})
			.append("rect")
				.style("cursor", "pointer")
		    	.attr("class", "malebar")
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
	    	.text(function(d) { return "(" + d.count + ")"; })
	    	.style("fill", "#ffffff");
			
		
	}
})
</script>