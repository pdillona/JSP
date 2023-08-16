<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="kr.co.jboard1.dto.TermsDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%


	TermsDTO tv = UserDAO.getInstance().selectTerms();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>약관</title>
    <link rel="stylesheet" href="../css/style.css">
    <script>
    	window.onload = function(){
    		
    		const chk1 = document.getElementsByName('chk1')[0];
    		const chk2 = document.getElementsByName('chk2')[0];
    		
    		const btnNext = document.querySelector('.btnNext');
    		btnNext.addEventListener('click', function(e){
    			e.preventDefault();
    			
    			if(!chk1.checked){
    				alert('이용약관에 동의하셔야 합니다.');
    				return;
    			}else if(!chk2.checked){
    				alert('개인정보 취급방침에 동의하셔야 합니다.');
    				return;
    			}else{
    				location.href = '/Jboard1/user/register.jsp';
    			}    			    			
    		});
    	}
    </script>
    
    
</head>
<body>
    <div id="container">
        <header>
            <h3>Board System v1.0</h3>
        </header>
        <main>
            <section class="terms">
                <table>
                    <caption>사이트 이용약관</caption>
                    <tr>
                        <td>
                            <textarea readonly><%= tv.getTerms() %></textarea>
                            <p>
                                <label><input type="checkbox" name="chk1"/>동의합니다.</label>
                            </p>
                        </td>
                    </tr>
                </table>
                <table>
                    <caption>개인정보 취급방침</caption>
                    <tr>
                        <td>
                            <textarea readonly><%= tv.getPrivacy() %></textarea>
                            <p>
                                <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                            </p>
                        </td>
                    </tr>
                </table>
                <div>
                    <a href="/Jboard1/user/login.jsp" class="btnCancel">취소</a>
                    <a href="#" class="btnNext">다음</a>
                </div>
            </section>
        </main>
        <footer>
            <p>ⓒcopyright J.com</p>
        </footer>
    </div>
</body>
</html>