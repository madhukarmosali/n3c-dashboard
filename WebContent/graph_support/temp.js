function localHorizontalStackedBarChart(data, domName, barLabelWidth) {

	var margin = { top: 100, right: 200, bottom: 60, left: 100 },
		width = 1200 - margin.left - margin.right,
		height = 500 - margin.top - margin.bottom;

	var myObserver = new ResizeObserver(entries => {
		entries.forEach(entry => {
			var newWidth = Math.floor(entry.contentRect.width);
			if (newWidth > 0) {
				d3.select(domName).select("svg").remove();
				width = newWidth - margin.left - margin.right;
				if ((width / 2 - margin.left - margin.right) > 300) {
					height = width / 2 - margin.left - margin.right;
				} else {
					height = 300;
				}
				draw();
			}
		});
	});

	myObserver.observe(d3.select(domName).node());

	draw();

	function draw() {

		var svg = d3.select(domName).append("svg"),
			margin = { top: 20, right: 20, bottom: 30, left: 40 },
			width = +svg.attr("width") - margin.left - margin.right,
			height = +svg.attr("height") - margin.top - margin.bottom,
			g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

		var y = d3.scaleBand()			// x = d3.scaleBand()	
			.rangeRound([0, height])	// .rangeRound([0, width])
			.paddingInner(0.05)
			.align(0.1);

		var x = d3.scaleLinear()		// y = d3.scaleLinear()
			.rangeRound([0, width]);	// .rangeRound([height, 0]);

		var z = d3.scaleOrdinal()
			.range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);

		var keys = data.columns.slice(1);

		//	  data.sort(function(a, b) { return b.total - a.total; });
		y.domain(data.map(function(d) { return d.element; }));					// x.domain...
		x.domain([0, d3.max(data, function(d) { return d.count; })]).nice();	// y.domain...
		z.domain(data.map(function(d, i) { return d.secondary; }));

		g.append("g")
			.selectAll("g")
			.data(d3.stack().keys(keys)(data.secondary))
			.enter().append("g")
			.attr("fill", function(d) { return z(d.key); })
			.selectAll("rect")
			.data(function(d) { return d; })
			.enter().append("rect")
			.attr("y", function(d) { return y(d.data.element); })	    //.attr("x", function(d) { return x(d.data.State); })
			.attr("x", function(d) { return x(d[0]); })			    //.attr("y", function(d) { return y(d[1]); })	
			.attr("width", function(d) { return x(d[1]) - x(d[0]); })	//.attr("height", function(d) { return y(d[0]) - y(d[1]); })
			.attr("height", y.bandwidth());						    //.attr("width", x.bandwidth());	

		g.append("g")
			.attr("class", "axis")
			.attr("transform", "translate(0,0)") 						//  .attr("transform", "translate(0," + height + ")")
			.call(d3.axisLeft(y));									//   .call(d3.axisBottom(x));

		g.append("g")
			.attr("class", "axis")
			.attr("transform", "translate(0," + height + ")")				// New line
			.call(d3.axisBottom(x).ticks(null, "s"))					//  .call(d3.axisLeft(y).ticks(null, "s"))
			.append("text")
			.attr("y", 2)												//     .attr("y", 2)
			.attr("x", x(x.ticks().pop()) + 0.5) 						//     .attr("y", y(y.ticks().pop()) + 0.5)
			.attr("dy", "0.32em")										//     .attr("dy", "0.32em")
			.attr("fill", "#000")
			.attr("font-weight", "bold")
			.attr("text-anchor", "start")
			.text("Population")
			.attr("transform", "translate(" + (-width) + ",-10)");   	// Newline

		var legend = g.append("g")
			.attr("font-family", "sans-serif")
			.attr("font-size", 10)
			.attr("text-anchor", "end")
			.selectAll("g")
			.data(keys.slice().reverse())
			.enter().append("g")
			//.attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });
			.attr("transform", function(d, i) { return "translate(-50," + (300 + i * 20) + ")"; });

		legend.append("rect")
			.attr("x", width - 19)
			.attr("width", 19)
			.attr("height", 19)
			.attr("fill", z);

		legend.append("text")
			.attr("x", width - 24)
			.attr("y", 9.5)
			.attr("dy", "0.32em")
			.text(function(d) { return d; });
	};


}
