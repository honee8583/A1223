<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <h2>회원 가입</h2>
    <label for="id">아이디 <input type="text" name="id" id="id"></label> <button>ID중복확인</button><br>
    <label for="password">비밀번호<input type="password" name="password" id="password"></label><br>
    <label for="password2">비밀번호<input type="password" name="password2" id="password2"></label><br>
    <label for="name">이름<input type="text" name="name" id="name"></label><br>
    <label>성별</label><input type="radio" name="gender" value="M">남
    <input type="radio" name="gender" value="F">여<br>
    <label for="birth">생년월일<input type="text" name="birth" id="birth"></label> <span>ex)900323</span><br>
    <label for="email">이메일<input type="email" name="email" id="email"></label><br>
    <label for="zipcode">우편번호<input type="text" name="zipcode" id="zipcode"></label> <button>우편번호 찾기</button><br>
    <label for="address">주소<input type="text" name="address" id="address"></label><br>




</body>
</html>