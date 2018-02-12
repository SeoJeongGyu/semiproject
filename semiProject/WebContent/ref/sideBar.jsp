<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<script src="js/adminSide.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/adminSide.css" />
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
<!-- <div class="ui bottom attached segment pushed pushable"> -->
		<div class="ui sidebar vertical accordion menu">
		    <div class="item">
			    <a class="title">
			      <i class="dropdown icon"></i>
	      			회원
			    </a>
			    <div class="content">
					<a class="teal item" href="memberList">
		      			회원관리
				    </a>
				</div>
			</div>
		    <div class="item">
			    <a class="title">
			      <i class="dropdown icon"></i>
	      			게시물
			    </a>
			       <div class="content">
					<a class="teal item" href="mpList">
		      			게시물관리
				    </a>
				</div>
			</div>
		    <div class="item">
			    <a class="title">
			      <i class="dropdown icon"></i>
	      			장터
			    </a>
				<div class="content">
					<a class="teal item" href="adminOrderList">
		      			팝니다.
				    </a>
					<a class="teal item" href="">
		      			삽니다.
				    </a>
				</div>
			</div><!-- item -->
		    <div class="item">
			    <a class="title">
			      <i class="dropdown icon"></i>
	      			Event
			    </a>
			       <div class="content">
					<a class="teal item" href="">
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
					<a class="teal item" href="cList">
		      			List
				    </a>
					<a class="teal item" href="cIssueNon">
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
					<a class="teal item" href="reviewList">
		      			Review
				    </a>
					<a class="teal item" href="">
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
					<a class="teal item" href="">
		      			Profit
				    </a>
					<a class="teal item" href="">
		      			Members
				    </a>
				    <a class="teal item" href="">
		      			Brands
				    </a>
				</div> <!--  content -->
			</div><!-- item -->
	 	</div><!-- accordian menu -->
<!-- 	</div> -->
<div class='pusher'>
<div class="ui top attached menu">
			  <a class="item btnMenu">
			    <i class="sidebar icon"></i>
			    Menu
			  </a>
</div><!-- Menu -->
</div>
</body>
</html>