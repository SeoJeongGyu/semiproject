<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
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

</body>
</html>