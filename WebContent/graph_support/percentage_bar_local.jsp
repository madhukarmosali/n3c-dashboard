<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.tick line{
  visibility:hidden;
}

rect{
	cursor: auto;
}

.graph_tooltip{
	pointer-events:none;
}

</style>

<script>

function localPercentageBarChart(data, domName, barLabelWidth, colorscale, ordered) {

	var margin = {top: 40, right: 50, bottom: 50, left: barLabelWidth},
	width = 600 - margin.left - margin.right,
	height = 200 - margin.top - margin.bottom;
	
	if ((ordered != undefined) && (ordered == 1) ){
		data.sort(function(a, b) {
			console.log(a);
		    return parseFloat(b.count) - parseFloat(a.count);
		});
	}
	
	var myObserver = new ResizeObserver(entries => {
		entries.forEach(entry => {
			var newWidth = Math.floor(entry.contentRect.width);
			if (newWidth > 0) {
				d3.select(domName).select("svg").remove();
				width = newWidth - margin.left - margin.right;
				height = width/3;
				if (height > 300){
					height = 300;
				}
				draw();
			}
		});
	});
	
	myObserver.observe(d3.select(domName).node());
	
	var word_length = 3;
	
	if (data.length > 0){
		var longest_word = data.reduce(
			    function (a, b) {
			        return a.element.length > b.element.length ? a : b;
			    }
		);
		word_length =  longest_word.element.length;
		
	}
	
	draw();
	function draw() {
		
		
		var barHeight = 25;      
		
		//Appends the svg to the chart-container div
		var svg = d3.select(domName).append("svg")
		  .attr("width", width + margin.left + margin.right)
		  .attr("height", height + margin.top + margin.bottom)
		  .append("g")
		  .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
		
		var svgDefs = svg.append('defs');

        var mainGradient = svgDefs.append('linearGradient')
            .attr('id', domName.replace('#', '') + 'mainGradient');

        // Create the stops of the main gradient.
        mainGradient.append('stop')
            .style('stop-color', "#445098")
            .attr('offset', '0');

        mainGradient.append('stop')
            .style('stop-color', "#4661a4")
            .attr('offset', '99%');
		
		//Creates the xScale 
		var xScale = d3.scaleLinear()
		  .range([0,width]);
		
		//Creates the yScale
		var y0 = d3.scaleBand()
			.paddingInner(0.4)
			.range([0, height])
			.domain(data.map(function(d) { return d.element; }));
		
		//Defines the y axis styles
		var yAxis = d3.axisLeft(y0);
	
		//Appends the y axis
		var yAxisGroup = svg.append("g")
			.attr("class", "y axis")
			.call(yAxis);
		
		var sumelement = 0;
		for (i in data){
			sumelement = sumelement+data[i].count;
		}
		
		function round(value, decimals) {
			 return Number(Math.round(value+'e'+decimals)+'e-'+decimals);
		}   
			
		for (i in data){
			data[i]["num2"] = 100;
			if (data[i].count == 0){
				data[i]["num"] = 0;
			}else{
				data[i]["num"] = round((data[i].count/sumelement)*100, 2);
			}
		}
		
		
		  //Sets the max for the xScale
		  var maxX = d3.max(data, function(d) { return d.num2; });
		
		  //Gets the min for bar labeling
		  var minX = d3.min(data, function(d) { return d.num; });
		
		  //Defines the xScale max
		  xScale.domain([0, maxX ]);
			
		// axis labels & ticks
			var axisContainer = svg.append('g')
				.attr("class", "axis xaxis")
				.attr("transform", "translate(0," + (height) + ")")				
				.call(d3.axisBottom(xScale).ticks(Math.round(width/100), "s").tickFormat(function(d) {  return  d + "%" }))
				.append("text")										
				.attr("fill", "#000")
				.attr("font-weight", "bold")
				.attr("text-anchor", "start")
				.text("Percent of Total")
				.attr("transform", "translate(" + ((width/2)- margin.right) + "," + 40 + ")"); 
			
			d3.selectAll("g.xaxis g.tick")
		    	.append("line")
		    	.attr("class", "gridline")
		    	.attr("x1", 0)
		    	.attr("y1", -height+margin.top)
		    	.attr("x2", 0)
		    	.attr("y2", 0);
		
		  //Binds the data to the bars      
		  var categoryGroup = svg.selectAll(".g-category-group")
		    .data(data)
		    .enter()
		    .append("g")
		    .attr("class", "g-category-group")
		    .attr("transform", function(d) {
		    	return "translate(0," + (y0(d.element)) + " )";
		    });
		  
		
	
		  //Appends background bar   
		  var bars2 = categoryGroup.append("rect")
		    .attr("width", function(d) { return xScale(d.num2); })
		    .attr("height", y0.bandwidth())
		    .attr("class", "g-num2")
		    .attr("fill", "#f1f1f1");
		
		  //Appends main bar   
		  var bars = categoryGroup.append("rect")
		    .attr("width", function(d) { return xScale(d.num); })
		    .attr("height", y0.bandwidth())
		    .attr("class", "g-num")
		    .attr('fill', function(d){
				if (colorscale != undefined){
					return colorscale[(d.seq-1)];
				}else{
					return 'url(' + domName +'mainGradient)';
				}
			})
		    .on("mouseover", function() { tooltip.style("display", null); })
		    .on("mouseout", function() { tooltip.style("display", "none"); })
		    .on("mousemove", function(d) {
		    	tooltip.selectAll("tspan").remove();
		    	
		     	var xPosition = d3.mouse(this)[0];
		     	var yPosition = d3.mouse(this)[1];
		     	tooltip.attr("transform", "translate(" + xPosition + "," + (d3.mouse(this)[1] + y0(d.element)) + ")")
		     	.selectAll("text")
		     		.append("tspan")
		     		.text(d.element)
		     		.attr('x', 20)
  					.attr('dy', 13)
		     		.append("tspan")
		     		.text(d.num + "%")
		     		.attr('fill', 'black')
		     		.attr('x', 20)
  					.attr('dy', 20)
		     		.append("tspan")
	     			.text(d.count.toLocaleString())
	     			.attr('fill', 'black')
	     			.attr('x', 20)
					.attr('dy', 20);
		    });
		  
		  //Binds data to labels
		  var labelGroup = svg.selectAll("g-num")
		    .data(data)
		    .enter()
		    .append("g")
		    .attr("class", "g-label-group")
		    .attr("transform", function(d) {
		    	return "translate(0," + y0(d.element) + ")";
		    });
		
		  //Appends main bar labels   
		  var barLabels = labelGroup.append("text") 
		    .text(function(d) {return  d.num + "%";})
		    .attr("x", function(d) { 
		      if (minX > 32) {
		        return xScale(d.num) - 37;}
		      else {
		        return xScale(d.num) + 6;}})
		    .style("fill", "#696969") 
		    .attr("y", (y0.bandwidth() / 1.4))
		    .attr("class", "g-labels");    
		  
		// Tooltip ////// 
			var tooltip = svg.append("g")
	    		.attr("class", "graph_tooltip")
	    		.style("display", "none");
	      
	  		tooltip.append("rect")
	    		.attr("width", 30 + word_length * 7)
    			.attr("height", 60)
    			.attr("fill", "white")
    			.style("opacity", 0.7);

	  		tooltip.append("text")
	    		.attr("x", 30)
	    		.attr("dy", "1.2em")
	    		.style("text-anchor", "start")
	    		.attr("font-size", "12px")
	    		.attr("font-weight", "bold");
		
	};

}
</script>
