#!/usr/bin/node
var https=require('https');
var request = require('request');
var hdate = require('human-date')
var path = require("path");
var fs = require('fs');
var sync = require('sync');
var FormData= require('form-data');
var FB = require('fb'),fb = new FB.Facebook({version: 'v2.11'});

var citation_file_path=__dirname+"/citations.txt";
var userID="162987154469540";
var access_token ="EAAbSAPyAKP8BAD7mAEOyItYSvKiEGavwfMxq9hSFedXXviXKubYhy51dZCwbKZCTKTaaY62HHtemzDBcgsYHagOA56qAyY7nxaHazrg5UZAikqLv0iMa8VPI94rs8f1rIjZBeidNCpA5KOZBfo2ZAMV7k4HD26NTkZD";
var date = hdate.prettyPrint(new Date());
var photo_path =process.argv[2];

FB.setAccessToken(access_token); 
FB.api('me', { fields: ['id'] }, function (res) {
    if(res.id !==  userID){
	console.log("erreur auth");
	process.exit();
    }
    console.log("LOGIN OK");
});

if(process.argv.length !=3){
	console.log("veuillez mettre le nom de fichier en argument");
	process.exit();
}
const get_quote=function(){

     content=fs.readFileSync(citation_file_path,"utf-8");
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

	FB.api(album_id+'/photos', 'post', { source: fs.createReadStream(photo_path), caption: caption }, function (res) {
  	    if(!res || res.error) {
    		console.log(!res ? 'error occurred' : res.error);
   		return;
  	    }
  	    console.log('Post Id: ' + res.post_id);
	});

}

FB.api(
    "me/albums",
    function (res) {
        if(!res || res.error){
		console.log(!res ? "error occured" : res.error);
		process.exit();
	}
	var deja=false;
	var albumId="";
	res.data.forEach(function(alb){ 
	   if(alb.name === date){
	       deja=true;
	       albumId=alb.id;
	   }
	});
	if(!deja){
	    FB.api(
    	         'me/albums',
		 'post',
    		 { name: date } ,
    		 function (res) {
       	 	     if (!res || res.error) {
   		         console.log(!res ? 'error occurred' : res.error);
			 process.exit();
        	     }
		     publish_photo(res.id);
    		 });    
         }else{ publish_photo(albumId);}
    }
);



















