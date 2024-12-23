<%--suppress ALL --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function findadr() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('zipcode').value = data.zonecode;
                    document.getElementById("road").value = roadAddr;
                }
            }).open();
        }
    </script>
    <script>
        function checkPasswordMatch() {
            let password = document.querySelector('input[name="password"]').value;
            let passwordConfirm = document.querySelector('input[name="passwordConfirm"]').value;
            let messageElement = document.getElementById("passwordMatchMessage");
            let submitBtn = document.getElementById("submitBtn");

            if (password === passwordConfirm) {
                messageElement.style.display = "none"; // 숨기기
                submitBtn.disabled = false;     // 활성화
            } else {
                messageElement.style.display = "inline"; // 보이기
                submitBtn.disabled = true;
            }
        }
    </script>
    <script>
        function idCheck() {
            let id = document.getElementById('inputtxt').value;
            let btn = document.getElementById('submitBtn');
            let messageSpan = document.getElementById('idCheckMessage');

            if (!id) {
                alert('아이디를 입력해주세요.');
                return;
            }

            // 아이디 중복 확인을 위한 서버 URL
            let url = 'checkId.jsp?id=' + encodeURIComponent(id);

            // fetch를 이용한 비동기 요청
            fetch(url)
                .then(response => response.json())  // 응답을 JSON으로 변환
                .then(data => {
                    if (data.isDuplicate) {
                        messageSpan.style.color = 'red';
                        messageSpan.innerText = '이미 사용 중인 아이디입니다.';
                        btn.disabled = true;
                    } else {
                        messageSpan.style.color = 'green';
                        messageSpan.innerText = '사용 가능한 아이디입니다.';
                        btn.disabled = false;
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('오류가 발생했습니다. 다시 시도해주세요.');
                });
        }
    </script>
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

            border: 2px solid skyblue;
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
            <input type="button" onclick="idCheck()" value="ID 중복확인"><br>
            <label id="labeltxt"></label>
            <span id="idCheckMessage" style="font-size: 12px; color: red;"></span>
        </div>

        <div id="id">
            <label id="labeltxt">비밀번호 <label id="redstar">*</label></label>
            <input type="password" name="password" style="width: 250px;" onkeyup="checkPasswordMatch()">
        </div>

        <div id="id">
            <label id="labeltxt">비밀번호 확인 <label id="redstar">*</label></label>
            <input type="password" name="passwordConfirm" style="width: 250px;" onkeyup="checkPasswordMatch()"><br>
            <label id="labeltxt"></label>
            <span id="passwordMatchMessage" style="color: red; font-size: 12px; display: none;">비밀번호가 일치하지 않습니다.</span>
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
            <input type="text" name="zipcode" id="zipcode" style="width: 250px;">
            <input type="button" onclick="findadr()" value="우편번호 찾기">
        </div>

        <div id="id">
            <label id="labeltxt">주소 </label>
            <input type="text" name="address" id="road" style="width: 200px;">
            <input type="text" name="address" id="jibun" style="width: 50px;">
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
            <input type="submit" id="submitBtn" value="회원가입">
            <input type="button" onclick="location.href='index.jsp'" value="취소">
        </div>
    </div>
</form>
</body>
</html>