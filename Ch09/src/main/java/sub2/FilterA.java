package sub2;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterA implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 필터 처리될 로직 수행
		System.out.println("FilterB doFilter()");
		
		// 다음 필터 호출, 필터가 없으면 최종 자원을 요청한다. chain이 없으면 필터만 호출되고 프로그램이 끝나버린다.
		chain.doFilter(request, response);
		
	}

	
	
}
