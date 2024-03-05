<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가하기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<h2>즐겨찾기 추가하기</h2>
	<label>제목</label>
	<input id="input-name" type="text" class="form-control">
	<label class="mt-2">주소</label>
	<input id="input-url" type="text" class="form-control">
	<button id="btn-add" type="button" class="form-control bg-success text-white mt-2">추가</button>
	
	
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		$("#btn-add").on("click", function(){
			let name = $("#input-name").val();
			let url = $("#input-url").val();
			if(name.length == 0){
				alert("제목을 입력하세요.");
				return false;
			}
			if(url.length == 0){
				alert("url을 입력하세요.");
				return false;
			}
			if(!url.startsWith("http://") && !url.startsWith("https://")){
				alert("올바른 url이 아닙니다.");
				return false;
			}
			$.ajax({
				type:"get"
				, url:"/ajax/createFavorite"
				, data:{
					"name":name
					, "url":url
				}, success:function(data){
					location.href = data;
				}
			});
		});
	});
</script>
</body>
</html>