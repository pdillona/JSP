<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// Java JSON 데이터 생성
	String jsonData = "{\"uid\":\"a101\", \"name\":\"홍길동\", \"hp\":\"010-1234-1001\", \"age\":23}"; //이스케이프 처리 \"  나중에는 라이브러리를 통해 처리
	
	
	// JSON 출력
	out.print(jsonData);
		
	
%>