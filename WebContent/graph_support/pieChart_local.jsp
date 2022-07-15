<style>
chart {
	font: 10px sans-serif;
}

.arc path {
	stroke-width: 1px;
	stroke: #fff;
}
</style>

<script>

function localPieChart(data, domName, legend_data, range, donutRatio, legend_label) {
	
	var full_width = $(domName).width(), 
		width = full_width/2,
		height = width/1.3,
		border = 0;
	
	var margin = {right: 100};
	var filter_icon = " &#xf0b0";
	
	function drawgraphnew(){
		var newWidth = ($(domName).width())/2;
		var newFull = $(domName).width();
		if (newWidth > 0) {
			d3.select(domName).select("svg").remove();
			width = newWidth;
			height = newWidth/1.3;
			full_width = newFull;
			draw();
		}
	}
	
	d3.select(domName).select("svg").remove();
	draw();
	
 	window.onresize = drawgraphnew;

	function draw() {

		
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
		
		var formatComma = d3.format(",");
		var radius = Math.min(width - border, height - border) / 2;

		var arc = d3.arc()
			.outerRadius(radius * 0.8)
			.innerRadius(radius * donutRatio);
		
		var outerArc = d3.arc()
		  .innerRadius(radius * 0.85)
		  .outerRadius(radius * 0.85)

		var pie = d3.pie()
			.sort(null)
			.value(function(d) { return d.count; });
		
		var piedata = [];
		var piedata = pie(data);

		var svg = d3.select(domName).append("svg")
			.attr("width", full_width)
			.attr("height", height)
			
		var g = svg.append("g")
			.attr("width", full_width)
			.attr("transform", "translate(" + full_width / 2 + "," + ((height / 2)) + ")");

		data.forEach(function(d) {
			d.count = +d.count;
		});
		
		var arcs = g.selectAll(".arc")
			.data(pie(data))
			.enter().append("g")
			.attr("class", "arc");
		
		// add label lines
		var label_lines = g.selectAll('allPolylines')
			.data(piedata)
			.enter()
			.append('polyline')
				.attr("stroke", "black")
				.style("fill", "none")
				.attr("stroke-width", 1)
				.attr('points', function(d) {
					if (d.value > 0){
						var posA = arc.centroid(d) // line insertion in the slice
						var posB = outerArc.centroid(d) // line break: we use the other arc generator that has been built only for that
						var posC = outerArc.centroid(d); // Label position = almost the same as posB
						var midangle = d.startAngle + (d.endAngle - d.startAngle) / 2 // we need the angle to see if the X position will be at the extreme right or extreme left
						posC[0] = radius * 0.95 * (midangle < Math.PI ? 1 : -1); // multiply by 1 or -1 to put it on the right or on the left
						return [posA, posB, posC];
					} else {
						return;
					}
				});
		
		
		// add label text
		var labels = g.selectAll('allLabels')
			.data(piedata)
			.enter()
			.append('text')
			.text( function(d) { 
				if (d.value > 0){
					return d.data.element + " (" + d.data.num + "%)";
				} else {
					return;
				}
			})
			.attr("font-size", "12px")
			.attr('transform', function(d) {
				var pos = outerArc.centroid(d);
				var midangle = d.startAngle + (d.endAngle - d.startAngle) / 2
				pos[0] = radius * 0.99 * (midangle < Math.PI ? 1 : -1);
				return 'translate(' + pos + ')';
			})
			.style('text-anchor', function(d) {
				var midangle = d.startAngle + (d.endAngle - d.startAngle) / 2
				return (midangle < Math.PI ? 'start' : 'end')
			});
		
		
		// jitter overlapping label text
		var prev;
		var label_changes = {};
		labels.each(function(d, i) {
		  if(i > 0 && d.value > 0) {
		    var thisbb = this.getBoundingClientRect(),
		        prevbb = prev.getBoundingClientRect();
		    // move if they overlap
		    if(!(thisbb.right < prevbb.left || thisbb.left > prevbb.right || thisbb.bottom < prevbb.top || thisbb.top > prevbb.bottom)) {
		        var ctx = thisbb.left + (thisbb.right - thisbb.left)/2,
		            cty = thisbb.top + (thisbb.bottom - thisbb.top)/2,
		            cpx = prevbb.left + (prevbb.right - prevbb.left)/2,
		            cpy = prevbb.top + (prevbb.bottom - prevbb.top)/2,
		            off = Math.sqrt(Math.pow(ctx - cpx, 2) + Math.pow(cty - cpy, 2))/2;
		        
		        // keep labels that go above from overflowing svg
		        var max = -(height / 2)+20;
		        var translatey = (Math.sin((d.startAngle + d.endAngle - Math.PI) / 2) * (radius + off)) - 20;
		        if (translatey < max){
		        	translatey = max;
		        };

		        var element = d.data.element;
		        var change = Math.cos(((d.startAngle + d.endAngle - Math.PI) / 2)) * (radius + 20 + off) + "," + translatey;
		        label_changes[element] = change;
		        d3.select(this).attr("transform", "translate(" + Math.cos(((d.startAngle + d.endAngle - Math.PI) / 2)) * (radius + 20 + off) + "," + translatey + ")");   
		    }
		  }
		  prev = this;
		});
		
		
		// redraw line to new jittered position
		var label_keys = Object.keys(label_changes);	
		label_lines.each(function(d, i) {
 			if (label_keys.includes(d.data.element)){
 				d3.select(this).attr('points', function(d) {
						var posA = arc.centroid(d) // line insertion in the slice
						var posB = outerArc.centroid(d) // line break: we use the other arc generator that has been built only for that
						
						var midangle = d.startAngle + (d.endAngle - d.startAngle) / 2 // we need the angle to see if the X position will be at the extreme right or extreme left
						posC = label_changes[d.data.element]; // multiply by 1 or -1 to put it on the right or on the left
						return [posA, posB, posC];
				})
 			}
		});
		

		// add the arcs
		var path = arcs.append("path")
			.attr("d", arc)
			.style("fill", function(d) { return range[d.data.seq-1]; })
			.on('mouseover', function(d) {
				var total = d3.sum(data.map(function(d) {
					return d.count;
				}));
				var percent = Math.round(1000 * d.data.count / total) / 10;
				tooltip.select('.label').html(d.data.element).style('color','black').style("font-size", "14px");
				tooltip.select('.count').html(formatComma(d.data.count) + " patients");
				tooltip.select('.percent').html(percent + '% of category');
				tooltip.style('display', 'block');
				tooltip.style('opacity',2);
			})
			.on('mousemove', function(d) {
				tooltip.style('top', (d3.event.layerY + 10) + 'px')
				.style('left', (d3.event.layerX - 25) + 'px');
			})
			.on('mouseout', function() {
				tooltip.style('display', 'none');
				tooltip.style('opacity',0);
			});
		
		// Legend ////////////////////	
		var legend_text = svg.append("g")
			.attr("transform", "translate(" + full_width/2 + " ," + 20 + " )")
			.attr("font-family", "sans-serif")
			.attr("font-size", '14px')
			.attr("font-weight", "bold")
			.attr("text-anchor", "end")
			.append("text")
				.attr("x", width)
				.attr("y", 9.5)
				.attr("dy", "5px")
				.text(legend_label)
				.append("tspan")
					.attr('font-family', 'FontAwesome')
					.attr("class", "fa")
					.html(filter_icon);
		
		var legend = svg.append("g")
			.attr("transform", "translate(" + full_width/2 + " ," + 40 + " )")
			.attr("font-family", "sans-serif")
			.attr("font-size", '14px')
			.attr("text-anchor", "end")
			.selectAll("g")
				.data(legend_data)
				.enter().append("g")
				.attr("transform", function(d, i) {
					return "translate(0," + i * 20 + ")";
			});

		legend.append("rect")
			.attr("x", width-19)
			.attr("width", 19)
			.attr("height", 19)
			.attr("fill", function(d, i) { return range[i]; })
			.on("mouseover", function(d, i) {
				tooltip2.style("display", null);
			})
			.on("mouseout", function(d, i) {
					tooltip2.style("display", "none");
			})
			.on("click", function(d, i){
				window[domName.replace(/_[^_]+_[^_]+$/i,'_').replace('#', '')+'viz_constrain'](d, legend_label.replace(/\s/g, "")); 
				});
		
		legend.append("text")
			.attr("x", width - 24)
			.attr("y", 9.5)
			.attr("dy", "5px")
			.text(function(d) {	return d.secondary; });
		
		// Legend Tooltip ////// 
		var tooltip2 = svg.append("g")
    		.attr("class", "graph_tooltip")
    		.style("display", "none")
    		.attr("transform", "translate(" + (full_width-20) + " ," + 0 + " )");

  		tooltip2.append("text")
    		.attr("x", 10)
    		.attr("dy", "1.2em")
    		.style("text-anchor", "end")
    		.style("fill", "#0d6efd")
    		.attr("font-size", "12px")
    		.attr("font-weight", "bold")
    		.text("Click to add/remove filter");
	
		// add the tooltip for the chart
		var tooltip = d3.select(domName)
			.append('div')
			.attr('class', 'tooltip pie-tool')
			.style('background-color', 'rgba(255, 255, 255, 0.5)');
		tooltip.append('div')
			.attr('class', 'label');
		tooltip.append('div')
			.attr('class', 'count');
		tooltip.append('div')
			.attr('class', 'percent');
		
		

		// this is for adding text on the arcs
// 		g.append("text")
// 			.attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
// 			.attr("dy", ".35em")
// 			.style("text-anchor", "middle")
// 			.text(function(d) { return d.data.element; });
	}
}

</script>