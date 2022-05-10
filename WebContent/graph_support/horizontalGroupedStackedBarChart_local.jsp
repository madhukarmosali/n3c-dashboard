<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.axis .domain {
	display: none;
}

.tick line{
  visibility:hidden;
}

.graph_tooltip{
	pointer-events:none;
}
</style>
<script>

function localHorizontalGroupedStackedBarChart(data, domName, barLabelWidth, legend_data, tertiary_range = categorical) {
  
	var margin = {top: 100, right: 200, bottom: 60, left: 200},
		width = 1200 - margin.left - margin.right,
		height = 1000 - margin.top - margin.bottom;

	var myObserver = new ResizeObserver(entries => {
		entries.forEach(entry => {
			var newWidth = Math.floor(entry.contentRect.width);
			if (newWidth > 0) {
				d3.select("#"+domName).select("svg").remove();
				width = newWidth - margin.left - margin.right;
				if ((width*1.5 - margin.left - margin.right) > 400){
					height = width*1.5 - margin.left - margin.right;
				} else { 
					height = 400;
				}
				draw();
			}
		});
	});
	
	myObserver.observe(d3.select("#"+domName).node());
	
	draw();
	
	function draw() {

		var y0 = d3.scaleBand()
			.rangeRound([0, height])
			.paddingInner(0.1);

		var y1 = d3.scaleBand()
			.padding(0.05);

		var x = d3.scaleLinear()
			.rangeRound([0, width]);

		var x1 = d3.scaleBand()

		var z = tertiary_range;

  
		y0.domain(data.map(function(d) { return d.element; }));
		y1.domain(data.map(function(d) { return d.secondary_group; }))
			.rangeRound([0, y0.bandwidth()])
			.padding(0.2);
		  
		var stackData = myStack(data)

		x.domain([0, d3.max(data, function(d) { return d.total; })]).nice();

		
		var svg = d3.select("#"+domName).append("svg")
			.attr("width", width + margin.left + margin.right)
			.attr("height", height + margin.top + margin.bottom);
		
		
		var g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");
		
		g.append("text")
			.attr("y", 0 - (margin.top/2))
			.attr("x",width/2)
			.attr("dy", "1em")
			.text("xaxis_label"); 
		
		g.append("g")
			.attr("class", "axis")
			.call(d3.axisLeft(y0))
			.selectAll("text")  
			.attr("transform", "translate(" + -(margin.left/2) + ", 0)")
			.style("text-anchor", "end")
			.call(wrap, (margin.left-100));

 
		g.append("g")
			.attr("class", "axis")
			.call(d3.axisTop(x).ticks(null, "s"))
			.append("text")
			.attr("y", 2)
			.attr("x", x(x.ticks().pop()) + 0.5)
			.attr("dx", "0.32em")
			.attr("fill", "#000")
			.attr("font-weight", "bold")
			.attr("text-anchor", "start")
			
		// Legend ////////////////////	
		var legend_text = g.append("g")
			.attr("transform", "translate(" + (margin.right/2) + " ," + (-20 - (margin.top/2)) + " )")
			.attr("font-family", "sans-serif")
			.attr("font-size", 11)
			.attr("font-weight", "bold")
			.attr("text-anchor", "middle")
			.append("text")
			.attr("x", width - 24)
			.attr("y", 9.5)
			.attr("dy", "0.32em")
			.text("legend_label");
			
		var legend = g.append("g")
			.attr("transform", "translate(" + (margin.right/2) + " ," + (0 - (margin.top/2)) + " )")
			.attr("font-family", "sans-serif")
			.attr("font-size", 10)
			.attr("text-anchor", "end")
			.selectAll("g")
				.data(legend_data)
			.enter().append("g")
				.attr("transform", function(d, i) {
					return "translate(0," + i * 20 + ")";
			});

		legend.append("rect")
			.attr("x", width - 19)
			.attr("width", 19)
			.attr("height", 19)
			.attr("fill", function(d, i) { return z[i]; });

		legend.append("text")
			.attr("x", width - 24)
			.attr("y", 9.5)
			.attr("dy", "0.32em")
			.text(function(d) {
				return d.secondary;
		});

		
		// Bars ///////////////
		var serie = g.selectAll(".serie")
			.data(stackData)
			.enter().append("g")
			.attr("class",function(d) { return "serie namespace" + z[i]; })
			.attr("fill", function(d, i) { return z[i]; });
		
		serie.selectAll("rect")
			.data(function(d) { return d; })
			.enter().append("rect")
			.attr("class", "serie-rect")
			.attr("transform", function(d) { return "translate(0," + y0(d.data.element) + ")"; })
			.attr("y", function(d) { return y1(d.data.secondary_group); })
			.attr("x", function(d) { return x(d[0]); })
			.attr("width", function(d) { return Math.max(1,x(d[1]) - x(d[0])); })
			.attr("height", y1.bandwidth())
			.on("click", function(d, i){ console.log("serie-rect click d", i, d); })
			.on("mouseover", function() { tooltip.style("display", null); })
		    .on("mouseout", function() { tooltip.style("display", "none"); })
		    .on("mousemove", function(d) {
		     	var xPosition = d3.mouse(this)[0];
		     	var yPosition = d3.mouse(this)[1];
		     	tooltip.attr("transform", "translate(" + xPosition + "," + ((y0(d.data.element)) + (y1(d.data.secondary_group))) + ")");
		     	tooltip.select("text").text(d[1]-d[0]);
		    });
		
		// Sub-Category Axis ///////////////
		var subs = [...new Set( data.map( item => item.stack_group ) )];
		
		d3.selectAll( (".namespace" + subs[1].replace(/[^A-Za-z0-9]/g, "") ).toString() )
			.selectAll("text")
			.data(function(d) {return d;})
			.enter().append("text")
			.style("fill", "black")
			.style("text-anchor", "end")
			.style("font-size", "10px")
			.attr("transform", function(d) { return "translate(" + -2 + "," + ( (y0(d.data.element)) +  y1.bandwidth() )  + ")"; })
			.attr("y", function(d) { return y1(d.data.secondary_group); })
			.attr("x", function(d) { return x1(d[0]); })
			.text(function(d) {return d.data.secondary_group });
		
		// Tooltip ////// 
		var tooltip = g.append("g")
    		.attr("class", "graph_tooltip")
    		.style("display", "none");
      
  		tooltip.append("rect")
    		.attr("width", 60)
    		.attr("height", 20)
    		.attr("fill", "white")
    		.style("opacity", 0.5);

  		tooltip.append("text")
    		.attr("x", 30)
    		.attr("dy", "1.2em")
    		.style("text-anchor", "middle")
    		.attr("font-size", "12px")
    		.attr("font-weight", "bold");
		
	
    	
		// Wrap Axis Text //////
		function wrap(text, width) {
			text.each(function() {
			  var text = d3.select(this),
			        words = text.text().split(/\s+/).reverse(),
			        word,
			        line = [],
			        lineNumber = 0,
			        lineHeight = 1, // ems
			        y = text.attr("y"),
			        dy = parseFloat(text.attr("dy")),
			        tspan = text.text(null).append("tspan").attr("x", 0).attr("y", y).attr("dy", dy + "em");
			    while (word = words.pop()) {
			      line.push(word);
			      tspan.text(line.join(" "));
			      if (tspan.node().getComputedTextLength() > width) {
			        line.pop();
			        tspan.text(line.join(" "));
			        line = [word];
			        tspan = text.append("tspan").attr("x", 0).attr("y", y).attr("dy", ((Math.ceil(++lineNumber/10)) * lineHeight) + dy + "em").text(word);
			      }
			    }
			  });
			};		
 		}
	
	function myStack(data) {
		var result = new Array();
		
		if (data.length == 0)
			return result;
		
		var previous = 0;
		for (let tertiary = 1; tertiary < data[1].secondary[1].tertiary.length; tertiary++) {
			for (let secondary = 0; secondary < data[1].secondary.length; secondary++) {
				var newrow = new Array();
				for (let primary = 0; primary < data.length; primary++) {
					console.log("secondary", data[primary], result, previous)
					if (previous == 0)
						newrow.push([0, data[primary].secondary[secondary].tertiary[tertiary]]);
					else
						newrow.push([previous[primary][1], previous[primary][1] + data[primary].secondary[secondary].tertiary[tertiary]]);
				}	
				result.push(newrow);
				previous = newrow;
			}
		}
		return result;
	}

}

</script>
