<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <fieldset> 
     <div class="row">
	    <form class="col s12">
	      <div class="row">
	        <div class="input-field col s12">
	          <textarea id="messageWindow" class="materialize-textarea"></textarea>
	          <label for="messageWindow">Textarea</label>
	        </div>
	      </div>
	    </form>
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
         var textarea = document.getElementById("messageWindow"); 
         var webSocket = new WebSocket('ws://localhost:8081/semiProject/broadcasting'); 
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
         textarea.value += "상대 : " + event.data + "\n"; 
     } 
  
     function onOpen(event) { 
         textarea.value += "연결 성공\n"; 
     } 
  
     function onError(event) { 
       alert(event.data); 
     } 
  
     function send() { 
         textarea.value += '${sessionScope.id}'+" : " + inputMessage.value + "\n"; 
         webSocket.send(inputMessage.value); 
         inputMessage.value = ""; 
     } 
   </script> 
 </html> 
