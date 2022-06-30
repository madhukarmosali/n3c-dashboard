<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<script>
console.log("entering iframe logic");
(async() => {
	var iframe_style = 'x';
	var iframe = 'y';
	var iframe_content = 'z';
	
	console.log("entering await");
	const { config, csrfTokenInfo } = await auth2();
	console.log(csrfTokenInfo)
	iframe_render(config.tenantDomain,config.appId,iframe_content,config.qlikWebIntegrationId,csrfTokenInfo.headers.get("qlik-csrf-token"),iframe_style,iframe);
	});
	
function iframe_render(tenant, appID, content, integrationID, token, style, iframe) {
	console.log("iframe", iframe)
	cache_browser_history("public-health", "public-health/summary/"+iframe)
	var divContainer = document.getElementById("question-tile");
	divContainer.innerHTML = 
	  '<iframe src="https://'+tenant+'/single/?appid='+appID+'&sheet='+content
		  +'&qlik-web-integration-id='+integrationID
		  +'&qlik-csrf-token='+token+'" style="'+style+'" ></iframe>'
}
</script>
	