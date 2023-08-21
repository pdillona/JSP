<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 

	//파일 전송 form은 일반 request로 처리 불가능
/* 	String uid   = request.getParameter("uid");
	String name  = request.getParameter("name");
	String file1 = request.getParameter("file1");
 */
	
	String path = application.getRealPath("/upload"); //("../~~")식의 절대경로로는 사용 못함. application을 이용해서 경로 구하는 것이 가능
	int maxSize = 1024 * 1024 * 10;					  //마음대로 클라이언트가 용량을 올리게되면 하드가 빠르게 소모되기에 올릴수있는 최대 용량을 제한
	
	
	//파일 폼 데이터 수신 19~25 line
	MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	// 	MultipartRequest mr = new MultipartRequest(request, "경로", 파일 최대 사이즈, "UTF-8" 인코딩값, new DefaultFileRenamePolicy() 파일명 변경 클래스);
 
	// 파일 전송 form에서의 request 처리를 위한 방법 
	String uid 		= mr.getParameter("uid");
	String name 	= mr.getParameter("name");
	String fname 	= mr.getFilesystemName("fname"); //getOriginalFileName도 가능
	
	/* 	System.out.println("uid: "+uid);
		System.out.println("name: "+name);
		System.out.println("file1: "+file1); */

	
	
	//파일명 수정
	int i = fname.lastIndexOf("."); //.  뒤로 잘라냄
	String ext = fname.substring(i);
	
	String uuid = UUID.randomUUID().toString(); //중복되지않는 랜덤한 이름으로 변경
	String sName = uuid+ext; //변경된 이름에 확장자 더해주기
	
	File f1 = new File(path + "/" + fname);
	File f2 = new File(path + "/" + sName);
	
	f1.renameTo(f2);
	
	
	//원본 파일명 INSERT
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/Jboard");
	
	try{
		Connection conn = ds.getConnection();
		PreparedStatement psmt = conn.prepareStatement( "INSERT INTO `FileTest` SET `oName`=?, `sName`=?, `rdate`=NOW()");
		psmt.setString(1, fname);
		psmt.setString(2, sName);
		psmt.executeUpdate();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//파일 다운로드 이동
	response.sendRedirect("../2_FileDownload.jsp");
	
%>