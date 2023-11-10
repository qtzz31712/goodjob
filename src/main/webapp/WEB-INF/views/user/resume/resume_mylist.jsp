<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

			
<table class="type08" border="1">
				<c:if test="${empty resumeVos }">
					<div class="empty_word">작성한 이력서가 없습니다.</div>
				</c:if>
			


			<thead>
				<tr class="index">
					<th scope="col">이력서 제목</th>
					<th scope="col">최종 수정일</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${resumeVos}">
					<tr class="list">
						<c:url value='/resume/user/detailResumeForm' var='detail_url'>
							<c:param name='r_u_no' value='${item.r_u_no}' />
						</c:url>
						<td scope="row"><a href="${detail_url}">${item.r_title}</a></td>
						<td>${item.r_mod_date}</td>


						<c:url value='/resume/modifyResumeForm' var='modify_url'>
							<c:param name='r_no' value='${item.r_no}' />
						</c:url>
						<td><button class="modify_resume" onclick="location.href='${modify_url}'" >이력서
								수정</button></td>
								
						<td><button class="delete_resume" onclick="deleteResume('${item.r_title}' , ${item.r_no} , ${item.r_u_no})">이력서
								삭제</button></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		
		<script>
		$.noConflict();
		var jQ = jQuery;
		function deleteResume(title, no, r_u_no) {
			   let result = confirm('이력서(' + title + ')를(을) 정말 삭제 하시겠습니까?');
			   if (result){
			      jQ.ajax({
			         url : "${pageContext.request.contextPath}/resume/deleteResumeConfirm/"+no+"/"+r_u_no,
			         type : "GET",
			         dataType:"json",
			         contentType : 'application/json; charset=utf-8', // 서버로 데이터를 보내는 형식
			         success : function(rdata) {
			            console.log(rdata.ok)
			            if (rdata.ok==1) {
			            	allList(r_u_no);
			            } 
			         },
			         error : function(error) {
			            alert(error)
			         }
			      })
			   }
			}


			function allList(r_u_no){
			   
			   jQ.ajax({
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