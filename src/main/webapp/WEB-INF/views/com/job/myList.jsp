<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <link href="<c:url value = '/resources/css/common/common.css'/>" rel="stylesheet" type="text/css">

<table>
			<thead>		
				<tr>
					<th>공고번호</th>
					<th>지역</th>
					<th>공고제목</th>
					<th>마감날짜</th>
					<th>급여</th>
					<th>근무시간</th>
					<th>수정</th>
					<th>삭제</th>
					<th>채용진행현황</th>
				</tr>		
			</thead>
			<tbody>
				<c:forEach var="item" items="${jobVos}">
					<tr>
						<td><c:url value='/job/com/jobDetailForm' var='detail_url'>
								<c:param name='rec_no' value='${item.rec_no}' />
							</c:url> <a href="${detail_url}">${item.rec_no}</a></td>
						<td>${item.rec_loc}</td>
						<td><a class="job_detail_form" href="${detail_url}">${item.rec_title}</a></td>
						<td>${item.rec_due}</td>
						<td>${item.rec_hrd}</td>
						<td>${item.rec_prd}</td>
						<td><c:url value='/job/com/modifyJobForm' var='modify_url'>
								<c:param name='rec_no' value='${item.rec_no}' />
															
							</c:url> <a href="${modify_url}">수정하기</a></td>

					<td><button type="button" class="delete_job_recruit"
							onclick="deleteJobConfirm('${item.rec_title}' , ${item.rec_no} ,${item.rec_c_no })">X</button>
						</td>
							<c:if test="${item.rec_approval==0}"><td style="color:#00a1ef">채용진행중</td></c:if> 
							<c:if test="${item.rec_approval==1}"><td style="color:#ef0d0d">채용마감</td></c:if> 
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
		
		
<script>

function deleteJobConfirm(title, no, c_no) {
	let result = confirm('채용공고(' + title + ')를(을) 정말 삭제 하시겠습니까?');
	if (result){
		jQuery.ajax({
			url : "${pageContext.request.contextPath}/job/com/deleteJobConfirm/"+no,
			type : "GET",
			dataType:"json",
			contentType : 'application/json; charset=utf-8', // 서버로 데이터를 보내는 형식
			success : function(rdata) {
				console.log("찍혔냐ok"+rdata.ok)
				if (rdata.ok==1) {
					allList(c_no);
				} 
			},
			error : function(error) {
				alert(error)
			}
		})
	}
}




</script>

    