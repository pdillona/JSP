<<<<<<< HEAD
<%@page import="kr.co.jboard1.dao.UserDAO"%>
=======
>>>>>>> 9ae4c1d7c29782532fc5d1c3e62757427bab93e8
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String hp = request.getParameter("hp");
	
<<<<<<< HEAD
	int result = UserDAO.getInstance().selectCountHp(hp);
	

=======
	int result = 0;
	
	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/Jboard");
		
		Connection conn = ds.getConnection();
		PreparedStatement psmt = conn.prepareStatement("SELECT COUNT(*) FROM `User` WHERE `hp`=?");
		psmt.setString(1, hp); //setString으로 12번 라인의 nick을 22번 라인의 쿼리문 nick과 바인딩 
		
		ResultSet rs = psmt.executeQuery();
		if(rs.next()){
			result = rs.getInt(1);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
>>>>>>> 9ae4c1d7c29782532fc5d1c3e62757427bab93e8
	
	// Json 생성
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	// Json 출력
	String jsonData = json.toString();
	out.print(jsonData);
%>