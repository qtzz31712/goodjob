%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<table>
	
	<thead>
		<tr>
			<th>글번호</th>
			<th>지역</th>
			<th>모집 제목</th>
			<th>급여</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty jobVos }">
			<div>등록된 채용공고가 없습니다.</div>
		</c:if>

		<c:forEach var="job" items="${jobVos}">
						
			<tr>
				<td>
					${job.rec_no}
				</td>
				<td>${job.rec_loc}</td>
				<td><c:url value='/job/detail' var='detail_url'>
						<c:param name='rec_no' value='${job.rec_no}'/>
					</c:url>
					<a href="${detail_url}">${job.rec_title }</a>
				</td>
				<td>${job.rec_pay}</td>
			</tr>
			
		</c:forEach>

	</tbody>
</table>
		