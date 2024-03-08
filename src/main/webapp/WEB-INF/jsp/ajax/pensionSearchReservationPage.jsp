<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="/css/PensionStyle.css" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
        <title>통나무 팬션</title>
    </head>
    <body>
        <div id="wrap">
            <jsp:include page="pensionHeader.jsp" />
            <jsp:include page="pensionNav.jsp" />
            <section id="banner">
                <img id="mainImg" alt="메인이미지" src="http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg">
            </section>
            <section id="info" class="d-flex text-white">
                <div class="col-4 d-flex justify-content-center align-items-center bg-brown">
                    <div class="display-4">
                        실시간<br>
                        예약 하기
                    </div>
                </div>
                <div class="col-5 bg-lightbrown d-flex flex-column p-3">
                    <div id="accountradioDiv" class="d-flex">
                        <div class="h4 m-3">예약 확인</div>
                    </div>
                    <div id="inputDiv" class="d-flex w-100 flex-wrap align-items-center justify-content-start">
                            <div class="member m-3 col-3 text-center">이름</div><input id="nameInput" type="text" class="member form-control col-7">
                            <div class="member m-3 col-3 text-center">전화번호</div><input id="phoneNumberInput" type="text" class="member form-control col-7">

                            <div class="d-flex justify-content-end w-100">
                                <div>
                                    <button id="searchButton" class="form-control mt-3 bg-success border-0 text-white">조회 하기</button>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="col-3 bg-brown d-flex justify-content-center align-items-center">
                    <div class="text-white h2">
                        예약문의:<br>
                        010-<br>
                        000-1111
                    </div>
                </div>
            </section>
            <jsp:include page="pensionFooter.jsp" />
        </div>

        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function(){
                let picIndex = 0;
                let picLink = [
                    "http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg",
                    "http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner2.jpg",
                    "http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner3.jpg",
                    "http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner4.jpg"
                ];
                setInterval(function(){  // 3초마다 수행
                    picIndex = (picIndex + 1) % picLink.length;
                    $("#mainImg").attr("src", picLink[picIndex]);
                }, 3000);
                
                $("#searchButton").on("click", function(){
					let name = $("#nameInput").val();
					let phoneNumber = $("#phoneNumberInput").val();
					if(name.length == 0){
					    alert("이름을 입력하세요.");
					    return;
					}
					if(phoneNumber.length == 0){
					    alert("전화번호를 입력하세요.");
					    return;
					}
					$.ajax({
						type:"get"
						, url:"/ajax/pension/reservation/search"
						, data:{
							"name":name
							, "phoneNumber":phoneNumber
						}, success:function(data){
							if(data.result == "success"){
								alert("이름 : " + data.name
									+ "\n날짜 : " + data.date
									+ "\n일수 : " + data.day
									+ "\n인원 : " + data.headcount
									+ "\n상태 : " + data.state);
							}else{
								alert("조회 결과가 없습니다");
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