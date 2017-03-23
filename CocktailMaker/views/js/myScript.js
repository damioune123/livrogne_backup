$(document).ready(function(){
	var code="";
	$("#code").val('');
	var majCodeScript = function(nomPompe, nombrecl){
		var regex = new RegExp("XX"+nomPompe+"-[0-9]*");
		matches = regex.exec(code);

		if(matches === null){
			code += "XX"+nomPompe+"-"+nombrecl;
			$("#code").val(code);
			var currentTotal = $("#total").val();
			if(currentTotal == ""){
				$("#total").val(nombrecl);
			}
			else{
				$("#total").val(parseInt(currentTotal)+parseInt(nombrecl));
			}
			
		}
    	else{
    		
    		var currentTotal = $("#total").val();
 			var regex2 = new RegExp("-[0-9]*");
 			var matches2 = regex2.exec(matches[0]);
 			var oldCl = parseInt(matches2[0].replace('-',''));
 			currentTotal-= oldCl;
 			currentTotal+= parseInt(nombrecl); 
 			$("#total").val(currentTotal);	
    		code = code.replace(matches[0], "XX"+nomPompe+"-"+nombrecl);
    		$("#code").val(code);
			
    	}
	};

	$('table tr td input').change(function(){
		if($(this).val() <= 0){
			$(this).css("background-color", "#e56767");

		}
		else if($(this).val() > 10){
			 $(this).css("background-color", "#e56767");
		}
		else{
			$(this).css("background-color", "#7ce57e");
			majCodeScript($(this).attr("name"), $(this).val());
		}
	});
	/*
	$("#servir").click(function(){
		$.ajax({
			url: 'index.php?',
			type: 'GET',
			data: "code="+$("#code").val(),
			success: function(response) {
				alert("Bien servi !"+$("#code").val() )
			},
			error: function(e) {
				console.log(e);
				alert("erreur"+e)
			}
		});	
		window.location.reload();
	});*/

});







