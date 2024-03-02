<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
			<section class="p-4">
				<div class="weatherlist">
					<h2>과거 날씨</h2>
					<table class="table text-center">
						<thead>
							<tr>
								<th>날짜</th>
								<th>날씨</th>
								<th>기온</th>
								<th>강수량</th>
								<th>미세먼지</th>
								<th>풍속</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="weather" items="${weatherList }">							
								<tr>
									<fmt:parseDate var="date" value="${weather.date }" pattern="yyyy-MM-dd" />
									<td><fmt:formatDate value="${date }" pattern="yyyy년 M월 d일" /></td>
									<c:choose>
										<c:when test="${weather.weather eq '맑음' }">
											<c:set var="img" value="http://marondal.com/material/images/dulumary/web/jstl/sunny.jpg" />
										</c:when>
										<c:when test="${weather.weather eq '구름조금' }">
											<c:set var="img" value="http://marondal.com/material/images/dulumary/web/jstl/partlyCloudy.jpg" />
										</c:when>
										<c:when test="${weather.weather eq '흐림' }">
											<c:set var="img" value="http://marondal.com/material/images/dulumary/web/jstl/cloudy.jpg" />
										</c:when>
										<c:otherwise>
											<c:set var="img" value="http://marondal.com/material/images/dulumary/web/jstl/rainy.jpg" />
										</c:otherwise>
									</c:choose>
									<td><img height="90%" src="${img }"></td>
									<td>${weather.temperatures }ºC</td>
									<td>${weather.precipitation }mm</td>
									<td>${weather.microDust }</td>
									<td>${weather.windSpeed }km/h</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>