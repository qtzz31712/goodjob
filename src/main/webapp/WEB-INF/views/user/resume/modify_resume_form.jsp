<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="team.pj.goodjob.user.member.UserMemberVo"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>good job |이력서작성</title>


<script type="text/javascript">
	function modifyResumeForm() {
		console.log('modifyResumeForm() CALLED!!');

		let form = document.forms.modify_resume_form;

		if (form.r_title.value == '') {
			alert('이력서 제목을 작성하세요');
			form.r_title.focus();
		} else if (form.r_edu.value == '') {
			alert('학력사항을 선택하세요');
			form.r_edu.focus();
		} else if (form.r_career.value == '') {
			alert('경력사항을 선택하세요');
			form.r_career.focus();
		} else if (form.r_career.value == '경력'
				&& (form.r_career_date.value == '' || form.r_career_date.value === '0')) {
			alert('경력기간을 작성하세요');
			form.r_career_date.focus();
		} else if (form.r_career.value == '신입') {
			form.r_career_date.value = 0;
		} else if (form.r_hope_loc.value == '') {
			alert('희망 근무지를 선택하세요');
			form.r_hope_loc.focus();
		} else if (form.r_hope_sct.value == '') {
			alert('희망 직종을 선택하세요');
			form.r_hope_sct.focus();
		} else if (form.r_hope_prd.value == '') {
			alert('희망 근무기간을 선택하세요');
			form.r_hope_prd.focus();
		} else if (form.r_hope_day.value == '') {
			alert('희망 근무요일을 선택하세요');
			form.r_hope_day.focus();
		} else if (form.r_hope_time.value == '') {
			alert('희망 근무시간을 선택하세요');
			form.r_hope_time.focus();
		} else if (form.r_hope_hrd.value == '') {
			alert('희망 급여형태를 선택하세요');
			form.r_hope_hrd.focus();
		} else if (form.r_hope_pay.value == '') {
			alert('희망 급여를 작성하세요');
			form.r_hope_pay.focus();
		} else if (form.r_des.value == '') {
			alert('자기소개를 작성하세요');
			form.r_des.focus();
		} else {
			if (confirm('이력서 수정을 완료하시겠습니까?')) {
				form.submit();
			}
		}
	}
</script>

