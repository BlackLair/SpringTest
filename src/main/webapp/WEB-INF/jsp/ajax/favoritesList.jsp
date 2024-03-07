<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<h2>즐겨 찾기 목록</h2>
	<table class="table">
		<thead>
			<tr>
				<th width="20%">No.</th>
				<th width="30%">이름</th>
				<th width="40%">주소</th>
				<th width="10%"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="favorite" items="${favoritesList }" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td>${favorite.name }</td>
				<td>${favorite.url }</td>
				<td>
					<button type="button" value="${favorite.id }" class="btn btn-delete btn-sm bg-danger text-white">삭제</button>
				</td>
			</tr>		
			</c:forEach>
		</tbody>
	
	</table>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			$(".btn-delete").on("click", function(){
				let id = $(this).val();
				$.ajax({
					type:"get"
					, url:"/ajax/favorites/remove"
					, data:{
						"id":id
					}, success:function(data){
						if(data.result){
							alert("삭제되었습니다.");
							location.href = "/ajax/favorites/list";
						}else{
							alert("삭제 실패!");
						}
					}, error:function(){
						alert("기타 오류");
					}
				});
			});
		});
	</script>
</body>
</html>