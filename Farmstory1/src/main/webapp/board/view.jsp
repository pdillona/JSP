<%@page import="java.util.List"%>
<%@page import="kr.farmstory1.dto.ArticleDTO"%>
<%@page import="kr.farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String no = request.getParameter("no");
	
	//로그인 여부 확인
	if(sessUser == null){
		response.sendRedirect("/Farmstory1/user/login.jsp?success=101&target=view&group="+group+"&cate="+cate +"&no="+no);
		return;
	}
		
	
	pageContext.include("./_aside"+group+".jsp");
	
	
	
	
	
	//db조회
	ArticleDAO dao = new ArticleDAO();
		
	// 원글 조회
	ArticleDTO dto = dao.selectArticle(no);
	
	// 댓글 조회
	List<ArticleDTO> comments = dao.selectComments(no);
	
	
%>

<script>

	$(function(){
		
		let comment = '';
		
		// 댓글 수정
		$('.mod').click(function(e){
			e.preventDefault();
			
			const txt = $(this).text();
			
			if(txt == '수정'){
				comment = $(this).parent().prev().val();
				
				// 수정모드 전환
				$(this).parent().prev().addClass('modi');
				$(this).parent().prev().attr('readonly', false);
				$(this).parent().prev().focus();
				$(this).text('수정완료');
				$(this).prev().show();
			}else{
				// '수정완료' 클릭
				if(confirm('정말 수정 하시겠습니까?')){
					// 수정 데이터 전송
					$(this).closest('form').submit();
				}else{
					$(this).parent().prev().val(comment);
				}
				
				// 수정모드 해제 
				$(this).parent().prev().removeClass('modi');
				$(this).parent().prev().attr('readonly', true);
				$(this).text('수정');
				$(this).prev().hide();
			}
		});
		
		// 댓글 삭제
		$('.del').click(function(){
			const result = confirm('정말 삭제 하시겠습니까?');
			
			if(result){
				return true;
			}else{
				return false;					
			}
		});
		
		// 댓글쓰기 취소
		// Javascript 방식
		const commentContent = document.querySelector('form > textarea[name=content]');
		const btnCancel = document.querySelector('.btnCancel');
		btnCancel.onclick = function(e){
			e.preventDefault();
			commentContent.value = '';
		}
		
		// jQuery 방식
		$('.btnCancel').click(function(e){
			e.preventDefault();
			$('form > textarea[name=content]').val('');
		});
		
		// 원글 삭제
		const btnDelete = document.getElementsByClassName('btnDelete')[0];
		btnDelete.onclick = function(){
			if(confirm('정말 삭제 하시겠습니까?')){
				return true;
			}else{
				return false;					
			}
		}
	});
	
</script>



<section class="view">
        <h3>글보기</h3>
        <table>
            <tr>
                <td>제목</td>
                <td><input type="text" name="title" value="<%= dto.getTitle() %>" readonly/></td>
            </tr>
            <% if(dto.getFile() > 0){ %>
            <tr>
                <td>첨부파일</td>
                <td>
                    <a href="#">2020년 상반기 매출자료.xls</a>
                    <span>7회 다운로드</span>
                </td>
            </tr>
            <% } %>
            <tr>
                <td>내용</td>
                <td>
                    <textarea name="content" readonly><%= dto.getContent() %></textarea>
                </td>
            </tr>
        </table>
        <div>
        	<% if(sessUser.getUid().equals(dto.getWriter())){ %>
            <a href="./proc/articleDeleteProc.jsp?group=<%= group %>&cate=<%= cate %>&no=<%= no %>" class="btnDelete">삭제</a>
            <a href="./modify.jsp?group=<%= group %>&cate=<%= cate %>&no=<%= no %>" class="btnModify">수정</a>
            <% } %>
            <a href="./list.jsp?group=<%= group %>&cate=<%= cate %>" class="btnList">목록</a>
        </div>
        
        <!-- 댓글리스트 -->
        <section class="commentList">
            <h3>댓글목록</h3>
            <% for(ArticleDTO comment : comments){ %>
            <article class="comment">
            	<form action="./proc/commentUpdate.jsp" method="post">
            		<input type="hidden" name="no"     value="<%= comment.getNo() %>">
            		<input type="hidden" name="parent" value="<%= comment.getParent() %>">
	                <span>
	                    <span><%= comment.getNick() %></span>
	                    <span><%= comment.getRdate() %></span>
	                </span>
	                <textarea name="comment" readonly><%= comment.getContent() %></textarea>
	                
	                <% if(sessUser.getUid().equals(comment.getWriter())){ %>
	                <div>
	                    <a href="./proc/commentDelete.jsp?no=<%= comment.getNo() %>&parent=<%= comment.getParent() %>" class="del">삭제</a>
	                    <a href="/Farmstory1/board/view.jsp?no=<%= no %>" class="can">취소</a>
	                    <a href="#" class="mod">수정</a>
	                </div>                
                	<% } %>
                </form>
            </article>
            <% } %>
            
            <% if(comments.isEmpty()){ %>
            <p class="empty">등록된 댓글이 없습니다.</p>
            <% } %>
        </section>

        <!-- 댓글입력폼 -->
        <section class="commentForm">
            <h3>댓글쓰기</h3>
            <form action="./proc/commentInsert.jsp" method="post">
            	<input type="hidden" name="parent" value="<%= no %>"/>
            	<input type="hidden" name="group" value="<%= group %>"/>
            	<input type="hidden" name="cate" value="<%= cate %>"/>
            	<input type="hidden" name="writer" value="<%= sessUser.getUid() %>"/>
                <textarea name="content"></textarea>
                <div>
                    <a href="#" class="btnCancel">취소</a>
                    <input type="submit" class="btnWrite" value="작성완료"/>
                </div>
            </form>
        </section>

    </section>
<!-- 내용 끝 -->

        </article>
    </section>
</div>			
<%@ include file="../_footer.jsp" %>