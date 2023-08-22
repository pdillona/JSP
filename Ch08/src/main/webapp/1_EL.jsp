<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1_EL</title>
<!-- 
	��¥: 2023/08/22
	�̸�: ������
	����: JSP ǥ����� �ǽ��ϱ�
	
	ǥ�����(Expression Language)
	 - MVC ���Ͽ� ���� JSP�� ���� ȿ�������� ó���ϱ� ���� ��� ����
	 - JSP ���� ��ü�� �̿��� ǥ������ ���
 -->
</head>
<body>
		<h3>1. ǥ�����(Expression Language)</h3>
		<%
			int num1 = 1;
			int num2 = 2;
			
			String str1 = "hello";
			String str2 = "Wellcome";
			
			//ǥ�� ���� ����� ���� ���� ��ü ������ ����
			pageContext.setAttribute("num1", num1);
			request.setAttribute("num2", num2);
			session.setAttribute("str1", str1);
			application.setAttribute("str2", str2); 
		%>
		
		
		<h4>ǥ����</h4>
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