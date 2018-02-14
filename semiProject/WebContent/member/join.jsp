<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#id{
		border-bottom:1px solid #993333; 
		box-shadow:0 1px 0 0 #993333;
	}
	label{
		color:#993333; 
	}
	
</style>
<div class="row">
    <form class="col s12" action="<%=request.getContextPath()%>/member.do">
      <div class="row">
        <div class="input-field col s3" >
          <input id="id" name="id" type="text" class="validate" data-length="15">
          <label for="id" style="font-size: 20px; color:#993333; ">아이디</label>
        </div>
       </div>
       <div class="row">
          <div class="input-field col s3">
          <input id="pwd" type="password" class="validate" data-length="20">
          <label for="pwd" style="font-size: 20px;">패스워드</label>
        </div>
      </div>
       <div class="row">
          <div class="input-field col s3">
          <input id="rpwd" type="password" class="validate" data-length="20">
          <label for="rpwd" style="font-size: 20px;">패스워드확인</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s3">
          <input id="name" name="name" type="text" class="validate" >
          <label for="name" style="font-size: 20px;">이름</label>
        </div>
        <div class="input-field col s3">
          <input id="nickname" name="nickname" type="text" class="validate" data-length="10">
          <label for="nickname" style="font-size: 20px;">닉네임</label>
        </div>
       </div>
      <div class="row">
        <div class="input-field col s3">
          <input id="phone" name="phone" type="text" class="validate" data-length="11">
          <label for="phone" style="font-size: 20px;">폰번호</label>
        </div>
       </div>
      <div class="row">
        <div class="col s6">
          <div class="input-field inline">
            <input id="email" type="email" class="validate" style="width: 450px; font-size: 20px;">
            <label for="email" style="font-size: 20px;" data-error="올바르지 않은 이메일 형식입니다." data-success="사용할 수 있는 이메일 입니다.">Email</label>
          </div>
        </div>
      </div>
      <button class="btn waves-effect waves-light" type="submit" name="action" style="background-color:#993333; margin-left:20px; width: 200px">가입</button>
    </form>
  </div>
