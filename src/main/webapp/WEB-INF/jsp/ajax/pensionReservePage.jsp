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
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/css/PensionStyle.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="pensionHeader.jsp" />
		<jsp:include page="pensionNav.jsp" />
		<section class="d-flex justify-content-center">
			<div class="w-50">
				<div class="w-100 d-flex align-items-center justify-content-center p-4">
					<span class="h2">예약 하기</span>
				</div>
				<div>
					<label>이름</label>
					<input type="text" id="nameInput" class="form-control">
					<label>예약날짜</label>
					<input type="text" id="dateInput" class="form-control bg-white" readonly>
					<label>숙박일수</label>
					<input type="text" id="dayInput" class="form-control">
					<label>숙박인원</label>
					<input type="text" id="headcountInput" class="form-control">
					<label>전화번호</label>
					<input type="text" id="phoneNumberInput" class="form-control">
					<button type="button" id="reserveButton" class="form-control bg-warning mt-3">예약하기</button>
				</div>
			</div>
			
		</section>
		<jsp:include page="pensionFooter.jsp" />
	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js" integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function(){
			$("#dateInput").datepicker({
				dateFormat:"yy년 m월 d일"
				, minDate:0
			});
			$("#reserveButton").on("click", function(){
				let name = $("#nameInput").val();
				let date = $("#dateInput").val();
				let day = $("#dayInput").val();
				let headcount = $("#headcountInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				if(name.length == 0){
					alert("이름을 입력하세요.");
					return;
				}
				if(date.length == 0){
					alert("예약날짜를 선택하세요.");
					return;
				}
				if(day.length == 0 || isNaN(day) || day == 0){
					alert("1 이상의 숙박일수를 입력하세요.");
					return;
				}
				if(headcount.length == 0 || isNaN(headcount) || headcount == 0){
					alert("1 이상의 숙박인원을 입력하세요.");
					return;
				}
				if(phoneNumber.length == 0){
					alert("전화번호를 입력하세요.");
					return;
				}
				$.ajax({
					type:"get"
					, url:"/ajax/pension/reservation/reserve"
					, data:{
						"name":name
						, "date":date
						, "day":day
						, "headcount":headcount
						, "phoneNumber":phoneNumber
					}, success:function(data){
						if(data.result == "success"){
							alert("예약되었습니다.");
							location.replace("/ajax/pension/reservation/listPage");
						}else{
							alert("예약에 실패했습니다.");
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