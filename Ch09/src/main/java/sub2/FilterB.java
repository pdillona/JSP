package sub2;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterB implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 필터 처리될 로직 수행
		System.out.println("FilterA doFilter()");
		
		// 인코딩 처리
		request.setCharacterEncoding("UTF-8"); //필터를 걸어놓으면 스크립트릿에서 request받을 때 인코딩을 할 필요가 없다. 이런 식으로도 쓰인다.
		
		
		// 다음 필터 호출, 필터가 없으면 최종 자원을 요청한다. chain이 없으면 필터만 호출되고 프로그램이 끝나버린다.
		chain.doFilter(request, response);
		
	}

	
	
}
