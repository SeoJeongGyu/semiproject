<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <fieldset> 
     <div class="row" id="messageWindow" style="width:600px; height:500px; background-color: pink;">
	    
 		</div>
         <br/> 
         
         
  <div class="row">
    <div class="input-field col s6">
      <input id="inputMessage" type="text" class="validate">
      <label class="active" for="inputMessage">대화내용</label>
    </div>
  </div>
  <button class="btn waves-effect waves-light" type="submit" name="action" onclick="send()">전송</button>
     </fieldset> 
     <script type="text/javascript"> 
         var div= document.getElementById("messageWindow"); 
         var webSocket = new WebSocket('ws://192.168.0.2:8081/semiProject/broadcasting'); 
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
         div.innerHTML += "상대 : " + event.data + "<br>"; 
     } 
  
     function onOpen(event) { 
         div.innerHTML += "연결 성공<br>"; 
     } 
  
     function onError(event) { 
       alert(event.data); 
     } 
  
     function send() { 
         div.innerHTML += '${sessionScope.id}'+" : " + inputMessage.value + "<br>"; 
         webSocket.send(inputMessage.value+","+'${sessionScope.id}'); 
         inputMessage.value = ""; 
     } 
   </script> 
 </html> 
