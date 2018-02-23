<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="wrap">

	<form action="" method="post">
		<!--  상단 작성자, 작성일, 조회수 -->
		<div
			style="overflow: hidden; padding-bottom: 5px; border-bottom: 2px solid #4B4C51">
			<br>
		</div>
		<div style="overflow: hidden; padding: 10px 0px 10px 0px;">
			<div
				style="margin-left: 15px; width: 12%; float: left; overflow: hidden; padding: 5px;">
				<img src="image/ico_point.gif"><span>작성자&nbsp; <span>${vo.id }</span></span>
			</div>
			<div style="width: 30%; float: left; overflow: hidden; padding: 5px">
				<span><img src="image/ico_point.gif">등록&nbsp;
					<span>${vo.rdate }</span><span>&nbsp;&nbsp;</span><img
					src="image/ico_point.gif">&nbsp;조회수 &nbsp;<span>${vo.rhit }</span></span>
			</div>
		</div>
		<div
			style="overflow: hidden; padding-bottom: 5px; border-bottom: 2px solid #4B4C51"></div>

<!--  제목 보여주기 -->
<div id="title">
<h3 align="center">${vo.rtitle }</h3>
</div>

		<!-- 내용보여주기  -->
<div id="content" style="margin-left: 250px;"><span>${vo.rcontent }</span></div>

<!--통신사 텔레콤 테이블  -->

<table class="bordered centered">
        <thead>
          <tr>
              <th>통신사;</th>
              <th>Item Name</th>
             
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>Alvin</td>
         
          </tr>
          <tr>
            <td>Alan</td>
     
  
          </tr>
     
        </tbody>
      </table>



		<div id="telecom&company">${vo.telecom } ${vo.company }</div>
		<!-- 댓글기능  -->
		<div id="bottom"></div>





	</form>
</div>