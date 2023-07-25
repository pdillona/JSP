<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page info="ⓒ copyright chhak.click" %>

<!DOCTYPE html>
<html>
	<head>
		 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>5_Directive</title>
	<!-- 
	지시자(Directive)
	  - JSP 페이지에 추가적인 정보를 설정하는 스크립트 문법
	  - 스크립트릿, 표현식과 함께 jsp 기본 구성요소
	  - page,include, taglib 지시자등
	 -->
		
	</head>
	<body>
		<h3>5. 지시자</h3>
		
		<h4>page지시자</h4>
		
		<p>
			page copyright: <%= getServletInfo() %>  
		</p>
		
		
		<h4>include 지시자</h4>
		
		<%@ include file="./inc/_header.jsp" %>
		<%@ include file="./inc/_footer.jsp" %>
		
	</body>
</html>