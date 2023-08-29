<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Jboard2</title>
    <link rel="stylesheet" href="/Jboard2/css/style.css"/>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>

//const headNick = document.getElementById('b');

if(sessUser == null){
	
	document.getElementById("b").style.visibility ='hidden'
	
}

</script>
<body>
    <div id="wrapper">
        <header>
            <h3>Board System v2.0</h3>
            <p id="const btnCheckUid = document.getElementById('btnCheckUid');">
                <span><a href="/Jboard2/myInfo.do"> ${sessUser.nick} </a></span>님 반갑습니다.
                <a href="/Jboard2/logout.do">[로그아웃]</a>
            </p>
        </header>