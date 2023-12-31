package kr.co.jboard2.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.jboard2.service.UserService;


@WebServlet("/checkNick.do")
public class CheckNickController extends HttpServlet{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService service = UserService.getInstance();
	
	private static final long serialVersionUID = -3509171183151838308L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String nick = req.getParameter("nick");
	    int result = service.selectCountNick(nick);
		
		logger.info("result: "+ result);
		
		//JSON생성
		
		JsonObject json  = new JsonObject();
		json.addProperty("result", result);

		//JSON출력
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
		
	}

}
