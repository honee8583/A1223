<%@ page import="org.example.team2.dao.MemberDAO" %>
<%@ page import="org.example.team2.bean.MemberBean" %><%--suppress ALL --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>회원 수정</title>
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
            height: 40vh;

            border: 2px solid skyblue;
            border-radius: 20px;
            width: 600px;
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
            float: left;
            width: 120px;
        }
        #btn {
            width: 100%;
            text-align: right;
        }
        .form-select {
            float: left;
            width: 200px;
        }
    </style>
</head>
<body>
<%
    String id = request.getParameter("id");
    MemberDAO memberDAO = new MemberDAO();
    MemberBean memberBean = memberDAO.selectMember(id);
%>
<form action="updateProc.jsp">
    <h2>회원수정</h2>
    <div id="main">
        <div id="id">
            <label id="labeltxt">Email <label id="redstar">*</label></label>
            <input type="email" style="width: 250px;" value="<%=memberBean.getEmail()%>">
        </div>

        <div id="id">
            <label id="labeltxt">우편번호 </label>
            <input type="text" style="width: 250px;" id="zipcode" value="<%=memberBean.getZipcode()%>">
            <input type="button" onclick="findadr()" class="btn btn-primary btn-sm" value="우편번호 찾기">
        </div>

        <div id="id">
            <label id="labeltxt">주소 </label>
            <input type="text" style="width: 250px;" id="addr" value="<%=memberBean.getAddress()%>">
        </div>

        <div id="id">
            <label id="labeltxt">취미 </label>
            <input type="checkbox" name="hobby" value="shopping"> 쇼핑
            <input type="checkbox" name="hobby" value="trip"> 여행
            <input type="checkbox" name="hobby" value="game"> 게임
            <input type="checkbox" name="hobby" value="movie"> 영화
            <input type="checkbox" name="hobby" value="exercise"> 운동
        </div>

        <div id="id">
            <label id="labeltxt">직업 </label>
            <select name="job" class="form-select" value="<%=memberBean.getJob()%>">
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
            <input type="submit" class="btn btn-success" value="회원수정">
            <input type="reset" class="btn btn-danger" value="다시 작성">
        </div>
    </div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
                document.getElementById("addr").value = roadAddr + data.jibunAddress;
            }
        }).open();
    }
</script>
</body>
</html>