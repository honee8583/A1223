<%--suppress ALL --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        #main {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 50vh;

            border: 2px solid lightgrey;
            border-radius: 20px;
            width: 500px;
            padding: 50px 30px;
        }
        #redstar {
            color: red;
        }
        #id {
            margin: 7px;
            width: 100%;
        }
        #labeltxt {
            display: inline-block;
            width: 120px;
        }
        #btn {
            width: 100%;
            text-align: right;
        }
    </style>
</head>
<body>
<form action="joinProc.jsp" method="post">
    <h2>회원가입</h2>
    <div id="main">
        <div id="id">
            <label id="labeltxt">아이디 <label id="redstar">*</label></label>
            <input type="text" name="id" id="inputtxt" style="width: 250px;">
            <input type="button" onclick="dbcheck()" value="ID 중복확인">
        </div>

        <div id="id">
            <label id="labeltxt">비밀번호 <label id="redstar">*</label></label>
            <input type="password" name="password" style="width: 250px;">
        </div>

        <div id="id">
            <label id="labeltxt">비밀번호 확인 <label id="redstar">*</label></label>
            <input type="password" name="password_confirm" style="width: 250px;">
        </div>

        <div id="id">
            <label id="labeltxt">이름 <label id="redstar">*</label></label>
            <input type="text" name="name" style="width: 250px;">
        </div>

        <div id="id">
            <label id="labeltxt">성별 <label id="redstar">*</label></label>
            <input type="radio" name="gender" value="M">남자
            <input type="radio" name="gender" value="F">여자
        </div>

        <div id="id">
            <label id="labeltxt">Email <label id="redstar">*</label></label>
            <input type="email" name="email" style="width: 250px;">
        </div>

        <div id="id">
            <label id="labeltxt">생년월일 <label id="redstar">*</label></label>
            <input type="text" name="birth" style="width: 160px;"> Ex) 951030
        </div>

        <div id="id">
            <label id="labeltxt">우편번호 </label>
            <input type="text" style="width: 250px;">
            <input type="button" name="zipcode" onclick="findadr()" value="우편번호 찾기">
        </div>

        <div id="id">
            <label id="labeltxt">주소 </label>
            <input type="text" name="address" style="width: 250px;">
        </div>

        <div id="id">
            <label id="labeltxt">취미 </label>
            <input type="checkbox" name="hobby" value = "shopping">쇼핑
            <input type="checkbox" name="hobby" value = "traval">여행
            <input type="checkbox" name="hobby" value = "game">게임
            <input type="checkbox" name="hobby" value = "movie">영화
            <input type="checkbox" name="hobby" value = "exersice">운동
        </div>

        <div id="id">
            <label id="labeltxt">직업 </label>
            <select name="job">
                <option>선택하세요</option>
                <option value="software_developer">소프트웨어 개발자</option>
                <option value="data_analyst">데이터 분석가</option>
                <option value="network_admin">네트워크 관리자</option>
                <option value="cyber_security_specialist">사이버 보안 전문가</option>
                <option value="UXUI_designer">UX/UI디자이너</option>
                <option value="doctor">의사</option>
                <option value="nurse">간호사</option>
                <option value="pharmacist">약사</option>
                <option value="physical_therapist">물리치료사</option>
                <option value="psychological_counselor">심리상담사</option>
                <option value="teacher">교사</option>
                <option value="professor">대학교수</option>
                <option value="researcher">연구원</option>
                <option value="education_consultant">교육 컨설턴트</option>
                <option value="graphic_designer">그래픽 디자이너</option>
                <option value="writer">작가</option>
                <option value="photographer">사진작가</option>
                <option value="film_director">영화감독</option>
                <option value="musician">음악가</option>
                <option value="management_consultant">경영 컨설턴트</option>
                <option value="project_manager">프로젝트 매니저</option>
                <option value="marketing_specialist">마케팅 전문가</option>
                <option value="hr_manager">인사 관리자(HR)</option>
                <option value="tax_accountant">세무사</option>
                <option value="chef">요리사</option>
                <option value="flight_attendant">항공 승무원</option>
                <option value="tour_guide">여행 가이드</option>
                <option value="hairdresser">미용사</option>
                <option value="fitness_trainer">운동 트레이너</option>
            </select>
        </div>
        <div id="btn">
            <input type="submit" value="회원가입">
            <input type="reset" value="다시 작성">
        </div>
    </div>
</form>
</body>
</html>