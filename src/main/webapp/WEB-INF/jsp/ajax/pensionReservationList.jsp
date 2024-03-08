<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록 보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/css/PensionStyle.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="pensionHeader.jsp" />
		<jsp:include page="pensionNav.jsp" />
		<section class="w-100">
			<div class="w-100 d-flex align-items-center justify-content-center p-4">
				<span class="h2">예약 목록 보기</span>
			</div>
			<div>
				<table class="table text-center">
					<thead>
						<tr>
							<th width="10%">이름</th>
							<th width="15%">예약날짜</th>
							<th width="15%">숙박일수</th>
							<th width="15%">숙박인원</th>
							<th width="15%">전화번호</th>
							<th width="15%">예약상태</th>
							<th width="15%"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="reservation" items="${reservationList }" varStatus="status">
						<tr>
							<td>${reservation.name }</td>
							<td><fmt:formatDate value="${reservation.date }" pattern="yyyy년 M월 d일" /></td>
							<td>${reservation.day }</td>
							<td>${reservation.headcount }</td>
							<td>${reservation.phoneNumber }</td>
							<c:choose>
								<c:when test="${reservation.state eq '확정' }">
									<td class="text-success">${reservation.state }</td>
								</c:when>
								<c:when test="${reservation.state eq '대기중' }">
									<td class="text-primary">${reservation.state }</td>
								</c:when>
								<c:when test="${reservation.state eq '취소' }">
									<td class="text-danger">${reservation.state }</td>
								</c:when>
								<c:otherwise>
									<td>${reservation.state }</td>
								</c:otherwise>
							</c:choose>
							<td><button type="button" class="btn btn-sm bg-danger text-white delete-btn" value="${reservation.id }">삭제</button></td>
						</tr>						
						</c:forEach>
					</tbody>
				</table>
			</div>
		</section>
		<jsp:include page="pensionFooter.jsp" />
	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			$(".delete-btn").on("click", function(){
				let id = $(this).val();
				$.ajax({
					type:"get"
					, url:"/ajax/pension/reservation/delete"
					, data:{
						"id":id
					}, success:function(data){
						if(data.result == "success"){
							alert("삭제되었습니다.");
							location.replace("/ajax/pension/reservation/listPage");
						}else{
							alert("삭제 실패. : 없는 예약입니다.");
							location.replace("/ajax/pension/reservation/listPage");
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