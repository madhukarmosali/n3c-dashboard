<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-136610069-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-136610069-2');
</script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>National COVID-19 Cohort Collaborative</title>

	<!-- bootstrap CSS -->
	<link href="<util:applicationRoot/>/resources/bootstrap/css/bootstrap.css" rel="stylesheet" >
	<script src="<util:applicationRoot/>/resources/anime.min.js"></script>

	<!-- jQuery library -->
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>$.ajaxPrefilter(function( options, originalOptions, jqXHR ) {    options.async = true; });</script>	
	
	<!-- bootstrap Latest compiled JavaScript -->
	<script type='text/javascript' src='<util:applicationRoot/>/resources/bootstrap/js/bootstrap.bundle.min.js '></script>
	
	<!-- datatables -->
	<link rel="stylesheet" type="text/css" href="<util:applicationRoot/>/resources/DataTables/css/jquery.dataTables.min.css"/>
	<script type="text/javascript" charset="utf8" src="<util:applicationRoot/>/resources/DataTables/js/jquery.dataTables.min.js"></script>
	
	<!-- fontawesome -->
	<link rel="stylesheet" id='font-awesome' href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/c831130235.js" crossorigin="anonymous"></script>
	
	<!-- Viz -->
	<script src="<util:applicationRoot/>/resources/d3.v4.min.js"></script>
	<script src="<util:applicationRoot/>/resources/d3-tip.js"></script>
	<script src='https://cdn.plot.ly/plotly-latest.min.js'></script>
	
	<!-- Google Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
	
	<!-- local stylesheets -->
	<link rel="stylesheet" href="<util:applicationRoot/>/resources/n3c_login_style.css">
	
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
	

</head>
