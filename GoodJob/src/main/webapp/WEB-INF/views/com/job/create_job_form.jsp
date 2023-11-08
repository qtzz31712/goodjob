<%@ page import="team.pj.goodjob.com.member.ComMemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>채용공고폼</title>
</head>
<script type="text/javascript">
	function createJobForm() {
		console.log('createJobForm() CALLED!!');

		let form = document.create_job_form;

		if (form.rec_title.value == '') {
			alert('채용공고 제목을입력하세요.');
			form.rec_title.focus();

		} else if (form.rec_due.value == '') {
			alert('채용공고 마감기한을입력하세요.');
			form.rec_due.focus();

		} else if (form.rec_num.value == '') {
			alert('채용인원을 입력하세요.');
			form.rec_num.focus();

		} else if (form.rec_edu.value == '') {
			alert('채용공고 학력을입력하세요.');
			form.rec_edu.focus();

		} else if (form.rec_age.value == '') {
			alert('채용공고 연령을입력하세요.');
			form.rec_age.focus();

		} else if (form.rec_gender.value == '') {
			alert('채용공고 성별을입력하세요.');
			form.rec_gender.focus();

		} else if (form.rec_loc.value == '') {
			alert('채용공고 지역을입력하세요.');
			form.rec_loc.focus();

		} else if (form.rec_pay.value == '') {
			alert('채용공고 연봉을입력하세요.');
			form.rec_pay.focus();

		} else if (form.rec_prd.value == '') {
			alert('채용공고 근무기간을입력하세요.');
			form.rec_prd.focus();

		} else if (form.rec_day.value == '') {
			alert('채용공고 근무요일을입력하세요.');
			form.rec_prd.focus();

		} else if (form.rec_time.value == '') {
			alert('채용공고 근무시간을입력하세요.');
			form.rec_time.focus();

		} else if (form.rec_sct.value == '') {
			alert('채용공고 업,직종을입력하세요.');
			form.rec_sct.focus();

		} else if (form.rec_hrd.value == '') {
			alert('채용공고 고용형태를입력하세요.');
			form.rec_hrd.focus();

		} else if (form.rec_bnf.value == '') {
			alert('채용공고 복리후생을입력하세요.');
			form.rec_bnf.focus();

		} else {

			form.submit()
		}

	}
