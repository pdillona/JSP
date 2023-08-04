<%@page import="kr.co.jboard1.vo.UserVO"%>
<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//인코딩 설정
	request.setCharacterEncoding("UTF-8");

	//전송데이터 수신
	String uid = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String pass2 = request.getParameter("pass2");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();
	
	UserVO vo = new UserVO();
	vo.setUid(uid);
	vo.setPass(pass1);
	vo.setName(name);
	vo.setNick(nick);
	vo.setHp(hp);
	vo.setAddr1(addr1);
	vo.setAddr2(addr2);
	vo.setAddr2(regip);
	
	
	//데이터 베이스 처리

	UserDAO.getInstance().insertUser(vo);
	
	response.sendRedirect("/Jboard1/user/login.jsp");
	
%>

