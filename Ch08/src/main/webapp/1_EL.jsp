<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1_EL</title>
<!-- 
	날짜: 2023/08/22
	이름: 정영재
	내용: JSP 표현언어 실습하기
	
	표현언어(Expression Language)
	 - MVC 패턴에 따라 JSP를 더욱 효율적으로 처리하기 위한 출력 문법
	 - JSP 내장 객체를 이용해 표현언어로 출력
 -->
</head>
<body>
		<h3>1. 표현언어(Expression Language)</h3>
		<%
			int num1 = 1;
			int num2 = 2;
			
			String str1 = "hello";
			String str2 = "Wellcome";
			
			//표현 언어로 출력을 위해 내장 객체 영역에 저장
			pageContext.setAttribute("num1", num1);
			request.setAttribute("num2", num2);
			session.setAttribute("str1", str1);
			application.setAttribute("str2", str2); 
		%>
		
		
		<h4>표현식</h4>
		<p>
			num1: <%= num1 %><br>
			num2: <%= num2 %><br>
			str1: <%= str1 %><br>
			str2: <%= str2 %><br>
		</p>
		<p>
			num1: ${num1}<br>
			num2: ${num2}<br>
			str1: ${str1}<br>
			str2: ${str2}<br>
		</p>
</body>
</html>