<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/semantic.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.10/components/grid.min.css">
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/adminSide.css" />
<style type="text/css">
.ui.icon.input>i.icon:not(.link) {
    pointer-events: visiblepainted;
}
.selectable tr:hover{
	cursor: pointer;
}

#calBtn{ height : 38px;	margin-left: 15px;	margin-top: 13px;}
</style>
<script type="text/javascript">
	$(function(){	
		
		/////header//////
			
		// 카테고리별 분류
		
		$('.ui.dropdown').dropdown();
		
	 	$("#cate").on("change",function(){
			var cate = $("#cate").val();
			console.log("category is selected :: "+cate);
			$("#division div.text").html("중분류").addClass("default");
			$("#section div.text").html("소분류").addClass("default");
			cate_no(cate);
		});
		
	 	$("#divi").on("change",function(){
			var divi = $("#divi").val();
				$("#section div.text").html("소분류").addClass("default");
				divi_no(divi);
		 		console.log("division is changing.")
		 		$("#section div.text").html("소분류").addClass("default");
				var divi = $("#divi").val();
				console.log($("div.item.active.selected").html());
				divi_no(divi);
		});
	 	
		
		function cate_no(cate){
			console.log(cate);
			$.ajax({
				type:'POST',
				data:{
					cateno:cate
				},
				url:"divisionList",
				success:function(object){
					var html="";
					$.each(object, function(index,entry){
						html+="<c:forEach var='division' items='"+entry+"'>";
						html+="<option value='"+entry.division_no+"'>"+entry.division_name+"</option>";
						html+="</c:forEach>";				
					});
					$("#divi").html(html);
				},
				error:function(){
					alert("실패");
				}
			});
		}
		
		
		 function divi_no(divi){
			console.log("function divi_no"+divi);
			$.ajax({
				type:'POST',
				data:{
					divino:divi
				},
				beforeSend:function(){
					console.log($("#divi").val());
				},
				url:"sectionList",
				success:function(object){
					console.log(object);
					var html="";
					html+="<option value=''>중분류</option>";
					$.each(object, function(index,entry){
						html+="<c:forEach var='section' items='"+entry+"'>";
						html+="<option value='"+entry.section_no+"'>"+entry.section_name+"</option>";
						html+="</c:forEach>";				
					});
					$("#sect").html(html);
				},
				error:function(){
					alert("실패");
				}
			});
		}
		 
		// 카테고리별 제품 찾기
	 	$("#sect").on("change", function(){
	 		var sect = $("#sect").val()
	 		location.href="/web/searchSection?section="+sect;
	 	});
		
		// 제품명 검색
		/* 아이콘 눌렸을때  */
		$("i.icon.search").on("click",function(){
			var input = $("#searchText").val();
			var sel = $("#searchField").val();
			location.href="/web/searchName?input="+input;
		});
		// Enter 키로 검색한 경우 
		$("#searchText").keydown(function(){
			// 제품명으로 검색한 경우.
			if(event.keyCode==13){
				var input = $("#searchText").val();
				var sel = $("#searchField").val();
				location.href="/web/searchName?input="+input;	
			}
		});
		
		// 전체조회
		$("#btnTotalList").on("click",function(){
			location.href="/web/mpList";
		});
		
		// 제품 삭제 버튼 클릭 시, 선택된 제품 번호를 가져와서 컨트롤러로 전달 .
		$("#btnRemove").on("click",function(){
			$("input.productCheck:checked").each(function(){
				console.log(this.value);
				$.ajax({
					type:'post',
					url:"productDelete",
					data:"product_no="+this.value,
					success:function(object){
					console.log(object);
					location.reload();
					}  
				});
			})
		});
		
		$("input.checkAll").on("change",function(){
			if($(this).is(":checked")){
				$("input.productCheck").prop('checked', true);
			}else{
				$("input.productCheck").prop('checked', false);
			}
		})
		
	});//start function end.
	
	function selectProduct(no){
		location.href="mpDetail?no="+no;
	}
	function insertBtn(){
		location.href="insertProduct";
	}
	
