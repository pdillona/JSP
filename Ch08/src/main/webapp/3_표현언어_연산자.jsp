<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>3_표현 언어 연산자</title>
<!-- 
	날짜: 2023/08/22
	이름: 정영재
	내용: JSP 표현언어 연산자 실습하기

 -->
</head>
<body>
	<h3>표현 언어 연산자</h3>
	<%
		int num1 = 1;
		int num2 = 2;
		
		String str1 = null;
		String str2 = "";
		String str3 = "hello";
		
		request.setAttribute("num1", num1);
		request.setAttribute("num2", num2);
		request.setAttribute("str1", str1);
		request.setAttribute("str2", str2);
		request.setAttribute("str3", str3);
	%>
	<p>
		num1 + num2 = ${num1 + num2 }<br>
		num1 - num2 = ${num1 - num2 }<br>
		num1 * num2 = ${num1 * num2 }<br>
		num1 / num2 = ${num1 / num2 }<br>
		num1 % num2 = ${num1 % num2 }<br>
		num1 + num2 = ${num1 + num2 }<br>
	
	
		num1 > num2 = ${num1 > num2 }<br>
		num1 < num2 = ${num1 < num2 }<br>
		num1 >= num2 = ${num1 >= num2 }<br>
		num1 <= num2 = ${num1 <= num2 }<br>
		num1 == num2 = ${num1 == num2 }<br>
		num1 != num2 = ${num1 != num2 }<br>
		
		
		num1 gt num2 = ${num1 gt num2 }<br> <!-- gt  == > -->
		num1 lt num2 = ${num1 lt num2 }<br>	<!-- lt  == < -->
		num1 ge num2 = ${num1 ge num2 }<br>	<!-- ge  == >= -->
		num1 le num2 = ${num1 le num2 }<br>	<!-- le  == <= -->
		num1 eq num2 = ${num1 eq num2 }<br>	<!-- eq  == == -->
		num1 ne num2 = ${num1 ne num2 }<br>	<!-- ne  == != -->
	
		empty str1 = ${empty str1}<br>
		empty str2 = ${empty str2}<br>
		empty str3 = ${empty str3}<br>
		str3 eq "hello" = ${str3 eq "hello" }<br>
		str3 eq "welcome" = ${str3 eq "welcome" }<br>
		
			
	
	</p>
	
</body>
</html>