<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 채용 공고</title>
<link href="<c:url value='/resources/css/job/common.css' />" rel="stylesheet" type="text/css">

</head>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
   integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
   crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   
<script type="text/javascript">

	function searchJob() {
		
		let form = document.search_job_form;
		
		form.submit();
		
	}

</script>


<body>

	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/nav.jsp"></jsp:include>

  <section>
	<div id="section_wrap">
		<div class="job_list_wrap">
			<div clss="job_list_title">
				<h2>모든 채용 공고</h2>
			</div>
			<div class="search">
				<form action="<c:url value='/job/filtered' />" name="search_job_form" method="get">
					<input type="text" name="rec_title" placeholder="키워드를 입력하세요.">
					<input type="submit" value="검색" onclick="searchJob();">
				</form>
			</div>
			<div class="job_list">
				
			</div>
		</div>
	</div>
	
	
  </section>
	
  <jsp:include page="../include/footer.jsp" />
	
<script>
jobList();
function jobList(){
	jQuery.ajax({
		url : "${pageContext.request.contextPath}/job/allJob",
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