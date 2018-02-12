<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">

<style type="text/css">
a.teal.item.transition.visible.active1{
	color: #9d7fef;
	font-weight: bold;
}
a.teal.item.transition.visible.active2{
	color: #9d7fef;
	font-weight: bold
}
a.title.active{
	border-bottom: 2px solid #ec889f;
	font-weight: bold
}
div.ui.big.breadcrumb{
	margin-top: 50px;
	margin-left: 30px;
	margin-bottom: 50px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">

$(function(){
	$('.ui.accordion')
	  .accordion()
	;
	$(".btnMenu").on("click",function(){
		console.log("click");
		$('.ui.sidebar')
		  .sidebar('toggle')
		;  
	});
	$(".content a").on("click",function(){
		console.log("click");
		$(this).addClass("active2");
		$(this).siblings().removeClass("active2");
	})
	$(".content a").on({
		mouseover: function(){
			$(this).addClass("active1");
		},
		mouseleave: function(){
			$(this).removeClass("active1");
		}
	});
});
</script>

<body>
<div class="ui top attached menu">
	  <a class="item btnMenu">
	    <i class="sidebar icon"></i>
	    Menu
	  </a>
</div><!-- Menu -->
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
					<a class="teal item">
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
					<a class="teal item">
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
	 	<div class='pusher'>
			<div class="ui big breadcrumb">
			  <a class="section">Member</a>
			  <i class="right chevron icon divider"></i>
			  <div class="active section">List</div>
			</div>
		</div>
	</div>
</body>
</html>