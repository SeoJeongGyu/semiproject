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
<script type="text/javascript" src="js/insertProduct.js"></script>
<script type="text/javascript" src="js/adminSide.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<link href="https://cdn.rawgit.com/mdehoog/Semantic-UI-Calendar/76959c6f7d33a527b49be76789e984a0a407350b/dist/calendar.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/memberList.css">
<link rel="stylesheet" href="css/productList.css">
<meta charset="UTF-8">
<title>관리자 - 회원 목록 </title>
</head>
<body>
<div class="ui top attached demo menu">
  <a class="item" id="btnMenu">
    <i class="sidebar icon"></i>
    Menu
  </a>
</div>
<div class="ui bottom attached segment pushable">
<%@include file="../ref/adminSide.jsp" %>
			<div class="pusher">
			  <!-- Site content !-->
				<div class="ui big breadcrumb">
				  <a class="section">Product</a>
				  <i class="right chevron icon divider"></i>
				<div class="active section">New Product</div>
				
				<div class="mainContent">
				<form class="ui form" action="writeProduct" method="post" accept-charset="UTF-8">
					<div class="ui grid">
					
						<!-- 기본정보 -->
						<div class="ten wide column">
							<div class="field">
							    <label>제품명</label>
							    <input name="p_name" type="text" placeholder="제품명" value="">
							</div>
							<div class="field">
							    <label>상세 정보</label>
							    <textarea name="description" placeholder="제품의 상세정보를 입력해주세요."></textarea>
							</div>
						</div>
						
						<!-- 대표이미지 -->
						<div class="six wide column">
							<label>대표 이미지</label>
							<div class="ui special six doubling cards" id="mainImgDiv">
							 <div class="card" style="height:300px; width: 250px;">
							    <div class="blurring dimmable image">
							      <div class="ui dimmer">
							        <div class="content">
							          <div class="center">
							          <input type="file" name="mainfile" id="mainImgFile" class="imgFile" style="display:none;"/>
							            <div class="ui inverted button" id="mainImgAdd">Edit</div>
							          </div>
							        </div>
							      </div>
							       <img src="" style="height:300px; width: 250px;" id="mainImgAttr">
							    </div>
							  </div>
							</div>
						</div>
						
						<!-- 브랜드/제조사/제조국/달력 -->
						<div class="four wide column">
							<div class="field">
								<label>브랜드</label>
								<input type="text" name="brand_name" placeholder="브랜드" value="" />
							</div>
						</div>
						<div class="four wide column">
							<div class="field">
								<label>제조사</label>
								<input type="text" name="company" placeholder="제조사" value="" />
							</div>
						</div>
						<div class="four wide column">
							<div class="ui form">
								<div class="field">
									<label>제조국</label>
									<select class="ui dropdown" name="producer">
									  <option value="">Select Country</option>
								      <option value="Austria">Austria</option>
								      <option value="China">China</option>
								      <option value="France">France</option>
								      <option value="Germany">Germany</option>
								      <option value="HongKong">HongKong</option>
								      <option value="Italy">Italy</option>
								      <option value="Japan">Japan</option>
								      <option value="Korea">Korea</option>
								      <option value="Singapore">Singapore</option>		
								      <option value="UnitedKingdom">UnitedKingdom</option>
								      <option value="UnitedStates">UnitedStates</option>
									</select>
								</div>
							</div>
						</div>
						
						<!-- 달력 -->
						<div class="three wide column">
							<div class="field">
								<label>제조일</label>
								  <div class="ui calendar" id="product_date">
									          <div class="ui input left icon">
									            <i class="calendar icon"></i>
									            <input type="text" placeholder="" name="p_date">
									          </div>
								</div>
						    </div>
						</div>
						
						
						<!-- 카테고리 분류 -->
						<div class="five wide column" id="category">
							<div class="field">
								<label>카테고리</label>
								<select class="ui dropdown" id="cate" name="category_no">
									<option value="">대분류</option>
									<c:forEach var="category" items="${categories }">
										<option id="cateNo" value="${category.category_no}">${category.category_name }</option>
									</c:forEach>					
								</select>
							</div>
						</div>
						
						<div class="five wide column" id="division">
							<div class="field">
								<label>　</label>
								<select class="ui dropdown" id="divi" name="division_no">
									<option value="">중분류</option>
								</select>
							</div>				
						</div>
						<div class="five wide column" id="section">
							<div class="field">
								<label>　</label>
								<select class="ui dropdown" id="sect" name="section_no">
									<option value="">소분류</option>
								</select>
							</div>
						</div>
						
						<!-- 이미지 -->
						<div class="sixteen wide column" id="divImages">		
							<div class="ui special six doubling cards" id="imgDiv">
							  <div class="card" style="height: 500px;width:300px;">
							    <div class="blurring dimmable image">
							      <div class="ui dimmer">
							        <div class="content">
							          <div class="center">
							          <input type="file" id="imgFile" class="imgFile" style="display:none;"/>
							            <div class="ui inverted button" id="imgAdd">Add</div>
							          </div><!-- center -->
							        </div> <!-- content -->
							      </div> <!-- ui dimmer -->
							      <img src="" style="height: 500px;width:300px;" class="">
							    </div> <!-- image -->
							    <div class="extra content">
							      <a class="imgRemove">
							        <i class="remove icon"></i>
							        삭제
							      </a>
							    </div><!-- extra content -->
							  </div> <!-- card  -->
							</div> <!-- doubling cards / imgDiv -->
						</div><!-- wide column -->
						
						
						<!-- 옵션 추가 삭제 -->
						<div class="thirteen wide column"></div>
						<div class="two wide column">
							<div class="ui button" id="addOption">
								옵션 추가
							</div>
						</div>
					</div>
					<div class="ui grid" id="optionDiv">
						<div class="five wide column" id="option_name">
							<div class="field">
								<label>제품 이름</label>
								<input name="option_name" type="text" value=""/>
							</div>
						</div>
						<div class="three wide column" id="option_price">
							<div class="field">
								<label>가격</label>
								<input name="option_price" type="text" value=""/>
							</div>
						</div>
						<div class="three wide column" id="option_quantity">
							<div class="field">
								<label>재고</label>
								<input name="option_quantity" type="text" value=""/>
							</div>
						</div>
						<div class="three wide column" id="option_volume">
							<div class="field">
								<label>용량</label>
								<input name="option_volume" type="text" value=""/>
							</div>
						</div>
						<div class="one wide column" id="option_remove">
							<div class="field">
								<label>　</label>
								<i class="big remove icon" onclick="option_remove()"></i>
							</div>
						</div>
					</div>	
					<div class="ui grid">	
						<div class="sixteen wide column">
							<div class="field">
							    <label>성분 정보</label>
							    <textarea name="ingredient" placeholder="제품의 성분 정보를 입력해주세요."></textarea>
							</div>
						</div>
						
						
						<!-- 상품 최종 추가 취소 버튼 -->
						<div class="four column centered row">
							<div class="two wide column">
								<div class="ui button" id="cancel" onclick="mpList()">
									취소
								</div>
							</div>
							<div class="two wide column">
								<button class="ui button" id="addProduct">
									완료
								</button>
							</div>
						</div>
					</div>
				</form>
 				</div><!-- main content -->
			</div><!--  pusher -->
	</div>
</div>
</body>
</html>