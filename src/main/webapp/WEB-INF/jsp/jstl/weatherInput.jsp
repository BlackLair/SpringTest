<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청 - 과거 날씨</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/css/weatherstyle.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
</head>
<body>
	<div class="wrap">
		<div class="d-flex">
			<jsp:include page="weatherAside.jsp" />
			<section class="p-4">
				<div class="weatherInput">
					<h2>날씨 입력</h2>
					<br><br>
					<form method="post" action="/jstl/createweather">
						<div class="d-flex align-items-center ml-5">
							<label>날짜</label>
							<input name="date" type="text" class="form-control col-3 ml-2" id="dateInput" readonly>
							<label class="ml-5">날씨</label>
							<select name="weather" class="form-control col-2 ml-2">
								<option value="맑음">맑음</option>
								<option value="구름조금">구름조금</option>
								<option value="흐림">흐림</option>
								<option value="비">비</option>
							</select>
							<label class="ml-5">미세먼지</label>
							<select name="microDust" class="form-control col-2 ml-2">
								<option value="좋음">좋음</option>
								<option value="보통">보통</option>
								<option value="나쁨">나쁨</option>
								<option value="최악">최악</option>
							</select>
						</div>
						<br>
						<div class="d-flex align-items-center ml-5">
							<label>기온</label>
							<div class="input-group col-3">
								<input id="input-temperature" name="temperatures" type="text" class="form-control">
								<div class="input-group-append" >
									<span class="input-group-text">ºC</span>
								</div>
							</div>
							<label class="ml-5">강수량</label>
							<div class="input-group col-3 ml-2">
								<input id="input-precipitation" name="precipitation" type="text" class="form-control">
								<div class="input-group-append" >
									<span class="input-group-text">mm</span>
								</div>
							</div>
							<label class="ml-5">풍속</label>
							<div class="input-group col-3 ml-2">
								<input id="input-windSpeed" name="windSpeed" type="text" class="form-control">
								<div class="input-group-append" >
									<span class="input-group-text">km/h</span>
								</div>
							</div>
						</div>
						<div class="d-flex align-items-center justify-content-end mt-3">
							<div class="col-2">
								<button id="btn-submit" type="submit" class="form-control bg-success text-white">저장</button>
							</div>
						</div>
					</form>
				</div>
			</section>
		</div>
		<jsp:include page="weatherFooter.jsp"/>
	</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js" integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script>
		$(document).ready(function(){
			$("#dateInput").datepicker({
				dateFormat:"yy년 mm월 dd일"
			});
			$("#btn-submit").click(function(e){
				if($("#dateInput").val().length == 0){
					alert("날짜를 선택하세요.");
					return false;
				}
				if($("#input-temperature").val().length == 0 || isNaN($("#input-temperature").val())){
					alert("올바른 기온을 입력하세요.");
					return false;
				}
				if($("#input-precipitation").val().length == 0 || isNaN($("#input-precipitation").val())){
					alert("올바른 강수량을 입력하세요.");
					return false;
				}
				if($("#input-windSpeed").val().length == 0 || isNaN($("#input-windSpeed").val())){
					alert("올바른 풍속을 입력하세요.");
					return false;
				}
				
			});
			
		});

</script>
</body>
</html>