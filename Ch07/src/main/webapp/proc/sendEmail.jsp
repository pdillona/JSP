<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.*"%>
<%@page import="java.util.Properties"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//메일 기본정보
	request.setCharacterEncoding("UTF-8");
	String sender   = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	String title    = request.getParameter("title");
	String content  = request.getParameter("content");
	String appPass  = "vuiovxoanciugcmu"; // Gmail SMTP 앱 비밀번호
		
	// Gmail SMTP 서버 설정
	Properties props = new Properties();
	props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.port", "465");
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.ssl.enable", "true");
	props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	
	// Gmail STMP 세션 생성
	Session sess = Session.getInstance(props, new Authenticator(){
		
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(sender, appPass);
		}
	});
	
	// 메일 발송
	Message message = new MimeMessage(sess);
	
	try{
		message.setFrom(new InternetAddress(sender, "보내는 사람", "UTF-8"));
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
		message.setSubject(title);
		message.setContent(content, "text/html;charset=UTF-8");
		Transport.send(message);
	}catch(Exception e){
		System.out.println("mail : " + e.getMessage());
		// e.printStackTrace();
	}
	
	// 다시 폼 이동
	response.sendRedirect("/Ch07/3_MailTest.jsp");
%>