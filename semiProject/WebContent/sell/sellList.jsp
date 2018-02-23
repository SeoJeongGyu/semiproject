<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
  $(document).ready(function() {
    $('select').material_select();
  });
  
  function getDetail(sno){
	  //console.log(sno);
	  location.href="sell.do?cmd=sdetail&sno="+sno;
  }
  
  var xhr=null;
  function getCheck(){
	  var os=document.getElementsByName("os");  
	  var telecom=document.getElementsByName("telecom");  
	  var company=document.getElementsByName("company");  
	  var sql="select * from sell where ";  
	  var chk=0;
	  
  	  var ocnt=0;
  	  var tcnt=0;
	  var ccnt=0;
	  
	  for(var i=0; i<os.length;i++){
		 if(os[i].checked==true){
			 chk++;
			 if(chk>1){
			 	sql += " or os=" + os[i].value;
			 	ocnt++;
			  }else if(chk==1){
				sql += "(os=" + os[i].value;
				ocnt++;
			  }
		 }
	  }
	  if(ocnt>0){
		  sql+=")";
	  }
	  
	  var tcount=0;
	  for(var i=0; i<telecom.length;i++){
		 if(telecom[i].checked==true){
			 chk++;
			 if(ocnt==0){
				 if(chk>1){
					 sql += " or telecom=" + telecom[i].value ;
					 tcnt++;
				 }else if(chk==1){
			     	  sql += "(telecom=" + telecom[i].value;
			     	  tcnt++;
				 }
			 }else{
				 if(tcount==0){
					 sql += " and (telecom=" + telecom[i].value;
					 tcnt++;
					 tcount++;
				 }else{
					 sql += " or telecom=" + telecom[i].value;
					 tcnt++;
				 }
			 }
		 }
	 }
	  if(tcnt>0){
		  sql+=")";
	  }
	  
	  var ccount=0;
	  for(var i=0; i<company.length;i++){
			 if(company[i].checked==true){
				 chk++;
				 if(tcnt==0){
					 if(chk>1){
						 sql += " or company=" + company[i].value;
						 ccnt++;
					 }else if(chk==1){
				     	  sql += "(company=" + company[i].value;
				     	 ccnt++;
					}
				 }else{
					 if(ccount==0){
						 sql += " and (company=" + company[i].value;
						 ccnt++;
						 ccount++;
					 }else{
				     	  sql += " or company=" + company[i].value;
				     	 ccnt++;
					}
				 }
			 }
		 } 
	  if(ccnt>0){
		  sql+=")";
	  }	  
	  
	  if(chk<=0){
		sql="select * from sell";
	  }
	  
	  console.log("sql 작성중 : " + sql);
	  getlist(sql);
  }
   function getlist(sql){
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=callback;
		xhr.open('get','sell.do?cmd=checkedOs&sql='+sql, true);
		xhr.send();
  }
  function callback(){
	  if(xhr.readyState==4 && xhr.status==200){
		  var result=xhr.responseText;
		  //alert(text);
		 var json=JSON.parse(result);
		 var div=document.getElementById("sellList");
		 
		 var html = "<table class='highlight'>"+
	        "<thead>"+
	         "<tr>"+
	         "<th>판매상태</th>"+
	         "<th>제목</th>"+
	         "<th>가격</th>"+
	         "<th>작성자</th>"+
	         " </tr>"+
	        " </thead>"+
	        "<tbody>";
		 
		 for(var i=0;i<json.list.length;i++){
			 html += "<tr onclick='getDetail("+json.list[i].sno+")'>";
				if(json.list[i].success==0){
					html += "<td>판매중</td>";
				}else{
					html+= "<td>판매완료</td>";
				}
				html += "<td><a href='sell.do?cmd=sdetail&sno="+json.list[i].sno+"'>"+json.list[i].title+"</a></td>"+
					"<td>"+json.list[i].price+"</td>"+
					"<td>"+json.list[i].id+"</td>"+
					"</tr>";
		 }
		 html += "</tbody></table>"+
		 "<div class='row'><br><ul class='pagination'>";
		 
		 if(json.startPage>5){
			 html += "<li class='disabled'><a href='sell.do?cmd=sellList&pageNum="+ json.startPage-1 +"'>"+
			 "<i class='material-icons'>chevron_left</i></a></li>";
		 }
		 for(var i=json.startPage;i<=json.endPage;i++){
			 if(json.pageNum==i){
				 html += "<li class='active'><a href='sell.do?cmd=sellList&pageNum="+i+"'>"+i+"</a></li>";
			 }else{
				 html += "<li class='waves-effect'><a href='sell.do?cmd=sellList&pageNum="+i+"'>"+i+"</a></li>";
			 }
		 }
		 if(json.pageCount>json.endPage ){
			 html += "<li class='waves-effect'><a href='sell.do?cmd=sellList&pageNum="+ json.endPage+1 +"'>"+
			 "<i class='material-icons'>chevron_right</i></a></li>";
		 }
		 div.innerHTML = html + "<a class='waves-effect waves-light btn' href='/semiProject/sell.do?cmd=insert' style='background-color:#993333;margin-left: 1200px;'>"+
		   "<i class='material-icons' >create</i></a></ul></div>";		 
	  }
  }
  
