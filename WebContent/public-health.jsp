<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" flush="true" />
	<script>
		// abstraction to manage a session's state across already visited tabs, subtabs, and direct access URLs
		
		var tab_cache = [ ];
		var secondary_tab_cache = [ ];
		
		function cache_browser_history(tabname, pathname) {
			var index = tab_cache.findIndex(entry => {
				return entry.tabname === tabname;
			});

			if (index == -1) {
				var new_cache_entry = {
						tabname: tabname,
						pathname: pathname
				}
				tab_cache.push(new_cache_entry);
			} else {
				tab_cache[index].pathname = pathname
			}
			var elements = pathname.split("/");
			
			if (elements.length == 3) {
				var secondary_index = secondary_tab_cache.findIndex(entry => {
					return entry.tabname === (tabname + "/" + elements[1]);
				});
				if (secondary_index == -1) {
					var new_cache_entry = {
							tabname: tabname + "/" + elements[1],
							pathname: pathname
					}
					secondary_tab_cache.push(new_cache_entry);
				} else {
					secondary_tab_cache[secondary_index].pathname = pathname
				}
			}
			
			set_browser_history(tabname)
		}
		
		function set_browser_history(tabname) {
			console.log("tab_cache", tabname, tab_cache, secondary_tab_cache)
			var index = tab_cache.findIndex(entry => {
				return entry.tabname === tabname;
			});
		
			if (index == -1) {
				history.pushState(null, '', '<util:applicationRoot/>/'+tabname)
			} else {
				console.log("cache hit", tab_cache[index].pathname)
				if ((tab_cache[index].pathname.match(/\//g) || []).length > 0) {
					//need to check the secondary cache
					var secondary_index = secondary_tab_cache.findIndex(entry => {
						return entry.tabname === tab_cache[index].pathname;
					});
					console.log("secondary index", secondary_index)
					if (secondary_index == -1) {
						history.pushState(null, '', '<util:applicationRoot/>/'+tab_cache[index].pathname)
					} else {
						history.pushState(null, '', '<util:applicationRoot/>/'+secondary_tab_cache[secondary_index].pathname)
					}
				} else
					history.pushState(null, '', '<util:applicationRoot/>/'+tab_cache[index].pathname)
			}
		}
		
	</script>

<body>
	<jsp:include page="navbar.jsp" flush="true">
  		<jsp:param name="page" value="health"/>
	</jsp:include>

	<c:import url="https://covid.cd2h.org/dashboard/graphs/public_health.jsp"/>

	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
