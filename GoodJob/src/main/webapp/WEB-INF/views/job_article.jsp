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

	<!-- <h1>채용공고 열람 페이지</h1>
	<pre>
	[기능명세서]
	1. 세션을 활용해서 로그인 여부와 회원타입을 확인한 후, 하단에 적절한 버튼을 출력한다.
		- 비회원: '스크랩,지원하기'
		- 개인회원: '스크랩,지원하기'
		- 기업회원: '수정,삭제,마감'
		- 관리자회원: '삭제,마감'
		1-1. [비회원] 스크랩: 쿠키에 공고번호 임시저장
				 	 지원하기: 로그인 폼으로 이동
			 [회원] 스크랩: DB에 공고번호 저장(최대6개월)
				   지원하기: 이력서목록 페이지를 팝업으로 띄움
	
    </pre> -->
	
  <section>
    <div id="section_wrap">
		<div>
			모집조건
		</div>
		<div>
			근무지역
		</div>
		<div>
			근무조건

		</div>
		<div>
			상세요강
		</div>
		<div>
			채용담당자 연락처
		</div>
		<div>
			기업정보
		</div>
		<ul>
			<li>버튼 구현방식은 javascript or jquery </li>
			<li><button>스크랩</button>			// 페이지 이동없이 alert로 스크랩 성공여부 알림</li>
			<li><button>지원하기</button>			// 이력서목록 페이지를 팝업으로 띄움</li>
			<li><button>수정</button>				// 채용공고 수정 폼으로 이동</li>
			<li><button>삭제</button>				// alert 띄워서 한번 묻고 삭제한다. 성공 시 이전 페이지로 이동</li>
			<li><button>마감</button>				// 페이지 이동없이 alert로 마감 성공여부 알림</li>
		</ul>
	</div>
  </section>
	
  
	
</body>
</html>