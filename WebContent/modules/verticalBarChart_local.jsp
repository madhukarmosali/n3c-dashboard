<script>

function localBarChart(data, domName) {
	localBarChart(data, domName, 50);
}

function localBarChart(data, domName, barLabelWidth) {
	var valueLabelWidth = 100; // space reserved for value labels (right)
	var barHeight = 20; // height of one bar
//	var barLabelWidth = 50; // space reserved for bar labels
	var barLabelPadding = 5; // padding between bar and bar labels (left)
	var gridLabelHeight = 0; // space reserved for gridline labels
	var gridChartOffset = 3; // space between start of grid and first bar
	var maxBarWidth = 200; // width of the bar with the max value

	//accessor functions
	var barLabel = function(d) { return d.element; };
	var barValue = function(d) { return parseFloat(d.count); };

//	data.forEach(function(node) {
//		barLabelWidth = Math.max(barLabelWidth,node.element.length * 8);
	    //console.log(node.element + "  " + node.element.length*7. );
//	});
	
	var myObserver = new ResizeObserver(entries => {
		entries.forEach(entry => {
			var newWidth = Math.floor(entry.contentRect.width);
			if (newWidth > 0) {
				d3.select(domName).select("svg").remove();
				maxBarWidth = newWidth - barLabelWidth - barLabelPadding - valueLabelWidth;
				draw();
			}
		});
	});

	myObserver.observe(d3.select(domName).node());

	draw();

	function draw() {

		// scales
		var yScale = d3.scaleBand().domain(d3.range(0, data.length)).range([0, data.length * barHeight]);
		var y = function(d, i) { return yScale(i); };
		var yText = function(d, i) { return y(d, i) + yScale.bandwidth() / 2; };
		var x = d3.scaleLinear().domain([0, d3.max(data, barValue)]).range([0, maxBarWidth]);

		// svg container element
		var chart = d3.select(domName).append("svg")
			.attr('width', maxBarWidth + barLabelWidth + barLabelPadding + valueLabelWidth)
			.attr('height', gridLabelHeight + gridChartOffset + data.length * barHeight);
		// grid line labels
		var gridContainer = chart.append('g')
			.attr('transform', 'translate(' + barLabelWidth + ',' + gridLabelHeight + ')');
		// vertical grid lines
// 		gridContainer.selectAll("line").data(x.ticks(10)).enter().append("line")
// 			.attr("x1", x)
// 			.attr("x2", x)
// 			.attr("y1", 0)
// 			.attr("y2", yScale.range()[1] + gridChartOffset)
// 			.style("stroke", "#e6e6e6");
		// bar labels
		var labelsContainer = chart.append('g')
			.attr('transform', 'translate(' + (barLabelWidth - barLabelPadding) + ',' + (gridLabelHeight + gridChartOffset) + ')');
		labelsContainer.selectAll('text').data(data).enter().append('text')
			.attr('y', yText)
			.attr('stroke', 'none')
			.attr('fill', 'black')
			.attr("dy", ".35em") // vertical-align: middle
			.attr('text-anchor', 'end')
			.text(barLabel);
		// bars
		var barsContainer = chart.append('g')
			.attr('transform', 'translate(' + barLabelWidth + ',' + (gridLabelHeight + gridChartOffset) + ')');
		barsContainer.selectAll("rect").data(data).enter().append("rect")
			.attr('y', y)
			.attr('height', yScale.bandwidth())
			.attr('width', function(d) { return x(barValue(d)); })
			.attr('stroke', 'white')
			.attr('fill', '#767676');
		// bar value labels
		barsContainer.selectAll("text").data(data).enter().append("text")
			.attr("x", function(d) { return x(barValue(d)); })
			.attr("y", yText)
			.attr("dx", 3) // padding-left
			.attr("dy", ".35em") // vertical-align: middle
			.attr("text-anchor", "start") // text-align: right
			.attr("fill", "black")
			.attr("stroke", "none")
			.text(function(d) { return barValue(d); });
		// start line
		barsContainer.append("line")
			.attr("y1", -gridChartOffset)
			.attr("y2", yScale.range()[1] + gridChartOffset)
			.style("stroke", "#000");
	}
}
</script>
