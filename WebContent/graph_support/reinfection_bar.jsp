<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

.tick line{
  visibility:hidden;
}

.graph_tooltip{
	pointer-events:none;
}
</style>

<c:if test = "${not empty param.namespace}">
	<c:set var = "namespace" value = "${param.namespace}"/>
</c:if>
<c:if test = "${empty param.column2_color}">
	<c:set var = "namespace" value = "namespace"/>
</c:if>


<style>

</style>

	

<script>



// set the dimensions and margins of the graph
	var margin = {top: 40, right: 80, bottom: 100, left: 80},
	    width = 960 - margin.left - margin.right,
	    height = 600 - margin.top - margin.bottom;
	
	

	
	
	d3.json("${param.data_page}", function(error, data) {	
		if (error) throw error;
		
		var myObserver = new ResizeObserver(entries => {
			entries.forEach(entry => {
				var newWidth = Math.floor(entry.contentRect.width);
				if (newWidth > 0) {
					d3.select("${param.dom_element}").select("svg").remove();
					width = newWidth - margin.left - margin.right;
					if ((width/2 - margin.top - margin.bottom) > 400){
						height = width - margin.top - margin.bottom;
					} else { 
						height = 400;
					}
					draw();
				}
			});
		});
		
		myObserver.observe(d3.select("${param.dom_element}").node());
		
		draw();
		
		function draw() {
			
			
			var data2 = data.rows;
			
			// set the ranges
			var x = d3.scaleBand()
			          .range([0, width])
			          .padding(0.1);
			var y = d3.scaleLinear()
			          .range([height, 0]);
			          

			var svg = d3.select("${param.dom_element}").append("svg")
				.attr("width", width + margin.left + margin.right)
			    .attr("height", height + margin.top + margin.bottom)
			    .append("g")
			    	.attr("transform", "translate(" + margin.left + "," + margin.top + ")");
			
			var svgDefs = svg.append('defs');

	        var mainGradient = svgDefs.append('linearGradient')
	            .attr('id', 'mainGradient')
	            .attr('x1', '0%')
	  			.attr('x2', '0%')
	  			.attr('y1', '100%')
	  			.attr('y2', '0%');

	        // Create the stops of the main gradient.
	        mainGradient.append('stop')
	            .style('stop-color', "#445098")
	            .attr('offset', '0');

	        mainGradient.append('stop')
	            .style('stop-color', "#4661a4")
	            .attr('offset', '99%');
		    
			// Scale the range of the data in the domains
			  x.domain(data2.map(function(d) { return d.time_range; }));
			  y.domain([0, d3.max(data2, function(d) { return d.actual_count; })]);
			  
			// add the x Axis
			 svg.append("g")
			      .attr("transform", "translate(0," + height + ")")
			      .call(d3.axisBottom(x))
			      .selectAll("text")	
        			.style("text-anchor", "end")
        			.attr("dx", "-.8em")
        			.attr("dy", ".15em")
        			.attr("transform", "rotate(-65)")
        			.attr("font-size", "14px");

			  // add the y Axis
			  svg.append("g")
			  	.attr("class", "yaxis")
			      .call(d3.axisLeft(y))
			      .attr("font-size", "14px");
			  
			  d3.selectAll("g.yaxis g.tick")
		    	.append("line")
		    	.attr("class", "gridline")
		    	.attr("x1", 0)
		    	.attr("y1", 0)
		    	.attr("x2", width+margin.right)
		    	.attr("y2", 0);

			  var g = svg.append("g")
			  	.attr("id", "svg_g");
			  
			  // append the rectangles for the bar chart
			  g.selectAll(".bar")
			      .data(data2)
			    .enter().append("rect")
			      .attr("class", "bar")
			      .attr("x", function(d) { return x(d.time_range); })
			      .attr("width", x.bandwidth())
			      .attr("y", function(d) { return y(d.actual_count); })
			      .attr("height", function(d) { return height - y(d.actual_count); })
			      .attr("fill", "url(#mainGradient)")
			      .on("mouseover", function() { tooltip.style("display", null); })
				  .on("mouseout", function() { tooltip.style("display", "none"); })
				  .on("mousemove", function(d) {
				  	var yPosition = d3.mouse(document.getElementById("svg_g"))[1];
				    var xPosition = d3.mouse(document.getElementById("svg_g"))[0];
				    var count2 = d.count;
				    var range = d.time_range;
				     	
				    tooltip.selectAll("tspan").remove();
				    tooltip
				    	.attr("transform", "translate(" + xPosition + "," +  yPosition + ")")
				    	.selectAll("text")
				     	.append("tspan")
				     	.text(range)
				     	.attr('fill', 'black')
				    	.attr('x', 30)
		  				.attr('dy', 20)
			     		.append("tspan")
			     		.text(count2)
			     		.attr('fill', 'black')
			     		.attr('x', 30)
		  				.attr('dy', 25);
				   	 });

			  
			  svg.append("text")             
		      	.attr("transform", "translate(" + (width/2) + " ," +  (height + margin.top + (margin.bottom/2)) + ")")
		      	.style("text-anchor", "middle")
		      	.text("Time Range in Days")
		      	.attr("fill", "#000")
				.attr("font-weight", "bold")
				.attr("font-size", "14px");
			  
			// Tooltip ////// 
				var tooltip = g.append("g")
		    		.attr("class", "graph_tooltip")
		    		.style("display", "none");
		      
		  		tooltip.append("rect")
		    		.attr("width", 60)
		    		.attr("height", 53)
		    		.attr("fill", "white")
		    		.style("opacity", 0.8);

				tooltip.append("text")
		 			.attr("x", 30)
		    		.attr("dy", "1.2em")
		    		.style("text-anchor", "middle")
		    		.attr("font-size", "12px")
		    		.attr("font-weight", "bold");
			
			
			};
		});
</script>