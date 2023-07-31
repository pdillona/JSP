<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	//XML 생성
	String xmlData 	= "<user>";
		   xmlData += "<uid>a101</uid>";
		   xmlData += "<name>김유신</name>";
		   xmlData += "<hp>010-1213-5464</hp>";
		   xmlData += "<age>23</age>";
		   xmlData += "</user>";

		   
	//XML출력
	out.print(xmlData);
		   
%>
