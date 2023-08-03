/**
 * 사용자 개인정보 중복체크
 */

$(function() {

	// 아이디 중복체크
	$('#btnCheckUid').click(function() {

		const uid = $('input[name=uid]').val();
		
		if(!uid.match(reUid)){
			$('.resultId').css('color', 'red').text('유효한 아이디가 아닙니다.');
			isUidOk = false; //스크립트는 따로 빼도 같은 공간을 공유하기 때문에 위에서 선언한 변수를 사용 가능하다.
			return; //종료
		}
		
		const jsonData = {
			"uid": uid
		};

		$.ajax({
			url: '/Jboard1/user/checkUid.jsp',
			type: 'GET',
			data: jsonData,
			dataType: 'json',
			success: function(data) {
				if (data.result >= 1) {
					$('.resultId').css('color', 'red').text('이미 사용중인 아이디 입니다.');
					isUidOk = false;
				} else {
					$('.resultId').css('color', 'green').text('사용 가능한 아이디 입니다.');
					isUidOk = true;
				}
			}
		});
	}); // 아이디 중복 체크 끝

	// 닉네임 중복체크 (jQuery get으로)
	$('input[name=nick]').focusout(function() { //keyup은 텍스트 입력시마다 비교, focusout은 텍스트 커서가 out될 때 마다 비교
		//입력 데이터 가져오기
		const nick = $(this).val();
		//console.log('nick: '+ nick);
		if(!nick.match(reNick)){
			$('.resultNick').css('color','red').text('유효한 닉네임이 아닙니다');
			isNickOk = false;
			return;
		}

		// JSON생성
		const jsonData = {
			"nick": nick
		};

		//어차피 get으로 보낼거라 $.get사용
		$.get('/Jboard1/user/checkNick.jsp', jsonData, function(data) {
			console.log(data);
			if (data.result >= 1) {
				//alert('이미사용중인 아이디 입니다.');
				$('.resultNick').css('color', 'red').text('  이미사용중인 별명 입니다.');
				isNickOk=false;
			} else {
				//alert('사용 가능한 별명 입니다.');
				$('.resultNick').css('color', 'green').text('  사용 가능한 별명 입니다.');
				isNickOk=true;
			}
		});

		/*$.ajax({
			url: './checkNick.jsp?nick='+ nick +'&key='+key, //주소뒤에 파라메타를 붙이는것이 가능하다. 하지만 계속해서 보내야할 데이터가 늘어나면 불편하기 때문에 jsonData를 따로 생성해 준다.
			
			
		});*/


	});// 닉네임 중복 end

	// 이메일 중복체크 (자바스크립트 방식으로)
	document.getElementsByName('email')[0].focusout = function() {

		const resultEamil = document.getElementById('resultEmail');
		
		//입력 데이터 가져오기
		const email = this.value;
		//console.log('email: ' + email);
		if(!email.match(reEmail)){
			resultEmail.innerText = '유효한 이메일이 아닙니다.';
			resultEamil.style.color = 'red';
			isEmailOk = false;
			return;
		}

		//데이터 전송
		const xhr = new XMLHttpRequest();
		xhr.open('GET', '/Jboard1/user/checkEamil.jsp?email=' + email);
		xhr.send();

		//웅답 결과
		xhr.onreadystatechange = function() {
			if (xhr.readyState == XMLHttpRequest.DONE) {

				if (xhr.status == 200) {
					const data = JSON.parse(xhr.response);
					console.log('data: ' + data);


					if (data.result >= 1) {
						//alert('이미 사용중인 이메일 입니다.')
						resultEamil.innerText = '이미 사용중인 이메일 입니다.';
						resultEamil.style.color = 'red';
						isEmailOk = false;
					} else {
						//alert('사용 가능한 이메일 입니다.')

						resultEamil.innerText = '사용 가능한 이메일 입니다.';
						resultEamil.style.color = 'green';
						isEmailOk = true;
					}
				}
			}
		}// onreadystatechange end
	}// email.onfocusout end

	//휴대폰 중복 체크
	document.getElementsByName('hp')[0].addEventListener('focusout', function() {

		const resultHp = document.getElementById('resultHp');
		const hp = this.value;

		if(!hp.match(reHp)){
				resultHp.innerText = '유효한 번호가 아닙니다.';
				resultHp.style.color = 'red';
				isHpOk = false;
				return;
		}


		const url = '/Jboard1/user/checkHp.jsp?hp=' + this.value;

		fetch(url)
			.then(response => response.json())
			.then(data => {
				console.log(data);
				if (data.result >= 1) {
					resultHp.innerText = '이미 사용중인 번호 입니다.';
					resultHp.style.color = 'red';
					isHpOk = false;
				} else {
					resultHp.innerText = '사용 가능한 번호 입니다.';
					resultHp.style.color = 'green';
					isHpOk = true;
				}
			});
	});//휴대폰 중복체크 end
}); //사용자 중복체크 end