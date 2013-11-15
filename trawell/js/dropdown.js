function callbackend(var1, var2) {
	var elem = document.getElementById(var1),selectedNode = elem.options[elem.selectedIndex];
	var v1 = selectedNode.value;
	//echo(var1 + v1);
	//document.getElementById("resultHeader").innerHTML=v1; 
	$.get( "backend.jsp", { type: var1, name: v1 }, function(result){
		
		$("#" + var2 ).html(result);
		});
	}

function callbackend1(var1, var2, var3) {
	var elem = document.getElementById(var1),selectedNode = elem.options[elem.selectedIndex];
	var v1 = selectedNode.value;
	
	var elem1 = document.getElementById(var2),selectedNode = elem1.options[elem1.selectedIndex];
	var v2 = selectedNode.value;
	//alert(var1 + v1 + v2);
	//document.getElementById("resultHeader").innerHTML=v1; 
	$.get( "backend.jsp", { type: var1, name: v1, cast: v2 }, function(result){
		//alert(result);
		$("#" + var3 ).html(result);
		});
	}

