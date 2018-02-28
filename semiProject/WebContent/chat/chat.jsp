<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript"> 
         var div= document.getElementById("messageWindow"); 
         var webSocket = new WebSocket('ws://192.168.0.2/semiProject/broadcasting'); 
         var inputMessage = document.getElementById('inputMessage'); 
     webSocket.onerror = function(event) { 
       onError(event) 
     }; 
     webSocket.onopen = function(event) { 
       onOpen(event) 
     }; 
     webSocket.onmessage = function(event) { 
       onMessage(event) 
     }; 
     function onMessage(event) { 
        // var data=event.data;
         div.innerHTML += "상대 : " + event.data + "<br>"; 
         //alert(data.id);
     } 
     function onOpen(event) { 
    	 webSocket.send('${sessionScope.id}');
     } 
     function onError(event) { 
       alert(event.data); 
     } 
  
    /*  function send() { 
         div.innerHTML += '${sessionScope.id}'+" : " + inputMessage.value + "<br>"; 
         webSocket.send(inputMessage.value +"id:"+'${sessionScope.id}'); 
         inputMessage.value = ""; 
     }  */
   </script> 