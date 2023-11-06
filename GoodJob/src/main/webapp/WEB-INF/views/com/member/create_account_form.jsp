<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="<c:url value='/resources/css/common/common.css' />" rel="stylesheet" type="text/css">

<link href="<c:url value='/resources/css/com/create_account.css' />" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">



	function createAccountForm() {
		
		
	
		console.log('createAccountForm() CALLED!!');
	
		let form = document.create_account_form;
		
		if (form.c_id.value == '') {
			alert('아이디를 입력하세요.');
			form.c_id.focus();
			
		} else if (form.c_pw.value == '') {
			alert('비밀번호를 입력하세요.');
			form.c_pw.focus();
			
		} else if (form.c_pw_again.value == '') {
			alert('비밀번호를 다시 입력하세요.');
			form.c_pw_again.focus();
			
		} else if (form.c_pw.value != form.c_pw_again.value) {
			alert('비밀번호를 다시 확인해주세요.');
			form.c_pw.focus();
			
		} else if (form.c_comname.value == '') {
			alert('회사명을 입력하세요.');
			form.c_comname.focus();
			
		} else if (form.c_rn.value == '') {
			alert('사업자번호를 입력하세요.');
			form.c_rn.focus();
			
		} else if (form.c_email.value == '') {
			alert('이메일을 입력하세요.');
			form.c_email.focus();
			
		} else if (form.c_addr.value == '') {
			alert('주소를 입력하세요..');
			form.c_addr.focus();
			
		} else if (form.c_comph.value == '') {
			alert('대표 번호를 '-'제외하고 입력하세요.');
			form.c_comph.focus();
			
		} else if (form.c_hrname.value == '') {
			alert('인사담당자이름을 입력하세요.');
			form.c_hrname.focus();
			
		} else if (form.c_ceo_name.value == '') {
			alert('회사 대표를 입력하세요.');
			form.c_ceo_name.focus();
			
		} else {
			form.submit();
			
		}
		
	}


</script>

</head>
<body>

	<jsp:include page="../../include/header.jsp" />
	
	 
	<section>
		
		<div id="section_wrap">
			<div class="word">
				<h3>기업 회원가입</h3>
			</div>
			
			<div class="create_account_form">
				<form action="<c:url value='/com/member/createAccountConfirm' />" name="create_account_form" method="post">
					<div><p>아이디</p><input type="text" name="c_id" placeholder="아이디를 입력하세요."> <br></div>
					<p id="idable"></p>
					<div><p>비밀번호</p><input type="password" name="c_pw" placeholder="비밀번호를 입력하세요."> <br></div>
					<div><p>비밀번호 재확인</p><input type="password" name="c_pw_again" placeholder="비밀번호를 다시 입력하세요."> <br></div>
					<p id="pwable"></p>
					<div><p>회사명</p><input type="text" name="c_comname" placeholder="회사명을 입력하세요."> <br></div>
					<div><p>사업자등록 번호</p><input type="text" name="c_rn" placeholder="사업자 번호를 입력하세요."> <br></div>
					<div><p>이메일</p><input type="email" name="c_email"	placeholder="이메일을 입력하세요." ><br></div>
					<div><p>주소</p><input type="text" name="c_addr"	placeholder="주소를 입력하세요." ><br></div>
					<div><p>회사 번호</p><input type="text" name="c_comph"	placeholder="대표 번호를 '-'제외하고 입력하세요."> <br></div>
					<div><p>인사담당자 이름</p><input type="text" name="c_hrname"	placeholder="인사담당자이름을 입력하세요."> <br></div>
					
					<div><p>회사 대표</p><input type="text" name="c_ceo_name"placeholder="회사 대표를 입력하세요."> <br></div>
					
					<input type="button" class ="join" value="가입하기" onclick="createAccountForm();"> 
					
					
					<!-- <input type="reset" value="reset"> -->
					
				</form>
				
			</div>
			
			<%-- <div class="login">
				<a href="<c:url value='/com/member/loginForm' />">login</a>
			</div> --%>
		
		</div>
		
	</section>
	
 	<jsp:include page="../../include/footer.jsp" />
	 
	 <script>
	    $.noConflict();
	    var jQ = jQuery;
	    jQ("input[name=c_pw_again]").on("input", function(){
	    	
	    	
	    	  let pw = jQ("input[name=c_pw]").val();
	    	  let pw2 = jQ(this).val();
	    	  if(pw!= pw2){
		    		 jQ("#pwable").text("비밀번호가 같지 않습니다.")
		    		 jQ("#pwable").css({color:"red"})
		    	 }else{
		    		 jQ("#pwable").text("비밀번호가 같습니다.")
		    		 jQ("#pwable").css({color:"blue"})
		    	 }
	    	
	    })
	    
   		 jQ("input[name=c_id]").on("input", function(){
			let cmid = jQ(this).val();
			if (!cmid) return;
			let form = { c_id : cmid  }
			jQ.ajax({
				url:"${pageContext.request.contextPath}/com/member/idCheck/"+cmid,
				type : "GET",
				//data : JSON.stringify(form),   // { "a_m_id" : amid }
				dataType : "json",
				contentType : 'application/json; charset=utf-8',
				success : function(rdata){	   // { result : result }
					console.log(rdata.result)
					let result = rdata.result;
					if (result) {
						jQ("#idable").text("중복된 아이디입니다.")
						jQ("#idable").css({color:"red"})
					} else {
						jQ("#idable").text("가능한 아이디입니다.")
						jQ("#idable").css({color:"blue"})
						
					}
				},
				error : function(error){
					alert(error)
				}
			})
		})	 
		
	</script> 
</body>
</html>