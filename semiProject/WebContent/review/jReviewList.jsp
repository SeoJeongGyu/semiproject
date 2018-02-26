<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function() {
	  $('select').material_select();
	});
</script>


<div>
	<table border="1" >
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
		<li id="tap_et" style="float: left; overflow: hidden; width: 89px; border-right: 1px solid rgb(212, 212, 212); text-align: center; padding: 15px 0px; cursor: pointer; background-color: rgb(255, 255, 255);" onmouseover="tap_menu_check('tap_cat2','1','tap_title_cat2');MM_swapImage('market_tap7','','http://image3.cetizen.com/2007_cetizen/market/2015/icon/2g.png',7)" onmouseout="tap_menu_check('tap_cat2','2','tap_title_cat2');MM_swapImgRestore()" onclick="check_r_onoff('cat2')"><input type="checkbox" name="etc" id="etc" style="display:none"><img src="http://image3.cetizen.com/2007_cetizen/market/2015/icon/2g.png" id="market_tap7">
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

<a class="btn-floating btn-large red" href="<%=request.getContextPath() %>/review.do?cmd=write">
      <i class="large material-icons">mode_edit</i>
    </a>


<!--  리스트 이미지와 내용 보여주는 div-->
 <div style="width:1350px; height:1000px;">
 
<c:forEach var="review" items="${requestScope.rlist}">

<div style="clear:both;float:left;margin-top:15px;height:140px;text-align:center;">

<img src="/semiProject/upload/${review.savefilename}" style="width:210px; border:1px solid #F0F0F0" >
</div>
<div style="float:left;overflow:hidden;width:585px;margin-top:20px;margin-left:10px;">
	<div style="width:98%;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;padding-bottom:2px;"><a href="/semiProject/review.do?cmd=content&rno=${review.rno}"><span class="p16 clr100 b"> ${review.rtitle}</span></a></div>
	<div style="width:98%;margin-top:15px;height:50px;overflow:hidden;" onclick="location.href='/semiProject/review.do?cmd=content&rno=${review.rno}'">
		<span>${review.rcontent}</span>
		</div>
		<br>
	<div style="margin-top:10px;overflow:hidden;padding-bottom:2px;" class="p12 clr02">
	등록 : ${review.rdate}&nbsp;&nbsp;<span class="clr06">|</span>&nbsp;&nbsp;${review.rhit}	</div>
<br>

<div style="margin-top:5px;height:1px;background-color:#E7E7E7;width:999%;"></div> 
			</div>

</c:forEach>
</div>
<br>

<div style="clear:both">
   	<ul class="pagination">
	    <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
	    <li class="active"><a href="#!">1</a></li>
	    <li class="waves-effect"><a href="#!">2</a></li>
	    <li class="waves-effect"><a href="#!">3</a></li>
	    <li class="waves-effect"><a href="#!">4</a></li>
	    <li class="waves-effect"><a href="#!">5</a></li>
	    <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
  	</ul>
  

 </div>

      <div class="row">
      <div class="input-field col s12" style="width: 100px; margin-left: 10px;">
        <select>
      <option value="1">제목</option>
      <option value="2">내용</option>
      <option value="3">아이디</option>
    </select>
      </div>
        <div class="input-field col s2">
          <input id="" type="text" class="validate">
        </div>
      <button class="btn waves-effect waves-light" type="submit" name="action" style="margin-top: 25px;">검색</button>
      </div>
      