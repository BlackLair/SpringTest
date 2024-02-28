<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myTest01</title>
</head>
<body>
	<h2>str 출력 결과 : ${str }</h2>
	<c:set var="str" value="jsp String" />
	<h2>str 출력 결과 : ${str }</h2>

</body>
</html>