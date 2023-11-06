<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
</head>
<body>

	<h1>전체 채용공고 리스트 페이지</h1>
	<pre>
	[기능명세서]
	1. 마감되지 않은 채용공고를 출력한다.

	2. '지역, 업직종, 근무기간, 상세조건'의 1차 필터가 존재한다.

	3. '등록일전체,오늘등록,3일이내등록,7일이내등록'의 2차 필터가 존재한다.

	4. '최신등록순,거리순,각종급여높은순'으로 정렬이 가능하며, 기본값은 최신등록순이다.

	5. 한번에 20개의 채용공고가 출력되고, 페이지를 넘기면 DB에서 추가적인 채용공고를 받아와 출력한다.

	6. 채용공고를 누르면 채용공고 열람페이지로 이동한다.
    </pre>
	
  <section>
    <div id="section_wrap">
		<div class="all_job_filter">
			1차 필터
		</div>
		<div class="job_list_wrap">
			<div class="filter_sort">
			2차 필터
			</div>
			<div class="job_list">
				채용공고 20개씩 출력
				<ul>
					<li><a href="<c:url value='/job/selectArticle?1' />">채용공고1</a>	// 해당 공고번호를 이용해 열람페이지로 이동</li>
					<li><a href="<c:url value='/job/selectArticle?2' />">채용공고2</a>	// 해당 공고번호를 이용해 열람페이지로 이동</li>
					<li><a href="<c:url value='/job/selectArticle?3' />">채용공고3</a>	// 해당 공고번호를 이용해 열람페이지로 이동</li>
				</ul>
			</div>
		</div>

	</div>
  </section>
	

	
</body>
</html>