<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2_includeTag</title>
				<!-- 
			날짜 : 2023/07/26
			이름 : 정영재
			내용 : JSP include 액션태그 실습하기
			
			include 지시자
			 - 일반적으로 UI모듈, 공통 전역 파일을 삽일 할 때 사용하는 지시자
			 - 정적타임에 삽입
			 
			include 태그
			 - UI모듈 위주로 삽입하는 include태그
			 - 동적 타임에 삽입 
		--> 
	</head>
	<body>
		<h3>2.include 액션 태그</h3>
		
		
		<h4>include 지시자</h4>
		<%@ include file="./inc/_header.jsp" %>
		<%@ include file="./inc/_footer.jsp" %>
		<%@ include file="./inc/_config1.jsp" %> <%-- 실행전에 삽입 -->
		<%-- 
		<p>
			num1: <%= num1 %><br>
			num2: <%= num2 %><br>
			num3: <%= num3 %><br> 
		</p>
		--%>


		<h4>include 태그</h4>

		<jsp:include page="./inc/_header.jsp"></jsp:include>
		<jsp:include page="./inc/_footer.jsp"></jsp:include>
		<jsp:include page="./inc/_config2.jsp"></jsp:include> <%-- 요청시에== 실행할때 삽입 --%>
		<%-- 
		<p>
			va1: <%= va1 %><br>
			va2: <%= va2 %><br>
			va2: <%= va3 %><br>
		</p>
		--%>
		<h4>include 메서드</h4>
		<%
			pageContext.include("./inc/_header.jsp");
			pageContext.include("./inc/_footer.jsp");
		%>

		
	</body>
</html>