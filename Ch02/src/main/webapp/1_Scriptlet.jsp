<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_Scriptlet</title>
		<!--  -->
		<%--
			날짜: 2023/ 07/24
			이름: 정영재
			내용: JSP 기본 문법 실습하기
			
			스크립트릿(Scriptlet)
			- 정적 문서(HTML)에 프로그래밍 코드를 기술하기 위한 코드영역
			- 동적문서(JSP) 스크립트릿을 실행해서 정적문서(HTML)로 변호나
			
			표현식(Expresstion)
			- 변수 값을 출력하는 스크립트
			- 간단한 값, 식 결과를 출력
			
		 --%>
	</head>
	<body>
		<h3>1.스크립트릿</h3>
		
		<h4>스크립트릿(Scriptlet)</h4>
		<% 
			//스크립트릿: 자바 프로그래밍 영역
			
			int var1 = 1;
			boolean var2 = true;
			double var3 = 1.1;
			String var4 = "우리집";
			
			out.println("<p>var1: " + var1 + "</p>");
			out.println("<p>var2: " + var2 + "</p>");
			out.println("<p>var3: " + var3 + "</p>");
			out.println("<p>var4: " + var4 + "</p>");
		
		
		%>
		
		
		<h4>표현식(Expression)</h4>
		<p>var3: <%= var3 %></p>
		<p>var4: <%= var4 %></p>
		
		
		
		
	</body>
</html>