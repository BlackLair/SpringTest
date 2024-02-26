<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 정보</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h2>공인중개사 정보</h2>
		<table class="table">
			<tbody>
				<tr>
					<td class="text-weight-bolder">ID</td>
					<td>${result.id }</td>
				</tr>
				<tr>
					<td class="text-weight-bolder">상호명</td>
					<td>${result.office }</td>
				</tr>
				<tr>
					<td class="text-weight-bolder">전화 번호</td>
					<td>${result.phoneNumber }</td>
				</tr>
				<tr>
					<td class="text-weight-bolder">주소</td>
					<td>${result.address }</td>
				</tr>
				<tr>
					<td class="text-weight-bolder">등급</td>
					<td>${result.grade }</td>
				</tr>
			</tbody>
		</table>
			
	</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>