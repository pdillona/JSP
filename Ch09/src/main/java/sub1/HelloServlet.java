package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

public class HelloServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override //was에 로드될 때 (= 최초실행시)
	public void init() throws ServletException {
		System.out.println("HelloServlet init()");
	}
	@Override //클라이언트의 get 요청시 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("HelloServlet doGet()");
		
		//HTML 출력
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("<title>HellowServlet</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>Hello Servlet</h3>");
		writer.println("<a href='./1_Servlet.jsp'>서브릿 메인</a>");
		writer.println("<a href='./hello.do'>HelloServlet</a>");
		writer.println("</body>");
		writer.println("<html>");
		
	}
	@Override //post 요청시
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("HelloServlet doPost()");
		
		String uid = req.getParameter("uid");
		String pass = req.getParameter("pass");
		
		// 현재 세션 가져오기 jsp가 아니기 때문에 내장객체인 session을 바로 들고 올 수 없다.
		HttpSession session = req.getSession();
		
		// 사용자가 a101, a102라고 가정시 로그인 처리
		if(uid.equals("a101") && pass.equals("1234")) {
			session.setAttribute("sessUid", uid);
			//session.setAttribute("sessPass", pass);
			resp.sendRedirect("/Ch09/3_Listener.jsp?success=200");
			
			System.out.println("66666");
		}else {
			//로그인 실패 가정
			resp.sendRedirect("/Ch09/3_Listener.jsp?success=100");
			System.out.println("111");
		}
		
		
	}
	
	@Override//서블릿 종료시
	public void destroy() {
		System.out.println("HelloServlet destroy()");
	}
}
