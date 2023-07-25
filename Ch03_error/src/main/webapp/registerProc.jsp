<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String gender = request.getParameter("gender");
	String addr = request.getParameter("addr");
	String[] hobbies = request.getParameterValues("hobby");
	String birth = request.getParameter("birth");

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>회원가입 데이터 수신</h3>
		<p>
			아이디: <%= uid %><br>
			이름: <%= name %><br>
			비번: <%= pass %><br>
			생일: <%= birth %><br>
			주소: <%= addr %><br>
			성별: <%= gender %><br>
			취미: <% 
					for(String hobby: hobbies){
						out.print(hobby+",");
					}
					%><br>
		</p>
		<a href="../1_request.jsp">뒤로가기</a>	
		
	</body>
</html>