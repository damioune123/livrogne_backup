var https=require('https');
var request = require('request');
var hdate = require('human-date')
var path = require("path");
var fs = require('fs');
var sync = require('sync');
var FormData= require('form-data');


var citation_file_path=__dirname+"/citations.txt";
console.log(citation_file_path);
var userID="162943101140612";
var access_token ="EAACEdEose0cBAGGxnMrZA0fJBRGUlxrJNVbfzkfSop54zGPXY0TmwnRtN9x3tSLFp2AZCZCR84tvlWuJizIEzuLUczDEvvIfNyRUcBNd06yWerNNK1tXi3BdlFLTDEvnSbZAyiw0irLaTYwxzfnUcZArJJaYVcRAPLVXOPZBUMEEAPAZAwcUKwituQdsOiJupm9q5YX6io9mAZDZD";
var date = hdate.prettyPrint(new Date());
var photo_path =process.argv[2];
var options = {
    host: 'graph.facebook.com',
    path: '/me?access_token=' + access_token
};

sync(https.get(options,function(res){
    var data = '';

    res.on('data', function (chunk) {
        data += chunk;
    });

    res.on('end', function() {
        console.log(data);
	data = JSON.parse(data);
	if(data.id===undefined){
		console.log("erreur token ou connexion");
		process.exit();
	}
    });
}));

const get_quote=function(){
     content=fs.readFileSync(citation_file_path,"utf8");
     content = content.replace(/\r?\n|\r/g, " ");

     quotes = content.split("%");
     return quotes[Math.floor(Math.random()*quotes.length)]
	
}
const caption = get_quote();
const publish_photo = function(album_id){
	console.log("PUBLISH PHOTO");
	console.log(album_id);
	console.log(caption);
	console.log(photo_path);

	var form = new FormData(); //Create multipart form
	form.append('file', fs.createReadStream(photo_path)); //Put file
	form.append('message', caption); //Put message
 
	//POST request options, notice 'path' has access_token parameter
	var options = {
    	    method: 'post',
    	    host: 'graph.facebook.com',
    	    path: "/"+album_id+"/photos?access_token="+access_token,
    	    headers: form.getHeaders(),
	}
 
	//Do POST request, callback for response
	var request = https.request(options, function (res){
	});
 
	//Binds form to request
	form.pipe(request);
 
	//If anything goes wrong (request-wise not FB)
	request.on('error', function (error) {
     	    console.log(error);
	});
}

request.get(
    'https://graph.facebook.com/'+userID+"/albums?access_token=" + access_token,
    function (error, response, body) {
        if (!error && response.statusCode == 200) {
	    body = JSON.parse(body);
	    var deja=false;
	    var albumId="";
	    body.data.forEach(function(alb){ 
		if(alb.name === date){
			deja=true;
			albumId=alb.id;
		}
		else{
		}
	    });
	    if(!deja){
		request.post(
    			'https://graph.facebook.com/'+userID+"/albums?access_token=" + access_token,
    			{ json: { name: date } },
    			function (error, response, body) {
       	 			if (!error && response.statusCode == 200) {
            				console.log(body.id);
					albumId=body.id;	
        			}
				publish_photo(albumId);
    			}
		);    
            }
	    else{
		publish_photo(albumId);
	    }
    	}
	
    }
);





















