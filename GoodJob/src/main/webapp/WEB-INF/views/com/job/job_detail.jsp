<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>


<head>
     <link href="<c:url value = '/resources/css/common/common.css'/>" rel="stylesheet" type="text/css">
     <link href="<c:url value = '/resources/css/com/comlistdetail.css'/>" rel="stylesheet" type="text/css">
<meta charset="UTF-8">


<script>
	function finish() {
		let result = confirm("마감시 수정 불가능합니다!!!!!!!");
		if (result) {
			alert("마감되었습니다.");

			// 원하는 작업을 수행할 수 있도록 추가 코드 작성
		} else {
			alert("마감 실패!!!");
			// 원하는 작업을 수행할 수 있도록 추가 코드 작성
		}
	}
</script>



</head>


<body>


	<jsp:include page="../../include/header.jsp" />

	<jsp:include page="../../include/nav.jsp" />

	<section>

		<div id="section_wrap">
			<div class="word">
				<h3>채용자세히보기</h3>
			</div>

			<div class="modify_job_form">
				<form action="<c:url value='/job/com/modifyjobConfirm' />"
					name="modify_job_form" method="post">
				<div class="formbox">
					<input type="hidden" name="rec_no" value="${jobVo.rec_no }">
					<input type="hidden" name="rec_c_no" value="${jobVo.rec_c_no }">
					<div>
						<p>공고제목</p>
						<input type="text" name="rec_title" value="${jobVo.rec_title }"
							placeholder="공고제목" readonly></div> <br>
					
					<div>
						<p>마감기한</p>
						<input type="date" name="rec_due" value="${jobVo.rec_due }"
							placeholder="마감기한." readonly> </div><br>
					
					<div>
						<p>모집인원</p>
						<input type="text" name="rec_num" value="${jobVo.rec_num }"
							placeholder="모집인원." readonly> </div><br>
					
					<div>
						<p>학력</p>
						<select name="rec_edu"  disabled>
							<option value="학력"
								<c:if test="${jobVo.rec_edu eq '학력'}"> selected </c:if>>학력</option>
							<option value="초등학교"
								<c:if test="${jobVo.rec_edu eq '초등학교'}"> selected </c:if>>초등학교</option>
							<option value="중학교"
								<c:if test="${jobVo.rec_edu eq '중학교'}"> selected </c:if>>중학교</option>
							<option value="고등학교"
								<c:if test="${jobVo.rec_edu eq '고등학교'}"> selected </c:if>>고등학교</option>
							<option value="대학교(2/3년제)"
								<c:if test="${jobVo.rec_edu eq '대학교(2/3년제)'}"> selected </c:if>>대학교(2/3년제)</option>
							<option value="대학교(4년제)"
								<c:if test="${jobVo.rec_edu eq '대학교(4년제)'}"> selected </c:if>>대학교(4년제)</option>
							<option value="대학훤"
								<c:if test="${jobVo.rec_edu eq '대학훤'}"> selected </c:if>>대학원</option>
						</select></div> <br>
					
					<div>
						<p>연령</p>
						<input type="text" name="rec_age" value="${jobVo.rec_age }" readonly>
						</div>
						<br>
					
					<div>
						<p>성별</p>
						<select name="rec_gender"disabled>
							<option value="성별"
								<c:if test="${jobVo.rec_gender eq '성별'}"> selected </c:if>>성별</option>
							<option value="남자"
								<c:if test="${jobVo.rec_gender eq '남자'}"> selected </c:if>>남자</option>
							<option value="여자"
								<c:if test="${jobVo.rec_gender eq '여자'}"> selected </c:if>>여자</option>
							<option value="무관">무관</option>
						</select>
					</div>
					<br>
					<div>
						<p>근무지역</p>
						<br> <select name="rec_loc"disabled>
							<option value="근무지역"
								<c:if test="${jobVo.rec_gender eq '근무지역'}"> selected </c:if>>근무지역</option>
							<option value="전국"
								<c:if test="${jobVo.rec_loc eq '전국'}"> selected </c:if>>전국</option>
							<option value="서울"
								<c:if test="${jobVo.rec_loc eq '서울'}"> selected </c:if>>서울</option>
							<option value="강원도"
								<c:if test="${jobVo.rec_loc eq '강원도'}"> selected </c:if>>강원</option>
							<option value="경기도"
								<c:if test="${jobVo.rec_loc eq '경기도'}"> selected </c:if>>경기</option>
							<option value="인천"
								<c:if test="${jobVo.rec_loc eq '인천'}"> selected </c:if>>인천</option>
							<option value="충청도"
								<c:if test="${jobVo.rec_loc eq '충청도'}"> selected </c:if>>충청도</option>
							<option value="전라도"
								<c:if test="${jobVo.rec_loc eq '전라도'}"> selected </c:if>>전라도</option>
							<option value="광주"
								<c:if test="${jobVo.rec_loc eq '광주'}"> selected </c:if>>광주</option>
							<option value="경상도"
								<c:if test="${jobVo.rec_loc eq '경상도'}"> selected </c:if>>경상도</option>
							<option value="대구"
								<c:if test="${jobVo.rec_loc eq '대구'}"> selected </c:if>>대구</option>
							<option value="부산"
								<c:if test="${jobVo.rec_loc eq '부산'}"> selected </c:if>>부산</option>
						</select></div> <br>
					
			<div><p>급여</p>
					<input type="text" name="rec_pay" value="${jobVo.rec_pay }" readonly></div>
					<br>
					<div><p>근무기간</p>
					<br> <select name="rec_prd"disabled>
						<option value="경력"
							<c:if test="${jobVo.rec_prd eq '경력'}"> selected </c:if>>경력</option>
						<option value="무관"
							<c:if test="${jobVo.rec_prd eq '무관'}"> selected </c:if>>무관</option>
						<option value="1주일"
							<c:if test="${jobVo.rec_prd eq '1주일'}"> selected </c:if>>1주일이하</option>
						<option value="1개월"
							<c:if test="${jobVo.rec_prd eq '1개월'}"> selected </c:if>>1주일~1개월</option>
						<option value="3개월"
							<c:if test="${jobVo.rec_prd eq '3개월'}"> selected </c:if>>1개월~3개월</option>
						<option value="6개월"
							<c:if test="${jobVo.rec_prd eq '6개월'}"> selected </c:if>>3개월~6개월</option>
						<option value="1년"
							<c:if test="${jobVo.rec_prd eq '1년'}"> selected </c:if>>6개월~1년</option>
						<option value="1년이상"
							<c:if test="${jobVo.rec_prd eq '1년이상'}"> selected </c:if>>1년이상</option>

					</select></div> <br>
					<div><p>근무날짜</p>
					<select name="rec_day"disabled>
						<option value="날짜"
							<c:if test="${jobVo.rec_day eq '날짜'}"> selected </c:if>>날짜</option>
						<option value="무관"
							<c:if test="${jobVo.rec_day eq '무관'}"> selected </c:if>>무관</option>
						<option value="월~일"
							<c:if test="${jobVo.rec_day eq '월~일'}"> selected </c:if>>월~일</option>
						<option value="월~토"
							<c:if test="${jobVo.rec_day eq '월~토'}"> selected </c:if>>월~토</option>
						<option value="월~금"
							<c:if test="${jobVo.rec_day eq '월~금'}"> selected </c:if>>월~금</option>
						<option value="주말"
							<c:if test="${jobVo.rec_day eq '주말'}"> selected </c:if>>주말(토,일)</option>
						<option value="6일"
							<c:if test="${jobVo.rec_day eq '6일'}"> selected </c:if>>주6일</option>
						<option value="5일"
							<c:if test="${jobVo.rec_day eq '5일'}"> selected </c:if>>주5일</option>
						<option value="4일"
							<c:if test="${jobVo.rec_day eq '4일'}"> selected </c:if>>주4일</option>
						<option value="3일"
							<c:if test="${jobVo.rec_day eq '3일'}"> selected </c:if>>주3일</option>
						<option value="2일"
							<c:if test="${jobVo.rec_day eq '2일'}"> selected </c:if>>주2일</option>
						<option value="1일"
							<c:if test="${jobVo.rec_day eq '1일'}"> selected </c:if>>주1일</option>

					</select></div><br>
					<div><p>근무시간</p>
					<br> <select name="rec_time"disabled>
						<option value="시간"
							<c:if test="${jobVo.rec_time eq '시간'}"> selected </c:if>>시간</option>
						<option value="무관"
							<c:if test="${jobVo.rec_time eq '무관'}"> selected </c:if>>무관</option>
						<option value="오전"
							<c:if test="${jobVo.rec_time eq '오전'}"> selected </c:if>>오전
							파트타임(06:00~12:00)</option>
						<option value="오후"
							<c:if test="${jobVo.rec_time eq '오후'}"> selected </c:if>>오후
							파트타임(12:00~18:00)</option>
						<option value="저녁"
							<c:if test="${jobVo.rec_time eq '저녁'}"> selected </c:if>>저녁
							파트타임(18:00~24:00)</option>
						<option value="새벽"
							<c:if test="${jobVo.rec_time eq '새벽'}"> selected </c:if>>새벽
							파트타임(06:00~06:00)</option>
						<option value="풀타임"
							<c:if test="${jobVo.rec_time eq '풀타임'}"> selected </c:if>>풀타임(8시간이상)</option>
					</select>  </div><br>
				<div>	<p>직종</p>
					<select name="rec_sct"disabled>
						<option value="직종"
							<c:if test="${jobVo.rec_sct eq '직종'}"> selected </c:if>>직장</option>
						<option value="외식·음료"
							<c:if test="${jobVo.rec_sct eq '외식·음료'}"> selected </c:if>>외식·음료</option>
						<option value="매장관리·판매"
							<c:if test="${jobVo.rec_sct eq '매장관리·판매'}"> selected </c:if>>매장관리·판매</option>
						<option value="서비스"
							<c:if test="${jobVo.rec_sct eq '서비스'}"> selected </c:if>>서비스</option>
						<option value="사무직"
							<c:if test="${jobVo.rec_sct eq '사무직'}"> selected </c:if>>사무직</option>
						<option value="고객상담·리서치·영업"
							<c:if test="${jobVo.rec_sct eq '고객상담·리서치·영업'}"> selected </c:if>>고객상담·리서치·영업</option>
						<option value="생산·건설·노무"
							<c:if test="${jobVo.rec_sct eq '생산·건설·노무'}"> selected </c:if>>생산·건설·노무</option>
						<option value="IT·기술"
							<c:if test="${jobVo.rec_sct eq 'IT·기술'}"> selected </c:if>>IT·기술</option>
						<option value="디자인"
							<c:if test="${jobVo.rec_sct eq '디자인'}"> selected </c:if>>디자인</option>
						<option value="미디어"
							<c:if test="${jobVo.rec_sct eq '미디어'}"> selected </c:if>>미디어</option>
						<option value="운전·배달"
							<c:if test="${jobVo.rec_sct eq '운전·배달'}"> selected </c:if>>운전·배달</option>
						<option value="병원·간호·연구"
							<c:if test="${jobVo.rec_sct eq '병원·간호·연구'}"> selected </c:if>>병원·간호·연구</option>
						<option value="교육·강사"
							<c:if test="${jobVo.rec_sct eq '교육·강사'}"> selected </c:if>>교육·강사</option>
					</select> </div><br>
					<div><p>급여방식</p>
					<br> <select name="rec_hrd"disabled>
						<option value="급여"
							<c:if test="${jobVo.rec_hrd eq '급여'}"> selected </c:if>>급여</option>
						<option value="시급"
							<c:if test="${jobVo.rec_hrd eq '시급'}"> selected </c:if>>시급</option>
						<option value="주급"
							<c:if test="${jobVo.rec_hrd eq '주급'}"> selected </c:if>>주급</option>
						<option value="월급"
							<c:if test="${jobVo.rec_hrd eq '월급'}"> selected </c:if>>월급</option>
						<option value="연봉"
							<c:if test="${jobVo.rec_hrd eq '연봉'}"> selected </c:if>>연봉</option>
						<option value="건별"
							<c:if test="${jobVo.rec_hrd eq '건별'}"> selected </c:if>>건별</option>
					</select></div> <br>
					<div><p>복리후생</p>
					<input type="text" name="rec_bnf" value="${ jobVo.rec_bnf}"
						placeholder="채용공고 복리후생." readonly> </div> <br>
						<div class="btnbox"><c:url value='/job/com/modifyJobForm' var='modify_url'>
							<c:param name='rec_no' value='${jobVo.rec_no}' />
						</c:url> <a href="${modify_url}" class="okbtn">수정하기</a>
						<c:url value='/job/com/finishJobConfirm' var='finish_url'>
							<c:param name='rec_no' value='${jobVo.rec_no}' />
							<c:param name='rec_c_no' value='${jobVo.rec_c_no}' />	
						</c:url> <a href="${finish_url}" onclick="finish();" class="okbtn">마감하기</a>
						</div>
						
						
						
					</div>

				</form>

			</div>


			</div>

		</div>

	</section>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>