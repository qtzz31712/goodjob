<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<link href="<c:url value='/resources/css/job/common.css' />" rel="stylesheet" type="text/css">

</head>
<body>

	<!--<h1>메인페이지</h1>
	 <pre>
        [기능명세서]
        0. 사이트 접속 시 세션 객체를 생성하고, 회원타입(개인,기업,관리자)과 회원번호를 세션에 저장한다.

        1. [헤더] 세션을 활용해서 로그인 여부와 회원타입을 확인한 후, 적절한 내용을 출력한다.
            - 비회원: '로그인,회원가입', '채용정보,회원서비스,고객센터'
            - 개인회원: '정보수정,로그아웃', '채용정보,개인서비스,고객센터'
            - 기업회원: '정보수정,로그아웃', '채용정보,기업서비스,고객센터'
            - 관리자회원: '로그아웃', '채용정보,관리자서비스,고객센터'

        2. [섹션] 최근에 등록된 15개의 알바를 리스트로 출력한다.

        3. [푸터] 알바몬과 유사한 푸터를 출력한다. '회사명,대표명,사업자등록번호,주소,통신판매업 신고번호,직업정보제공사업 신고번호'
    </pre>
	 -->
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp"></jsp:include>

  <section>
	<div id="section_wrap">
		<div class="rec_detail">
			<div class="summary">
				<div><h1>${jobVo.rec_title }</h1></div>
				<div class="contents">
					<div>
						<span class="small">급여</span><span class="big">${jobVo.rec_hrd} ${jobVo.rec_pay }</span>
					</div>
					<div><span class="small">근무기간</span><span class="big">${jobVo.rec_prd }</span></div>
					<div><span class="small">근무요일</span><span class="big">${jobVo.rec_day }</span></div>
					<div><span class="small">근무시간</span><span class="big">${jobVo.rec_time }</span></div>
					
				</div>
			</div>
			<div class = "rec_condition">
				<div><h2>모집조건</h2></div>
				<div class="contents">
					<div>
						<div><span class="small">채용 마감기한 : </span><span class="big">${jobVo.rec_due }</span></div>
						<div><span class="small">학력 : </span><span class="big">${jobVo.rec_edu }</span></div>
						<div><span class="small">모집인원 : </span><span class="big">${jobVo.rec_num }</span></div>
					</div>
					<div>
						<div><span class="small">연령 : </span><span class="big">${jobVo.rec_age }</span></div>	
						<div><span class="small">성별 : </span><span class="big">${jobVo.rec_gender }</span></div>	
					</div>
				</div>
			</div>

			<div class = "working_condition">
				<div><h2>근무조건</h2></div>
				<div class="contents">
					<div>
						<div><span class="small">급여 : </span><span>${jobVo.rec_hrd}</span><span class="big">${jobVo.rec_pay }</span></div>
						<div><span class="small">근무지 : </span><span class="big">${jobVo.rec_loc }</span></div>
						<div><span class="small">근무기간 : </span><span class="big">${jobVo.rec_prd }</span></div>
						<div><span class="small">근무요일 : </span><span class="big">${jobVo.rec_day }</span></div>
					</div>
					<div>
						<div><span class="small">근무시간 : </span><span class="big">${jobVo.rec_time }</span></div>	
						<div><span class="small">업직종 : </span><span class="big">${jobVo.rec_sct }</span></div>	
						<div><span class="small">복리후생 : </span><span class="big">${jobVo.rec_bnf }</span></div>
					</div>
				</div>
				
			</div>
			
		</div>
	</div>
	<div class="button_box">
		<button type="button">지원하기</button>
	</div>
	
  </section>
	
  <jsp:include page="../include/footer.jsp" />
	
</body>
</html>