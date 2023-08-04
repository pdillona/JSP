
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
	