</script>
<body>

	<link href="<c:url value = '/resources/css/com/comcreateform.css'/>"
		rel="stylesheet" type="text/css">
	<jsp:include page="../../include/header.jsp" />
	<jsp:include page="../../include/nav.jsp" />
	<section>

		<div id="section_wrap">
			<div class="word">
				<h3>채용정보입력</h3>
			</div>

			<%
			ComMemberVo loginedComMemberVo = (ComMemberVo) session.getAttribute("loginedComMemberVo");
			%>

			<div class="create_job_form">

				<form action="<c:url value='/job/createJobConfirm' />"
					name="create_job_form" method="post">
					<div class="formbox">
						<input type="hidden" name="rec_c_no"
							value="${loginedComMemberVo.c_no}"> <br>
						<div>
							<p>공고제목</p>
							<input type="text" name="rec_title" placeholder="공고제목">
						</div>
						<br>
						<div>
							<p>마감기한</p>
							<input type="date" name="rec_due" placeholder="마감기한.">
						</div>
						<br>
						<div>
							<p>모집인원</p>
							<input type="text" name="rec_num" placeholder="모집인원.">
						</div>
						<br>
						<div>
							<p>학력</p>
							<select name="rec_edu" class="select">
								<option value="학력">학력</option>
								<option value="초등학교">초등학교</option>
								<option value="중학교">중학교</option>
								<option value="고등학교">고등학교</option>
								<option value="대학교(2/3년제)">대학교(2/3년제)</option>
								<option value="대학교(4년제)">대학교(4년제)</option>
								<option value="대학훤">대학원</option>
							</select>
						</div>
						<br> </br>
						<div>
							<p>연령</p>
							<input type="text" name="rec_age" placeholder="연령">
						</div>
						<br>
						<div>
							<p>성별</p>
							<select name="rec_gender" class="select">
								<option value="성별">성별</option>
								<option value="남자">남자</option>
								<option value="여자">여자</option>
								<option value="무관">무관</option>
							</select>
						</div>
						<br>
						<div>
							<p>근무지역</p>
							<select name="rec_loc" class="select">
								<option value="근무지역">근무지역</option>
								<option value="전국">전국</option>
								<option value="서울">서울</option>
								<option value="강원도">강원</option>
								<option value="경기도">경기</option>
								<option value="인천">인천</option>
								<option value="충청도">충청도</option>
								<option value="전라도">전라도</option>
								<option value="광주">광주</option>
								<option value="경상도">경상도</option>
								<option value="대구">대구</option>
								<option value="부산">부산</option>
							</select>
						</div>
						<br>
						<div>
							<p>채용공고 연봉</p>
							<input type="text" name="rec_pay" placeholder="채용공고 연봉.">
						</div>
						<br>
						<div>
							<p>경력사항</p>
							<select name="rec_prd" class="select">
								<option value="경력">경력</option>
								<option value="무관">무관</option>
								<option value="1주일">1주일이하</option>
								<option value="1개월">1주일~1개월</option>
								<option value="3개월">1개월~3개월</option>
								<option value="6개월">3개월~6개월</option>
								<option value="1년">6개월~1년</option>
								<option value="1년이상">1년이상</option>
							</select>
						</div>
						<br>
						<div>
							<p>근무날짜</p>
							<select name="rec_day" class="select">
								<option value="날짜">날짜</option>
								<option value="무관">무관</option>
								<option value="월~일">월~일</option>
								<option value="월~토">월~토</option>
								<option value="월~금">월~금</option>
								<option value="주말">주말(토,일)</option>
								<option value="6일">주6일</option>
								<option value="5일">주5일</option>
								<option value="4일">주4일</option>
								<option value="3일">주3일</option>
								<option value="2일">주2일</option>
								<option value="1일">주1일</option>
							</select>
						</div>
						<br>
						<div>
							<p>근무시간</p>
							<select name="rec_time" class="select">
								<option value="시간">시간</option>
								<option value="무관">무관</option>
								<option value="오전">오전 파트타임(06:00~12:00)</option>
								<option value="오후">오후 파트타임(12:00~18:00)</option>
								<option value="저녁">저녁 파트타임(18:00~24:00)</option>
								<option value="새벽">새벽 파트타임(06:00~06:00)</option>
								<option value="풀타임">풀타임(8시간이상)</option>
							</select>
						</div>
						<br>
						<div>
							<p>직종</p>
							<select name="rec_sct" class="select">
								<option value="직종">직장</option>
								<option value="외식·음료">외식·음료</option>
								<option value="매장관리·판매">매장관리·판매</option>
								<option value="서비스">서비스</option>
								<option value="사무직">사무직</option>
								<option value="고객상담·리서치·영업">고객상담·리서치·영업</option>
								<option value="생산·건설·노무">생산·건설·노무</option>
								<option value="IT·기술">IT·기술</option>
								<option value="디자인">디자인</option>
								<option value="미디어">미디어</option>
								<option value="운전·배달">운전·배달</option>
								<option value="병원·간호·연구">병원·간호·연구</option>
								<option value="교육·강사">교육·강사</option>
							</select>
						</div>
						<br>
						<div>
							<p>급여방식</p>
							<select name="rec_hrd" class="select">
								<option value="급여">급여</option>
								<option value="시급">시급</option>
								<option value="주급">주급</option>
								<option value="월급">월급</option>
								<option value="연봉">연봉</option>
								<option value="건별">건별</option>
							</select>
						</div>
						<br>
						<div>
							<p>복리후생</p>
							<input type="text" name="rec_bnf" placeholder="채용공고 복리후생.">
						</div>
						<br> <input type="button" value="등록하기" class="okbtn"
							onclick="createJobForm();">
					</div>

				</form>

			</div>
		</div>

	</section>
	<jsp:include page="../../include/footer.jsp" />
</body>
</html>