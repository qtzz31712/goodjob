<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoodJob | 이력서관리</title>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
   integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
   crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="<c:url value='/resources/css/user/resume/resume_list.css' />" rel="stylesheet" type="text/css">

</head>
<body>
<jsp:include page="../../include/header.jsp" />
<jsp:include page="../../include/nav.jsp" />

	<section>
	<div class="section_wrap">
	<div class="text">
	<h3>이력서 관리</h3>
	<div>
		<p>지원 후 수정한 이력서내용은 지원한 이력서에는 반영되지 않습니다</p>
		<p>이력서는 최대 6개까지 저장가능합니다.</p>
	
	</div>
	</div>

<div class="table_wrap">
			<div class="resume_list">
			
		
			</div>
	

	<a href="<c:url value='/resume/createResumeForm' />" class="create">이력서등록</a>
</div>
</div>

	</section>
<jsp:include page="../../include/footer.jsp" />
<script>
let ar_u_no = ${r_u_no}
console.log(ar_u_no)
resumeList(ar_u_no);
function resumeList(r_u_no){
	jQuery.ajax({
		url : "${pageContext.request.contextPath}/resume/user/listupResume/"+r_u_no,
		type : "GET",
		contentType : 'application/json; charset=utf-8', // 서버로 데이터를 보내는 형식
		success : function(rdata) {
			console.log(rdata)
			jQuery('.resume_list').html(rdata);
		},
		error : function(error) {
			alert(error)
		}
	})
}
	

</script>

</body>
</html>