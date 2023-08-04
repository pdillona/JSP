<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jboard::register</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/Jboard1/js/zipcode.js"></script>

<<<<<<< HEAD
	<script src="/Jboard1/js/validation.js"></script>
=======
	<script>
		// 폼 데이터 검증 결과 상태 변수
		let isUidOk 	= false; 
		let isPassOk	= false; 
		let isNameOk 	= false; 
		let isNickOk 	= false; 
		let isEmailOk 	= false; 
		let isHpOk 		= false; 
	
		// 데이터 검증에 사용하는 정규표현식
		let reUid   = /^[a-z]+[a-z0-9]{4,19}$/g;
		let rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
		let reName  = /^[가-힣]{2,10}$/ 
		let reNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]{1,10}$/;
		let reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		let reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;
		
		
		
		//유효성 검사(Validation check)
		$(function() {
			//아이디 검사 js파일
			
			//중복검사 이후 아이디를 고쳐 가입하는걸 방지
			$('input[name=uid]').keydown(function() {
				$('.resultId').text('');
				isUidOk=false;
			})
			
			
			//비밀번호 검사
			$('input[name=pass2]').focusout(function() {
				
				const pass1 = $('input[name=pass1]').val();
				const pass2 = $('input[name=pass2]').val();
				
				if(pass1 == pass2){
					if(pass1.match(rePass)){
						$('.resultPass').css('color','green').text('사용 가능한 비밀 번호 입니다.');
						isPassOk = true;	
					}else{
						$('.resultPass').css('color','red').text('5자리이상의 숫자 영문 특수문자 조합이어야 합니다.');
						isPassOk = false;
					}
					
				}else{
					$('.resultPass').css('color','red').text('비밀번호가 일치하지 않습니다.');
					isPassOk = false;
				}
				
				
			});
			
			//이름 검사
			$('input[name=name]').focusout(function() {
				const name = $(this).val();
				
				if(!name.match(reName)){
					$('.resultName').css('color', 'red').text('유효한 이름이 아닙니다.');
					isNameOk = false; //스크립트는 따로 빼도 같은 공간을 공유하기 때문에 위에서 선언한 변수를 사용 가능하다.
					
				}else{
					$('.resultName').text('');
					isNameOk = true;
				}
				
			})
			
			
			
			
			//별명 검사 js파일
			
			
			//이메일 검사
			
	
			//휴대폰 검사
			

			
			//최종 전송
			$('#formUser').submit(function(e) {
				//e.preventDefault(); 외에도 리턴을 false로 주는것도 같은 효과를 줄 수 있다.

				if(!isUidOk){
					alert('아이디를 확인 하십시오');
					return false; //폼 전송 취소(false)   폼 전송 시작(true)
				}
				if(!isPassOk){
					alert('비밀번호를 확인 하십시오');
					return false;
				}
				if(!isNameOk){
					alert('이름을 확인 하십시오');
					return false;
				}
				if(!isNickOk){
					alert('닉네임을 확인 하십시오');
					return false;
				}
				if(!isEmailOk){
					alert('이메일을 확인 하십시오');
					return false;
				}
				if(!isHpOk){
					alert('휴대폰 번호를 확인 하십시오');
					return false;
				}
				
				
				
				return true;
				
			});
			
			
		});//유효성 검사 end
	
	
	</script>
>>>>>>> 9ae4c1d7c29782532fc5d1c3e62757427bab93e8
    <script src="/Jboard1/js/checkUser.js">
    //사용자 개인정보 중복체크 
    </script>
    
</head>
<body>
    <div id="container">
        <header>
            <h3>Board System v1.0</h3>
        </header>
        <main>
            <section class="register">
                <form id="formUser" action="/Jboard1/user/registerProc.jsp" method = "post">
                    <table border="1">
                        <caption>사이트 이용정보 입력</caption>
                        <tr>
                            <td>아이디</td>
                            <td>
                                <input type="text" name="uid" placeholder="아이디 입력"/>
                                <button type="button" id="btnCheckUid"><img src="../images/chk_id.gif" alt=""></button>
                                <span class="resultId"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <input type="password" name="pass1" placeholder="비밀번호 입력"/>                            
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호 확인</td>
                            <td>
                                <input type="password" name="pass2" placeholder="비밀번호 확인 입력"/>
                                <span class="resultPass"></span>
                            </td>
                        </tr>
                    </table>
                    <table border="1">
                        <caption>개인정보 입력</caption>
                        <tr>
                            <td>이름</td>
                            <td>
                                <input type="text" name="name" placeholder="이름 입력"/>
                                <span class="resultName"></span>                            
                            </td>
                        </tr>
                        <tr>
                            <td>별명</td>
                            <td>
                                <p>공백없이 한글, 영문, 숫자만 입력가능</p>
                                <input type="text" name="nick" placeholder="별명 입력"/>
                                <span class="resultNick"></span>                            
                            </td>
                        </tr>
                        <tr>
                            <td>E-Mail</td>
                            <td>
                                <input type="email" name="email" placeholder="이메일 입력"/>
                                <span id="resultEmail"></span>   
                            </td>
                        </tr>
                        <tr>
                            <td>휴대폰</td>
                            <td>
                                <input type="text" name="hp" placeholder="- 포함 13자리 입력" minlength="13" maxlength="13" />
                                <span id="resultHp"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <div>
                                    <input type="text" name="zip" placeholder="우편번호" readonly/>                                
                                    <button type="button" class="btnZip" onclick="zipcode()"><img src="../images/chk_post.gif" alt=""></button>
                                </div>                            
                                <div>
                                    <input type="text" name="addr1" placeholder="주소를 검색하세요." readonly/>
                                </div>
                                <div>
                                    <input type="text" name="addr2" placeholder="상세주소를 입력하세요."/>
                                </div>
                            </td>
                        </tr>
                    </table>
    
                    <div>
                        <a href="/Jboard1/user/login.jsp" class="btnCancel">취소</a>
                        <input type="submit"   class="btnSubmit" value="회원가입"/>
                    </div>    
                </form>
            </section>
        </main>
        <footer>
            <p>ⓒcopyright j.com</p>
        </footer>
    </div>
</body>
</html>