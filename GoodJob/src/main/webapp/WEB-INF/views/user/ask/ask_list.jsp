<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="team.pj.goodjob.user.member.UserMemberVo" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js" integrity="sha512-jGsMH83oKe9asCpkOVkBnUrDDTp8wl+adkB2D+//JtlxO4SrLoJdhbOysIFQJloQFD+C4Fl1rMsQZF76JjV0eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link href="<c:url value='/resources/css/user/ask/ask_list.css' />" rel="stylesheet" type="text/css">


</head>
<jsp:include page="../../include/header.jsp" />
	<jsp:include page="../../include/nav.jsp"></jsp:include>



<body>
  

<a href="<c:url value='/user/ask/goAskForm'/>">문의하기</a>
  

<table>
        <caption>문의사항</caption>
        <thead>
            <tr>
                <th>문의유형</th>
                <th>문의내용</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>확인</th>
            </tr>
        </thead>
        <tbody>
         <c:forEach var="item" items="${askVos}">
            <tr>
                <td>${item.a_part}</td>
                <td>${item.a_article}</td>
                <td>${item.a_email}</td>
                <td>${item.a_phone}</td>
                <td>
                    <a class="delete" href="<c:url value='/user/ask/deleteAskList?a_no=${item.a_no}'/>">삭제</a>
                      <c:url value="/user/ask/goDetails" var="detail_url">
							<c:param name="a_no" value="${item.a_no}"/>
							  <c:param name="a_u_no" value="${item.a_u_no}"/>
					  </c:url>
					<a class="view" href="${detail_url}">자세히보기</a>
                </td>
                
            </tr>
		</c:forEach>
           
        </tbody>
      
    </table>









<jsp:include page="../../include/footer.jsp" />





	
</body>
</html>