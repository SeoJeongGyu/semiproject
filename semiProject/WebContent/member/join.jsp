<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#id,#pwd,#rpwd,#name,#nickname,#phone,#email{
		border-bottom:1px solid #993333; 
		box-shadow:0 1px 0 0 #993333;
	}
</style>
<script type="text/javascript">
var reg_id = /^[a-z0-9_-]{6,12}$/;
var reg_pw = /^[a-z0-9_-]{6,12}$/;
var reg_email = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
var reg_name = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}/;
var reg_nickname = /[0-9a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,10}/;
var reg_phone = /^\d{3}\d{3,4}\d{4}$/;
var birthday = /^\d{2}\/\d{2}\/\d{2}$/;
	function checkJoin(){
	    console.log("안녕");
	    var id=document.getElementById("id");
	    var pwd = document.getElementById("pwd");
	    var rpwd = document.getElementById("rpwd");
	    if(!req_id.test(id.value)){
	        alert("Id는 6자이상 12자 이하 영문,숫자로 입력하세요.");
	    }
	    console.log(id.value);
	    console.log(pwd.value);
	    console.log(rpwd.value);
	    if(pwd.value==""){
	        pwd.focus();
	        alert("비밀번호확인을 입력하세요.");
	        return
	    }else if(pwd.value!=rpwd.value){
	        rpwd.focus();
	        alert("비밀번호와 비밀번호확인이 맞지 않습니다.")
	        return
	    }
	    document.frm.submit();
	}
	
</script>
<div class="row" style="margin-left: 420px;">
    <form class="col s12" action="<%=request.getContextPath()%>/member.do" name="frm">
      <div class="row">
        <div class="input-field col s3" style="margin-top: 50px;">
          <input id="id" name="id" type="text" class="validate" data-length="15">
          <label for="id" style="font-size: 20px; color:#993333; ">아이디</label>
        </div>
       </div>
       <div class="row">
          <div class="input-field col s3">
          <input id="pwd"  name="pwd" type="password" class="validate" data-length="20">
          <label for="pwd" style="font-size: 20px; color:#993333; ">패스워드</label>
        </div>
      </div>
       <div class="row">
          <div class="input-field col s3">
          <input id="rpwd" type="password" class="validate" data-length="20">
          <label for="rpwd" style="font-size: 20px; color: #993333;" >패스워드확인</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s3">
          <input id="name" name="name" type="text" class="validate" >
          <label for="name" style="font-size: 20px; color:#993333;">이름</label>
        </div>
        <div class="input-field col s3">
          <input id="nickname" name="nickname" type="text" class="validate" data-length="10">
          <label for="nickname" style="font-size: 20px; color:#993333;">닉네임</label>
        </div>
       </div>
      <div class="row">
        <div class="input-field col s3">
          <input id="phone" name="phone" type="text" class="validate" data-length="11">
          <label for="phone" style="font-size: 20px; color:#993333;">폰번호</label>
        </div>
       </div>
      <div class="row">
        <div class="col s6">
          <div class="input-field inline">
            <input id="email" name="email" type="email" class="validate" style="width: 450px; font-size: 20px;">
            <label for="email" style="font-size: 20px; color:#993333;" data-error="올바르지 않은 이메일 형식입니다." data-success="사용할 수 있는 이메일 입니다.">Email</label>
          </div>
        </div>
      </div>
      <a class="waves-effect waves-light btn" onclick="checkJoin()" style="margin-left:20px; background-color:#993333; color: white;">가입하기</a>
    </form>
  </div>
