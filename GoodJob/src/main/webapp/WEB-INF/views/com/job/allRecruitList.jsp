<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="team.pj.goodjob.com.member.ComMemberVo"%>
<%
ComMemberVo loginedComMemberVo = (ComMemberVo) session.getAttribute("loginedComMemberVo");
%>


<html>

<head>


   <link href="<c:url value = '/resources/css/com/comlist.css'/>" rel="stylesheet" type="text/css">
     <link href="<c:url value = '/resources/css/common/common.css'/>" rel="stylesheet" type="text/css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>   
   
</head> 

<jsp:include page="../../include/header.jsp" />
	<jsp:include page="../../include/nav.jsp" />
<body>
	<div id="section_wrap">
		<div class="word">
			<h3>채용리스트확인하기</h3>
		</div>
		<div class="myrecruit_list"></div>
	</div>


	<script>
		$.noConflict();
		var jQ = jQuery;
		let arec_c_no = ${rec_c_no}
		allList(arec_c_no)
		function allList(rec_c_no) {
			jQ.ajax({
				url : "${pageContext.request.contextPath}/job/com/myallList/"
						+ rec_c_no,
				type : "GET",
				dataType : "html", // 서버에서 반환되는 데이터형식, 생략하면 jQuery가 자동을 결정함.
				contentType : 'application/json; charset=utf-8', // 서버로 데이터를 보내는 형식
				success : function(rdata) {
					console.log(rdata)
					jQ('.myrecruit_list').html(rdata);
				},
				error : function(error) {
					alert(error)
				}
			})
		}
	</script>
	<jsp:include page="../../include/footer.jsp" />
</body>
</html>