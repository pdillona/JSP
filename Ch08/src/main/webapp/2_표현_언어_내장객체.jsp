<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>표현 언어 내장 객체</title>
<!-- 
	날짜: 2023/08/22
	이름: 정영재
	내용: JSP 표현언어 내장객체 실습하기

 -->
</head>
<body>
	<h3>표현 언어 내장 객체</h3>
	
		<%
			pageContext.setAttribute("name", "김유신");
			request.setAttribute("name", "김춘추");
			session.setAttribute("name", "장보고");
			application.setAttribute("name", "강감찬"); 
		%>
		
		<p>
			pageScope name: ${pageScope.name}<br>
			request.Scope name: ${requestScope.name} <br>
			sessionScope name: ${sessionScope.name}<br>
			applicationScope name: ${applicationScope.name}<br>
		
		</p>
		
	
</body>
</html>