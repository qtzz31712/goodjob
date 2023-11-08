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
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
   integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
   crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
	<jsp:include page="./include/header.jsp" />
	<jsp:include page="./include/nav.jsp"></jsp:include>

  <section>
	<div id="section_wrap">
		<div class="job_list_wrap">
			<div class="job_list_title">
				<h2>최근 등록된 채용 공고</h2>
				<a href="<c:url value='/job' />">더보기</a>
			</div>
		
			<div class="job_list">
				
			</div>
		</div>
	</div>
	
	
  </section>
	
  <jsp:include page="./include/footer.jsp" />
	<script>
jobList();
function jobList(){
	jQuery.ajax({
		url : "${pageContext.request.contextPath}/job/recentJob",
		type : "GET",
		contentType : 'application/json; charset=utf-8', // 서버로 데이터를 보내는 형식
		success : function(rdata) {
			console.log(rdata)
			jQuery('.job_list').html(rdata);
		},
		error : function(error) {
			alert(error)
		}
	})
}
	

</script>
</body>
</html>