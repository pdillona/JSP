<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ǥ�� ��� ���� ��ü</title>
<!-- 
	��¥: 2023/08/22
	�̸�: ������
	����: JSP ǥ����� ���尴ü �ǽ��ϱ�

 -->
</head>
<body>
	<h3>ǥ�� ��� ���� ��ü</h3>
	
		<%
			pageContext.setAttribute("name", "������");
			request.setAttribute("name", "������");
			session.setAttribute("name", "�庸��");
			application.setAttribute("name", "������"); 
		%>
		
		<p>
			pageScope name: ${pageScope.name}<br>
			request.Scope name: ${requestScope.name} <br>
			sessionScope name: ${sessionScope.name}<br>
			applicationScope name: ${applicationScope.name}<br>
		
		</p>
		
	
</body>
</html>