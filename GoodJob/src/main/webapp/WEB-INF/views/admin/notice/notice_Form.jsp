<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js" integrity="sha512-jGsMH83oKe9asCpkOVkBnUrDDTp8wl+adkB2D+//JtlxO4SrLoJdhbOysIFQJloQFD+C4Fl1rMsQZF76JjV0eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<meta charset="EUC-KR">
<title>�������� �ۼ�</title>

<link href="<c:url value='/resources/css/admin/notice/notice_Form.css' />" rel="stylesheet" type="text/css">

</head>
<body>

<jsp:include page="../../include/header.jsp" />
	<jsp:include page="../../include/nav.jsp"></jsp:include>

	<h2>�������� �ۼ�</h2>
	<form action="<c:url value = '/admin/notice/createNotice' />" method="post" name="modify_notice_form">
	<input type="text" name="n_title" placeholder="����"> <br>
	<textarea name="n_article" placeholder="����" ></textarea>
	
	<input type="submit" value="�ۼ��Ϸ�" >
	<input type="reset" value="�ۼ����">
	
	</form>
	

<jsp:include page="../../include/footer.jsp" />


</body>
</html>