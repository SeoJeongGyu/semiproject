<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.js"></script>
<script src="https://cdn.rawgit.com/mdehoog/Semantic-UI-Calendar/76959c6f7d33a527b49be76789e984a0a407350b/dist/calendar.min.js"></script>
<script type="text/javascript" src="js/memberList.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<link href="https://cdn.rawgit.com/mdehoog/Semantic-UI-Calendar/76959c6f7d33a527b49be76789e984a0a407350b/dist/calendar.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/memberList.css">
<meta charset="UTF-8">
<title>관리자 - 회원 목록 </title>
<style type="text/css">
.mainDiv{
	margin-top: 50px;
}
</style>
</head>
<body>
<div class="ui top attached demo menu">
  <a class="item" id="btnMenu">
    <i class="sidebar icon"></i>
    Menu
  </a>
</div>
<div class="ui bottom attached segment pushable">
	<div class="ui sidebar vertical accordion menu">
			<div class="item">
			    <a class="title">
			      <i class="home icon"></i>
	      			Home
			    </a>
			</div>
		    <div class="item">
			    <a class="title">
			      <i class="dropdown icon"></i>
	      			Member
			    </a>
			    <div class="content">
					<a class="teal item" href="memberList">
		      			List
				    </a>
				</div>
			</div>
		    <div class="item">
			    <a class="title">
			      <i class="dropdown icon"></i>
	      			Product
			    </a>
			       <div class="content">
					<a class="teal item" href="mpList">
		      			List
				    </a>
				</div>
			</div>
		    <div class="item">
			    <a class="title">
			      <i class="dropdown icon"></i>
	      			Order
			    </a>
				<div class="content">
					<a class="teal item">
		      			List
				    </a>
					<a class="teal item">
		      			Delivery
				    </a>
					<a class="teal item">
		      			Exchange & Refund
				    </a>
				</div>
			</div><!-- item -->
		    <div class="item">
			    <a class="title">
			      <i class="dropdown icon"></i>
	      			Event
			    </a>
			       <div class="content">
					<a class="teal item">
		      			List
				    </a>
				</div>
			</div><!-- item -->
		    <div class="item">
			    <a class="title">
			      <i class="dropdown icon"></i>
	      			Coupon
			    </a>
				<div class="content">
					<a class="teal item">
		      			List
				    </a>
					<a class="teal item">
		      			Issue
				    </a>
				</div>
			</div><!-- item -->
		   <div class="item">
			    <a class="title">
			      <i class="dropdown icon"></i>
	      			Board
			    </a>
			   <div class="content">
					<a class="teal item">
		      			Review
				    </a>
					<a class="teal item">
		      			MirrorTalk
				    </a>
				    <a class="teal item">
		      			Q & A
				    </a>
				</div>
			</div><!-- item -->
		   <div class="item">
			    <a class="title">
			      <i class="dropdown icon"></i>
	      			Statistics
			    </a>
			   <div class="content">
					<a class="teal item">
		      			Profit
				    </a>
					<a class="teal item">
		      			Members
				    </a>
				    <a class="teal item">
		      			Brands
				    </a>
				</div> <!--  content -->
			</div><!-- item -->
			
		</div><!-- accordian menu -->
			<div class="pusher">
			  <!-- Site content !-->
				<div class="ui big breadcrumb">
				  <a class="section">Member</a>
				  <i class="right chevron icon divider"></i>
				<div class="active section">${member.name }님 상세정보</div>
				
				<div class="mainContent">
				 <div class='mainDiv'>
					<table class="ui definition table">
					  <tbody>
					    <tr>
					      <td class="two wide column">회원번호</td>
					      <td>${member.member_no}</td>
					    </tr>
					    <tr>
					      <td>아이디</td>
					      <td>${member.id }</td>
					    </tr>
					    <tr>
					      <td>회원등급</td>
					      <td>${member.degree }</td>
					    </tr>
					    <tr>
					      <td>성명</td>
					      <td>${member.name }</td>
					    </tr>
					    <tr>
					      <td>닉네임</td>
					      <td>${member.nickname }</td>
					    </tr>
					    <tr>
					      <td class="two wide column">이메일</td>
					      <td>${member.email}</td>
					    </tr>
					    <tr>
					      <td class="two wide column">연락처</td>
					      <td>${member.phone}</td>
					    </tr>
					    <tr>
					      <td class="two wide column">주소</td>
					      <td>${member.address}</td>
					    </tr>
					    <tr>
					      <td class="two wide column">생년월일</td>
					      <td>${member.birthday}</td>
					    </tr>
					   	<tr>
					      <td class="two wide column">가입날짜</td>
					      <td>${member.regdate}</td>
					    </tr>
					    <tr>
					      <td class="two wide column">마일리지</td>
					      <td>${member.mileage}</td>
					    </tr>
					    <tr>
					      <td class="two wide column">누적구매금액</td>
					      <td>${member.total_price}</td>
					    </tr>
					  </tbody>
					</table>
				</div>
 				</div><!-- main content -->
			</div><!--  pusher -->
	</div>
</div>
</body>
</html>