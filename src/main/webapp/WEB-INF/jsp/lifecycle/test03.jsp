<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 연동하기</title>
</head>
<body>
<%
	List<String> list = new ArrayList<>();
	list.add("제육덮밥");
	list.add("돈까스");
	list.add("살치살");
%>
	<h1>리스트 기억 나시죠?</h1>
	<h2>나의 최애 메뉴!</h2>
	<ul>
	<%for(String food : list){ %>
		<li><%= food %></li>
	<%} %>
	</ul>
</body>
</html>