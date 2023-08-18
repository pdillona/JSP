<%@page import="kr.farmstory1.dto.ArticleDTO"%>
<%@page import="kr.farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String file = request.getParameter("file");
	String no = request.getParameter("no");
	String cate = request.getParameter("cate");
	String group = request.getParameter("group");
	

	
	
	ArticleDTO dto = new ArticleDTO();
	dto.setContent(content);
	dto.setTitle(title);
	dto.setNo(no);
	
	ArticleDAO dao = new ArticleDAO();

	dao.updateArticle(dto);

	response.sendRedirect("../view.jsp?group="+ group +"&cate=" + cate + "&no=" + no);
%>