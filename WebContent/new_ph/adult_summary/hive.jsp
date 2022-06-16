<!DOCTYPE html>
<meta charset="utf-8">
<!-- /* Code adapted from https://bost.ocks.org/mike/hive/ 's simple example- for use with d3v4' */ -->

<style>

.link {
  fill: none;
  stroke-width: 1.5px;
}

.axis, .node {
  stroke: #000;
  stroke-width: 1.5px;
}

</style>
<body>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="../../resources/d3.hive.min.js"></script>
<script>
d3.json("feeds/hive_data.jsp", function(error, data) {	
	if (error) throw error;
	console.log(data)

	var width = window.innerWidth,
	  height = window.innerHeight,
	  innerRadius = 40,
	  outerRadius = 400;
	
	var nodes = data.nodes;
	var node_map = d3.map(nodes, d => d.mapping);
	console.log("nodes", nodes);
	console.log("map", node_map.get("0-1"));
	
	var links = data.edges;
	
	var nodeScale = d3.scaleLinear()
	 .domain([0, d3.max(nodes, function(d) { return d.weight; })])
	 .range([2, 15]);
	
	var linkScale = d3.scaleLinear()
	 .domain([0, d3.max(links, function(d) { return d.weight; })])
	 .range([0.15, 1]);
	
	var groupings = d3.max(nodes, function(d) { return d.x; }) + 1; ///number of groups
	
	var angle = d3
	  .scalePoint()
	  .domain(d3.range(groupings + 1))
	  .range([0, 2 * Math.PI]),
	  radius = d3.scaleLinear().range([innerRadius, outerRadius]),
	  color = d3.scaleOrdinal(d3.schemeCategory10).domain(d3.range(20));
	
	var svg = d3
	  .select("body")
	  .append("svg")
	  .attr("width", width)
	  .attr("height", height)
	  .append("g")
	  .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
	
	svg
	  .selectAll(".axis")
	  .data(d3.range(groupings))
	  .enter()
	  .append("line")
	  .attr("class", "axis")
	  .attr("transform", function(d) {
	    return "rotate(" + degrees(angle(d)) + ")";
	  })
	  .attr("x1", radius.range()[0])
	  .attr("x2", radius.range()[1]);
	
	svg
	  .selectAll(".link")
	  .data(links)
	  .enter()
	  .append("path")
	  .attr("class", "link")
	  .attr(
	    "d",
	    d3.hive
	      .link()
	      .angle(function(d) {
	        return angle(node_map.get(d).x);
	      })
	      .radius(function(d) {
	        return radius(node_map.get(d).y);
	      })
	  )
	  .style("stroke", function(d) {
	    return color(node_map.get(d.source).x);
	  })
	  .style("stroke-opacity", function(d) {
		  return linkScale(d.weight);
	  });
	
	svg
	  .selectAll(".node")
	  .data(nodes)
	  .enter()
	  .append("circle")
	  .on("mouseover", function(d) { 
		  	console.log("node", d);
		  })
	  .attr("class", "node")
	  .attr("transform", function(d) {
	    return "rotate(" + degrees(angle(d.x)) + ")";
	  })
	  .attr("cx", function(d) {
	    return radius(d.y);
	  })
	  .attr("r", function(d) {
		  return nodeScale(d.weight);
	  })
	  .style("fill", function(d) {
	    return color(d.x);
	  });
	
	function degrees(radians) {
	  return radians / Math.PI * 180 - 90;
	}

});
</script>
