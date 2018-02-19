<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
</head>
<body style="margin-left: auto; margin-right:auto;">
<div style="margin-left:auto;margin-right:auto;">
	<table border="1" align="center">
	<tr><td><ul style="overflow:hidden;">
		<li id="tap_skt" style="float:left; overflow: hidden; width: 89px; border-right: 1px solid rgb(212, 212, 212); text-align: center; padding:15px; background-color: rgb(255, 255, 255);"><input type="checkbox" name="w[1]" id="w1" value="1" style="display:none"><img src="http://image3.cetizen.com/2007_cetizen/market/2015/icon/skt.png" id="market_tap1">
			<span id="tap_title_skt" style="display: block; margin-top: 5px; color: rgb(75, 76, 81);" class="p11 ">SKT</span>
		</li>
		<li id="tap_kt" style="float: left; overflow: hidden; width: 89px; border-right: 1px solid rgb(212, 212, 212); text-align: center; padding: 15px 0px; background-color: rgb(255, 255, 255);" ><input type="checkbox" name="w[2]" id="w2" value="2" style="display:none"><img src="http://image3.cetizen.com/2007_cetizen/market/2015/icon/kt.png" id="market_tap2">
			<span id="tap_title_kt" style="display: block; margin-top: 5px; color: rgb(75, 76, 81);" class="p11  ">KT</span>
		</li> 
		<li id="tap_lgu" style="float: left; overflow: hidden; width: 89px; border-right: 1px solid rgb(212, 212, 212); text-align: center; padding: 15px 0px; cursor: pointer; background-color: rgb(255, 255, 255);"><input type="checkbox" name="w[3]" id="w3" value="3" style="display:none"><img src="http://image3.cetizen.com/2007_cetizen/market/2015/icon/lgu+.png" id="market_tap3">
			<span id="tap_title_lgu" style="display: block; margin-top: 5px; color: rgb(75, 76, 81);" class="p11  ">LG U+</span>
		</li>
		<li id="tap_apple" style="float: left; overflow: hidden; width: 89px; border-right: 1px solid rgb(212, 212, 212); text-align: center; padding: 15px 0px; cursor: pointer; background-color: rgb(255, 255, 255);"><input type="checkbox" name="m[12]" id="m12" value="12" style="display:none"><img src="http://image3.cetizen.com/2007_cetizen/market/2015/icon/apple.png" id="market_tap4">
			<span id="tap_title_m12" style="display: block; margin-top: 5px; color: rgb(75, 76, 81);" class="p11 ">애플</span>
		</li>
		<li id="tap_samsung" style="float: left; overflow: hidden; width: 93px; border-right: 1px solid rgb(212, 212, 212); text-align: center; padding: 35px 0px 15px; cursor: pointer; background-color: rgb(255, 255, 255);"><input type="checkbox" name="m[1]" id="m1" value="1" style="display:none"><img src="http://image3.cetizen.com/2007_cetizen/market/2015/icon/samsung.png" id="market_tap5">
			<span id="tap_title_m1" style="display: block; margin-top: 17px; color: rgb(75, 76, 81);" class="p11 ">삼성</span>
		</li>
		<li id="tap_lg" style="float: left; overflow: hidden; width: 89px; border-right: 1px solid rgb(212, 212, 212); text-align: center; padding: 15px 0px; cursor: pointer; background-color: rgb(255, 255, 255);"><input type="checkbox" name="m[2]" id="m2" value="2" style="display:none"><img src="http://image3.cetizen.com/2007_cetizen/market/2015/icon/lg.png" id="market_tap6">
			<span id="tap_title_m2" style="display: block; margin-top: 5px; color: rgb(75, 76, 81);" class="p11 ">LG</span>
		</li>
		<li id="tap_et" style="float: left; overflow: hidden; width: 89px; border-right: 1px solid rgb(212, 212, 212); text-align: center; padding: 15px 0px; cursor: pointer; background-color: rgb(255, 255, 255);" onmouseover="tap_menu_check('tap_cat2','1','tap_title_cat2');MM_swapImage('market_tap7','','http://image3.cetizen.com/2007_cetizen/market/2015/icon/2g.png',7)" onmouseout="tap_menu_check('tap_cat2','2','tap_title_cat2');MM_swapImgRestore()" onclick="check_r_onoff('cat2')"><input type="checkbox" name="cat[2]" id="cat2" style="display:none" value="1"><img src="http://image3.cetizen.com/2007_cetizen/market/2015/icon/2g.png" id="market_tap7">
			<span id="tap_title_cat2" style="display: block; margin-top: 5px; color: rgb(75, 76, 81);" class="p11 ">기타</span>
		</li>
	</ul>
	</td>
	</tr>
	</table>
</div>
<div>

<c:choose>
	<c:when test="${startPage>4 }">
		<a href="<%=request.getContextPath() %>/board/list.do?pageNum=${startPage-1 }">이전</a>
	</c:when>
	<c:otherwise>
		이전
	</c:otherwise>
</c:choose>

	<c:forEach var="i" begin="${startPage }"  end="${endPage }">
		<c:choose>
			<c:when test="${pageNum==i }">
				<a href="<%=request.getContextPath()%>/review.do?pageNum=${i}">
				<span style="color:blue">[${i }]</span>
				</a>
			</c:when>
			<c:otherwise>
				<a href="<%=request.getContextPath()%>/review.do?pageNum=${i}">
				<span style="color:gray">[${i }]</span>
				</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<c:choose>
	<c:when test="${endPage<pageCount }">
		<a href="<%=request.getContextPath() %>/review.do?pageNum=${endPage+1 }">다음</a>
	</c:when>
	<c:otherwise>
		다음
	</c:otherwise>
</c:choose>


	
</div>

<div>
<table class="bordered">
        <thead>
          <tr>
              <th>Name</th>
              <th>Item Name</th>
              <th>Item Price</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>Alvin</td>
            <td>Eclair</td>
            <td>$0.87</td>
          </tr>
          <tr>
            <td>Alan</td>
            <td>Jellybean</td>
            <td>$3.76</td>
          </tr>
          <tr>
            <td>Jonathan</td>
            <td>Lollipop</td>
            <td>$7.00</td>
          </tr>
        </tbody>
      </table>
            
</div>
<ul class="pagination">
    <li class="disabled"><a href="#!"><i class="material-icons">이전</i></a></li>
    <li class="active"><a href="#!">1</a></li>
    <li class="waves-effect"><a href="#!">2</a></li>
    <li class="waves-effect"><a href="#!">3</a></li>
    <li class="waves-effect"><a href="#!">4</a></li>
    <li class="waves-effect"><a href="#!">5</a></li>
    <li class="waves-effect"><a href="#!"><i class="material-icons">다음</i></a></li>
  </ul>
    
</body>
</html>