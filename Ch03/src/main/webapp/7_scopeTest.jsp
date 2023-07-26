<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>7_scopeTest</title>
		<!-- 
			날짜 : 2023/07/26
			이름 : 정영재
			내용 : JSP scopeTest 내장객체 실습하기


		-->
	</head>
	<body>
		<h3>7.내장 객체 영역</h3>
		<%
		//내장 객체 값 설정
		 pageContext.setAttribute("name", "김유신");
		 request.setAttribute("name", "김춘추");
		 session.setAttribute("name", "장보고");
		 application.setAttribute("name", "강감찬");
		
		%>

		<%
			pageContext.forward("./proc/scopeResult.jsp");
		%>
		
	</body>
</html>