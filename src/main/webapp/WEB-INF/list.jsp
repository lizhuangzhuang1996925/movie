<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" style="text/css" href="<%=request.getContextPath()%>/css/index2.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.2.min.js"></script>
</head>
<body><input type="button" value="查询">
	<table>
		<tr>
			<td><input type="checkbox" id="qx">全选/全不选<input type="checkbox" id="fx">反选</td>
			<td>影片名称</td>
			<td>导演</td>
			<td>票价</td>
			<td>上映时间<input type="button" value="^" onclick="px(${map.tpx==1?0:1 })"></td>
			<td>时长<input type="button" value="^" onclick="px(${map.tpx==1?0:1 })"></td>
			<td>类型</td>
			<td>年代<input type="button" value="^" onclick="px(${map.tpx==1?0:1 })"></td>
			<td>区域</td>
			<td>状态</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list }" var="m">
		<tr>
			<td><input type="checkbox" class="xx" value="${m.mid }"></td>
			<td>${m.mname}</td>
			<td>${m.mautor }</td>
			<td>${m.mprice }</td>
			<td>${m.mdate }</td>
			<td>${m.mtime }</td>
			<td>${m.mtype }</td>
			<td>${m.nname }</td>
			<td>${m.maddress }</td>
			<c:if test="${m.mzt==0 }">
			<td>正在热映</td>
			<td><input type="button" value="详情"><input type="button" value="编辑"><input type="button" value="下架" onclick="xj(${m.mid})"></td>
			</c:if>
			<c:if test="${m.mzt==1 }">
			<td>已经下架</td>
			<td><input type="button" value="详情"><input type="button" value="编辑"><input type="button" value="上架" onclick="sj(${m.mid})"></td>
			</c:if>
		</tr>
		</c:forEach>
		<tr><td><input type="button" value="批量删除" id="plsc"></td><td colspan="11">${fenye }</td></tr>
	</table>
	<form method="post" style="display: none;" action="list">
	影片名称:<input type="text" name="mname" value="${map.mname }" placeholder="aaaa">----导演名称:<input type="text" name="mautor" value="${map.mautor }"><br>
	  影片年代:<input type="text" name="nname" value="${map.nname }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上映时间<input type="text" name="mindate" value="${ map.mindate}" onclick="WdatePicker()">---<input type="text" name="maxdate" value="${ map.maxdate}" onclick="WdatePicker()"><br>
	价格<input type="text" name="minprice" value="${ map.minprice}">---<input type="text" name="maxprice" value="${ map.maxprice}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电影时长<input type="text" name="mintime" value="${ map.mintime}">---<input type="text" name="maxtime" value="${ map.maxtime}"><br>
	<input type="submit" value="搜索" id="s"><input type="reset" value="重置">
	</form>
	
	<script type="text/javascript">
	//排序
	function px(tps) {
		location="list?tpx="+tps;
	}
	//查询
	$("[value='查询']").click(function() {
		$("form").show();
	})
	//下架
	function xj(mid) {
		$.ajax({
			url:"xj",
			data:{mid:mid},
			type:"post",
			dataType:"json",
			success:function(num){
				if(num){
					alert("下架成功");
					location="list";
				}
			}
		})
	}
	//上架
	
		function sj(mid) {
			$.ajax({
				url:"sj",
				data:{mid:mid},
				type:"post",
				dataType:"json",
				success:function(num){
					if(num){
						alert("上架成功");
						location="list";
					}
				}
			})
		}
	
	//批量删除
	$("#plsc").click(function() {
		var ids="";
		$(":checked.xx").each(function() {
			ids=","+$(this).val();
		})
		ids=ids.substring(1);
		$.ajax({
			url:"del",
			data:{ids:ids},
			type:"post",
			dataType:"json",
			success:function(num){
				if(num){
					alert("删除成功");
					location="list";
				}
			}
		})
	})
	//全选/全不选反选
	$("#qx").click(function() {
		$(".xx").prop("checked",$(this).prop("checked"));
	})
	$("#fx").click(function() {
		$(".xx").each(function() {
			$(this).prop("checked",!$(this).prop("checked"));
		})
	})
	</script>
</body>
</html>