</script>
</head>
<body>
<div class="ui grid">
	<!-- 카테고리 -->
	<div class="ten wide column" id="category">
		<select class="ui dropdown" id="cate" name="category_no" style="width: 200px;">
			<option value="">대분류</option>
			<c:forEach var="category" items="${categories }">
				<option value="${category.category_no}">${category.category_name }</option>
			</c:forEach>					
		</select>
		<select class="ui dropdown" id="divi" name="division_no" style="width: 200px;">
			<option value="">중분류</option>
		</select>
		<select class="ui dropdown" id="sect" name="section_no" style="width: 200px;">
			<option value="">소분류</option>
		</select>
	</div>
	<!--  - - - - - - - - - - - - - - - - - - - - - -  - - - - - - -  - - - - - - - - -->

		<!-- 검색카테고리 그리드 -->
	<div class="two wide column">
    	<select name="searchField" id="searchField" class="ui fluid dropdown">
	      	<option value="제품명">제품명</option>
		</select>
   	</div>	<!-- 검색카테고리 그리드 끝 -->
   	<!-- 검색창 -->
    <div class="two wide column">
		<div class="ui search">
		  <div class="ui icon input">
		    <input class="prompt" type="text" placeholder="검색" value="" id="searchText"> 
		    <i class="search icon"id="searchIcon"></i>
		  </div>
		</div><!-- search -->
	</div><!-- column -->
</div><!-- ui grid -->


<!---------------- 테이블 ------------------>
<table class="ui compact celled definition selectable table">
  <thead class="full-width">
    <tr>
      <th class="collapsing">
      	<div class="ui fitted checkbox">
          <input type="checkbox" value="${p.product_no }" class='checkAll'> <label></label>
        </div>
      </th>
      <th>대표이미지</th>
      <th>카테고리</th>
      <th>제품명</th>
      <th>제품번호</th>
      <th>가격</th>
      <th>재고현황</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${pdto }" var="p" >
    <tr>
      <td class="collapsing">
        <div class="ui fitted checkbox">
          <input type="checkbox" value="${p.product_no }" class='productCheck'> <label></label>
        </div>
      </td>
	  <td onclick="selectProduct(${p.product_no})">
	  	
	  </td>
	  <td onclick="selectProduct(${p.product_no})">${p.category_name } > ${p.division_name } > ${p.section_name}</td>
	  <td onclick="selectProduct(${p.product_no})">${p.p_name }</td>
	  <td onclick="selectProduct(${p.product_no})">${p.product_no}</td>
	  <td onclick="selectProduct(${p.product_no})">${p.option_price }</td>
	  <td>
		  <select class="ui dropdown" id="option_quantity" name="option_quantity" style="width: 200px;">
				<option value="">재고현황</option>
					<c:forEach var="q" items="${selectQuantity }">
						<c:if test="${p.product_no eq q.o_product_no }">
							<option disabled="disabled" value="${q.product_no}">${q.option_name } : ${q.option_quantity }</option>
						</c:if>
					</c:forEach>
			</select>
	  </td>
	  
    </tr>
  </c:forEach>

  </tbody>
  <tfoot class="full-width">
  	 <tr>
      <th></th>
      <th colspan="8">
      	 <div class="ui right floated small labeled icon button" id="insertBtn" onclick="insertBtn()">
		   <i class="user icon"></i>
		   추가
		 </div>
		 <div class="ui right floated small labeled icon button" id="btnRemove">
		   <i class="user icon"></i>
		   삭제
		 </div>
		 <div class="ui small button" id="btnTotalList">
		   전체조회
		 </div>
      </th>
    </tr>
  </tfoot>
</table>

<div class="ui right floated pagination menu">
   <c:if test="${criteria.prev==true}">
	   <a class="icon item" href="${requestTitle}?pno=${criteria.startPage-10}&s=${s}&e=${e}&name=${name}">
	     <i class="left chevron icon"></i>
	   </a>
   </c:if>
   <c:forEach begin="${criteria.startPage}" end="${criteria.endPage}" var="index">
	   <a class="item" href="${requestTitle}?pno=${index}&s=${s}&e=${e}&name=${name}">${index}</a>
   </c:forEach>
   <c:if test="${criteria.next==true }">
	   <a class="icon item" href="${requestTitle}?pno=${criteria.endPage+1}&s=${s}&e=${e}&name=${name}">
	     <i class="right chevron icon"></i>
	   </a>
   </c:if>
</div><!-- pagination menu -->
</body>
</html>