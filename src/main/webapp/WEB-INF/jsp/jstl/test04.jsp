<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL function library</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h2>회원 정보 리스트</h2>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No</th>
					<th>이름</th>
					<th>전화 번호</th>
					<th>국적</th>
					<th>이메일</th>
					<th>자기소개</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${members }" varStatus="status">				
					<tr>
						<td>${status.count }</td>
						<td>${member.name }</td>
						
						<c:set var="phoneNumber" value="${member.phoneNumber }" />
						<c:if test="${!fn:startsWith(member.phoneNumber, '010') }">
							<c:set var="phoneNumber" value="유효하지 않은 전화번호" />
						</c:if>
						<td>${phoneNumber }</td>
						
						<td>${fn:replace(member.nationality, "시대", " -") }</td>
						<c:set var="emailElements" value="${fn:split(member.email, '@') }" />
						
						<td><b>${emailElements[0] }</b>@${emailElements[1] }</td>
						
						<c:set var="introduce" value="${member.introduce }" />
						<c:if test="${fn:length(introduce) gt 15 }">
							<c:set var="introduce" value="${fn:substring(introduce, 0, 15) }..."/>
						</c:if>
						<td class="text-left">${introduce }</td>
					</tr>
				</c:forEach>
			
			</tbody>
		</table>
	
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>