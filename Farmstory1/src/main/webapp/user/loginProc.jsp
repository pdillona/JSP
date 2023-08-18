<%@page import="kr.farmstory1.dto.UserDTO"%>
<%@page import="kr.farmstory1.dao.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 전송 데이터 수신
	request.setCharacterEncoding("UTF-8");
	String uid  = request.getParameter("uid");
	String pass = request.getParameter("pass");
	String target = request.getParameter("target");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String no = request.getParameter("no");
	
	// 사용자 DB 조회
	UserDTO user = UserDAO.getInstance().selectUser(uid, pass);
	
	if(user != null){
		session.setAttribute("sessUser", user);
			
			if(target.equals("write")){
				response.sendRedirect("/Farmstory1/board/write.jsp?group="+group+"&cate="+cate);	
			}else if(target.equals("view")){
				response.sendRedirect("/Farmstory1/board/view.jsp?group="+group+"&cate="+cate+"&no="+no);	
			}else{
				response.sendRedirect("/Farmstory1");
			}
		
	}else{
		response.sendRedirect("/Farmstory1/user/login.jsp?success=100");		
	}
%>