</script>
<table border="1" style="width:650px;margin-left:0px ">
		<br>
		<tr>
		<th>운영체제 </th>
		<td><input type="checkbox" id="ios" name="os" value="1" onclick="getCheck()"/>
		<label for="ios">ios</label></td>
		<td style="width:150px">
		<input type="checkbox" id="android" name="os" value="2" onclick="getCheck()"/>
		<label for="android">안드로이드</label></td>
	 	</tr>
	 	<tr>
	 	<th>통신사 </th>
		<td><input type="checkbox" id="skt" name="telecom" value="1" onclick="getCheck()"/>
		<label for="skt">SKT</label></td>
		<td><input type="checkbox" id="kt" name="telecom" value="2" onclick="getCheck()"/>
		<label for="kt">KT</label></td>
		<td><input type="checkbox" id="lgu+" name="telecom" value="3" onclick="getCheck()"/>
		<label for="lgu+">LGU+</label></td>
		<td><input type="checkbox" id="tetc" name="telecom" value="4" onclick="getCheck()"/>
		<label for="tetc">기타</label></td>
	 	</tr>
	 	<tr>
	 	<th>브랜드 </th>
		<td><input type="checkbox" id="samsung" name="company" value="1" onclick="getCheck()"/>
		<label for="samsung">삼성</label></td>
		<td><input type="checkbox" id="lg" name="company" value="2" onclick="getCheck()"/>
		<label for="lg">LG</label></td>
		<td><input type="checkbox" id="apple" name="company" value="3" onclick="getCheck()"/>
		<label for="apple">애플</label></td>
		<td><input type="checkbox" id="cetc" name="company" value="4" onclick="getCheck()"/>
		<label for="cetc">기타</label></td>
	 	</tr>
</table>
    <br>
       
<div class="main" id="sellList">
 <table class="highlight">
        <thead>
          <tr>
              <th>판매상태</th>
              <th>제목</th>
              <th>가격</th>
              <th>작성자</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="sell" items="${requestScope.slist }">
			<tr onclick="getDetail(${sell.sno })">
			<c:choose>
				<c:when test="${sell.success==0 }">			
					<td>판매중</td>
				</c:when>
				<c:otherwise>
					<td>판매완료</td>
				</c:otherwise>
			</c:choose>
				<td><a href="sell.do?cmd=sdetail&sno=${sell.sno }">${sell.stitle }</a></td>
				<td>${sell.price }</td>
				<td>${sell.id }</td>
			</tr>
		</c:forEach>

        </tbody>
      </table>
 
  <div class="row">   
  <br>  
<ul class="pagination">
<c:if test="${startPage>5 }">
	<li class="disabled"><a href="sell.do?cmd=sellList&pageNum=${startPage-1 }"><i class="material-icons">chevron_left</i></a></li>
    
</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:choose>
			<c:when test="${pageNum==i }">
				<li class="active"><a href="sell.do?cmd=sellList&pageNum=${i}">${i}</a></li>
			</c:when>
			<c:otherwise>
			<li class="waves-effect"><a href="sell.do?cmd=sellList&pageNum=${i}">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
<c:if test="${pageCount>endPage }">
<li class="waves-effect"><a href="sell.do?cmd=sellList&pageNum=${endPage+1 }"><i class="material-icons">chevron_right</i></a></li>
 
</c:if>
</ul>
</div>


    <a class="waves-effect waves-light btn" href="/semiProject/sell.do?cmd=insert" style="background-color:#993333;margin-left: 1200px;">
    <i class="material-icons" >create</i></a>
 <div class="row">
    <form class="col s12">
    <div class="input-field col s12" style="width: 100px; margin-left: 10px;">
    <select>
      <option value="0">제목</option>
      <option value="1">내용</option>
      <option value="2">아이디</option>
    </select>
  </div>
      <div class="row">
        <div class="input-field col s2">
          <input id="" type="text" class="validate">
        </div>
      <button class="btn waves-effect waves-light" type="submit" name="action" style="margin-top: 25px;background-color: #993333">
      <i class="material-icons">search</i></button>
      </div>
    </form>
  </div>
  </div>