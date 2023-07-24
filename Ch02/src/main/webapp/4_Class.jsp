<%@page import="sub1.Account"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>4_Class</title>
		<%--
			날짜: 2023/ 07/24
			이름: 정영재
			내용: JSP 스크립트릿 클래스 실습하기
		--%>
	</head>
	<body>
		<h3>4.클래스</h3>
		
		<%
			Account kb = new Account("국민은행","1010-13123-1412","김유신",100000);
			kb.deposit(3000000);
			kb.withdraw(40000);
			kb.show(out);
	
			Account wr = new Account("우리은행","1064-1463-1124","김춘추",500000);
			wr.deposit(3000000);
			wr.withdraw(40000);
			wr.show(out);
		
		%>
		
		
	</body>
</html>