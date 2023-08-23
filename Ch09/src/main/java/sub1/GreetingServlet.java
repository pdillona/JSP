package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Greeting.do") //xml servlet설정을 대신하는 어노테이션
public class GreetingServlet extends HttpServlet{
	
	private static final long serialVersionUID = 3L;
	
	@Override //was에 로드될 때 (= 최초실행시)
	public void init() throws ServletException {
		System.out.println("GreetingServlet init()");
	}
	@Override //클라이언트의 get 요청시 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GreetingServlet doGet()");
		
		//HTML 출력
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("<title>GreetingServlet</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>GreetingServlet</h3>");
		writer.println("<a href='./1_Servlet.jsp'>서브릿 메인</a>");
		writer.println("<a href='./hello.do'>HelloServlet</a>");
		writer.println("<a href='./welcome.do'>WelcomeServlet</a>");
		writer.println("<a href='./Greeting.do'>GreetingServlet</a>");
		writer.println("</body>");
		writer.println("<html>");
		
	}
	@Override //post 요청시
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GreetingServlet doPost()");
	}
	
	@Override//서블릿 종료시
	public void destroy() {
		System.out.println("GreetingServlet destroy()");
	}
}