<link
	href="<c:url value='/resources/css/user/resume/modify_resume_form.css' />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value='/resources/css/user/resume/resume_form.css' />"
	rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="../../include/header.jsp" />
	<jsp:include page="../../include/nav.jsp" />
	<div class="modify_resume_form">
		<jsp:include page="./my_info.jsp" />

		<form action="<c:url value='/resume/modifyResumeConfirm'/>"
			name="modify_resume_form" method="post" class="resume_form">
			<input type="hidden" name="r_u_no"
				value="${loginedUserMemberVo.u_no} " /> <input type="hidden"
				name="r_no" value="${resumeVo.r_no }">
			<h3>이력서 제목</h3>
			<input type="text" placeholder="이력서 제목을 입력해주세요" name="r_title"
				value="${resumeVo.r_title }" class="r_title">
			<h3>학력 사항</h3>
			<div class="r_edu_wrap">
				<h4>최종학력</h4>
				<select name="r_edu" class="r_edu">
					<option value="" class="r_edu_option"></option>
					<option value="초등학교" ${resumeVo.r_edu == '초등학교' ? 'selected' : ''}
						class="r_edu_option">초등학교</option>
					<option value="중학교" ${resumeVo.r_edu == '중학교' ? 'selected' : ''}
						class="r_edu_option">중학교</option>
					<option value="고등학교" ${resumeVo.r_edu == '고등학교' ? 'selected' : ''}
						class="r_edu_option">고등학교</option>
					<option value="대학교(2/3년제)"
						${resumeVo.r_edu == '대학교(2/3년제)' ? 'selected' : ''}
						class="r_edu_option">대학교(2/3년제)</option>
					<option value="대학교(4년제)"
						${resumeVo.r_edu == '대학교(4년제)' ? 'selected' : ''}
						class="r_edu_option">대학교(4년제)</option>
					<option value="대학원" ${resumeVo.r_edu == '대학원' ? 'selected' : ''}
						class="r_edu_option">대학원</option>
				</select>
			</div>
			<h3>경력 사항</h3>
			<h4>경력구분</h4>

			<div class="career_wrap">
				<input type="radio" name="r_career" value="신입"
					${resumeVo.r_career == '신입' ? 'checked' : ''}
					class="r_career_option new">신입 <input type="radio"
					name="r_career" value="경력"
					${resumeVo.r_career == '경력' ? 'checked' : ''}
					class="r_career_option old">경력
				<div class="r_career_date_wrap">
					<input type="number" name="r_career_date"
						value="${resumeVo.r_career_date}" class="r_career_date">
					<p id="monthsText">개월</p>
				</div>
			</div>
			<h3>희망근무조건</h3>
			<h4>근무지</h4>
			<select name="r_hope_loc" class="r_hope_loc">
				<option value="" class="r_hope_loc_option"></option>
				<option value="전국" ${resumeVo.r_hope_loc == '전국' ? 'selected' : ''}
					class="r_hope_loc_option">전국</option>
				<option value="서울" ${resumeVo.r_hope_loc == '서울' ? 'selected' : ''}
					class="r_hope_loc_option">서울</option>
				<option value="강원도"
					${resumeVo.r_hope_loc == '강원도' ? 'selected' : ''}
					class="r_hope_loc_option">강원도</option>
				<option value="경기도"
					${resumeVo.r_hope_loc == '경기도' ? 'selected' : ''}
					class="r_hope_loc_option">경기</option>
				<option value="인천" ${resumeVo.r_hope_loc == '인천' ? 'selected' : ''}
					class="r_hope_loc_option">인천</option>
				<option value="충청도"
					${resumeVo.r_hope_loc == '충청도' ? 'selected' : ''}
					class="r_hope_loc_option">충청도</option>
				<option value="전라도"
					${resumeVo.r_hope_loc == '전라도' ? 'selected' : ''}
					class="r_hope_loc_option">전라도</option>
				<option value="광주" ${resumeVo.r_hope_loc == '광주' ? 'selected' : ''}
					class="r_hope_loc_option">광주</option>
				<option value="경상도"
					${resumeVo.r_hope_loc == '경상도' ? 'selected' : ''}
					class="r_hope_loc_option">경상도</option>
				<option value="대구" ${resumeVo.r_hope_loc == '대구' ? 'selected' : ''}
					class="r_hope_loc_option">대구</option>
				<option value="부산" ${resumeVo.r_hope_loc == '부산' ? 'selected' : ''}
					class="r_hope_loc_option">부산</option>
			</select>

			<h4>희망업종</h4>
			<select name="r_hope_sct" class="r_hope_sct">
				<option value=""></option>
				<option value="외식·음료"
					${resumeVo.r_hope_sct == '외식·음료' ? 'selected' : ''}>외식·음료</option>
				<option value="매장관리·판매"
					${resumeVo.r_hope_sct == '매장관리·판매' ? 'selected' : ''}>매장관리·판매</option>
				<option value="서비스"
					${resumeVo.r_hope_sct == '서비스' ? 'selected' : ''}>서비스</option>
				<option value="사무직"
					${resumeVo.r_hope_sct == '사무직' ? 'selected' : ''}>사무직</option>
				<option value="고객상담·리서치·영업"
					${resumeVo.r_hope_sct == '고객상담·리서치·영업' ? 'selected' : ''}>고객상담·리서치·영업</option>
				<option value="생산·건설·노무"
					${resumeVo.r_hope_sct == '생산·건설·노무' ? 'selected' : ''}>생산·건설·노무</option>
				<option value="IT·기술"
					${resumeVo.r_hope_sct == 'IT·기술' ? 'selected' : ''}>IT·기술</option>
				<option value="디자인"
					${resumeVo.r_hope_sct == '디자인' ? 'selected' : ''}>디자인</option>
				<option value="미디어"
					${resumeVo.r_hope_sct == '미디어' ? 'selected' : ''}>미디어</option>
				<option value="운전·배달"
					${resumeVo.r_hope_sct == '운전·배달' ? 'selected' : ''}>운전·배달</option>
				<option value="병원·간호·연구"
					${resumeVo.r_hope_sct == '병원·간호·연구' ? 'selected' : ''}>병원·간호·연구</option>
				<option value="교육·강사"
					${resumeVo.r_hope_sct == '교육·강사' ? 'selected' : ''}>교육·강사</option>
			</select>
			<h4>근무기간</h4>
			<select name="r_hope_prd" class="r_hope_prd">
				<option value=""></option>
				<option value="무관" ${resumeVo.r_hope_prd == '무관' ? 'selected' : ''}>무관</option>
				<option value="1주일"
					${resumeVo.r_hope_prd == '1주일' ? 'selected' : ''}>1주일이하</option>
				<option value="1개월"
					${resumeVo.r_hope_prd == '1개월' ? 'selected' : ''}>1주일~1개월</option>
				<option value="3개월"
					${resumeVo.r_hope_prd == '3개월' ? 'selected' : ''}>1개월~3개월</option>
				<option value="6개월"
					${resumeVo.r_hope_prd == '6개월' ? 'selected' : ''}>3개월~6개월</option>
				<option value="1년" ${resumeVo.r_hope_prd == '1년' ? 'selected' : ''}>6개월~1년</option>
				<option value="1년이상"
					${resumeVo.r_hope_prd == '1년이상' ? 'selected' : ''}>1년이상</option>
			</select>
			<h4>근무시간</h4>
			<select name="r_hope_day" class="r_hope_day">
				<option value=""></option>
				<option value="무관" ${resumeVo.r_hope_day == '무관' ? 'selected' : ''}>무관</option>
				<option value="월~일"
					${resumeVo.r_hope_day == '월~일' ? 'selected' : ''}>월~일</option>
				<option value="월~토"
					${resumeVo.r_hope_day == '월~토' ? 'selected' : ''}>월~토</option>
				<option value="월~금"
					${resumeVo.r_hope_day == '월~금' ? 'selected' : ''}>월~금</option>
				<option value="주말" ${resumeVo.r_hope_day == '주말' ? 'selected' : ''}>주말(토,일)</option>
				<option value="6일" ${resumeVo.r_hope_day == '6일' ? 'selected' : ''}>주6일</option>
				<option value="5일" ${resumeVo.r_hope_day == '5일' ? 'selected' : ''}>주5일</option>
				<option value="4일" ${resumeVo.r_hope_day == '4일' ? 'selected' : ''}>주4일</option>
				<option value="3일" ${resumeVo.r_hope_day == '3일' ? 'selected' : ''}>주3일</option>
				<option value="2일" ${resumeVo.r_hope_day == '2일' ? 'selected' : ''}>주2일</option>
				<option value="1일" ${resumeVo.r_hope_day == '1일' ? 'selected' : ''}>주1일</option>
			</select> <select name="r_hope_time" class="r_hope_time">
				<option value="무관" ${resumeVo.r_hope_time == '무관' ? 'selected' : ''}>무관</option>
				<option value="오전" ${resumeVo.r_hope_time == '오전' ? 'selected' : ''}>오전
					파트타임(06:00~12:00)</option>
				<option value="오후" ${resumeVo.r_hope_time == '오후' ? 'selected' : ''}>오후
					파트타임(12:00~18:00)</option>
				<option value="저녁" ${resumeVo.r_hope_time == '저녁' ? 'selected' : ''}>저녁
					파트타임(18:00~24:00)</option>
				<option value="새벽" ${resumeVo.r_hope_time == '새벽' ? 'selected' : ''}>새벽
					파트타임(06:00~06:00)</option>
				<option value="풀타임"
					${resumeVo.r_hope_time == '풀다임' ? 'selected' : ''}>풀타임(8시간이상)</option>
			</select>

			<h4>급여</h4>
			<select name="r_hope_hrd" class="r_hope_hrd">
				<option value="시급" ${resumeVo.r_hope_hrd == '시급' ? 'selected' : ''}>시급</option>
				<option value="주급" ${resumeVo.r_hope_hrd == '주급' ? 'selected' : ''}>주급</option>
				<option value="월급" ${resumeVo.r_hope_hrd == '월급' ? 'selected' : ''}>월급</option>
				<option value="연봉" ${resumeVo.r_hope_hrd == '연봉' ? 'selected' : ''}>연봉</option>
				<option value="건별" ${resumeVo.r_hope_hrd == '건별' ? 'selected' : ''}>건별</option>
			</select> <input type="number" name="r_hope_pay" placeholder="희망금액"
				value="${resumeVo.r_hope_pay}" class="r_hope_pay">원


			<h4>자기소개</h4>
			<textarea name="r_des" placeholder="자기소개서를 작성해주세요(최대3000자)"
				class="r_des">${resumeVo.r_des}</textarea>

			<div class="button_wrap">
				<input type="button" value="수정하기" onclick="modifyResumeForm();" />
				<c:url value="/resume/resume_list_ajax" var="list_url">
					<c:param name="r_u_no" value="${loginedUserMemberVo.u_no}" />
				</c:url>
				<a href="${list_url}">이력서 리스트</a>
			</div>
		</form>
	</div>

	<jsp:include page="../../include/footer.jsp" />
	<script type="text/javascript">
		window
				.addEventListener(
						'load',
						function() {
							let careerRadio = document.forms.modify_resume_form.r_career;
							let careerDateInput = document.forms.modify_resume_form.r_career_date;
							let monthsText = document
									.getElementById('monthsText');

							if (careerRadio[0].checked) {
								// "신입"이 선택되어 있을 때
								setOpacity(careerDateInput, 0); // 숨기기
								setOpacity(monthsText, 0); // 숨기기
							} else if (careerRadio[1].checked) {
								// "경력"이 선택되어 있을 때
								setOpacity(careerDateInput, 1); // 보이기
								setOpacity(monthsText, 1); // 보이기
							}
						});

		// 경력 선택 시 인풋 박스 표시/숨김
		document.forms.modify_resume_form.r_career[0].addEventListener(
				'change', function() {
					toggleCareerDateInput(this.value);
				});

		document.forms.modify_resume_form.r_career[1].addEventListener(
				'change', function() {
					toggleCareerDateInput(this.value);
				});

		function toggleCareerDateInput(careerValue) {
			let inputBox = document.forms.modify_resume_form.r_career_date;
			let monthsText = document.getElementById('monthsText');

			if (careerValue === '경력') {
				setOpacity(inputBox, 1); // 보이기
				setOpacity(monthsText, 1); // 보이기
			} else {
				setOpacity(inputBox, 0); // 숨기기
				setOpacity(monthsText, 0); // 숨기기
			}
		}

		function setOpacity(element, opacity) {
			element.style.opacity = opacity;
		}
	</script>
</body>
</html>