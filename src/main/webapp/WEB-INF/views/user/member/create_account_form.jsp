<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="<c:url value='/resources/css/common/common.css' />" rel="stylesheet" type="text/css">

<link href="<c:url value='/resources/css/user/create_account.css' />" rel="stylesheet" type="text/css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">

	function createAccountForm() {
		console.log('createAccountForm() CALLED!!');
		
		let form = document.create_account_form;
		
		if (form.u_id.value == '') {
			alert('아이디를 입력하세요.');
			form.u_id.focus();
			
		} else if (form.u_pw.value == '') {
			alert('비밀번호를 입력하세요.');
			form.u_pw.focus();
			
		} else if (form.u_pw_again.value == '') {
			alert('비밀번호를 다시 입력하세요.');
			form.u_pw_again.focus();
			
		} else if (form.u_pw.value != form.u_pw_again.value) {
			alert('비밀번호를 다시 확인해주세요.');
			form.u_pw.focus();
			
		} else if (form.u_name.value == '') {
			alert('이름을 입력하세요.');
			form.u_name.focus();
			
		} else if (form.u_rn.value == '') {
			alert('주민등록번호를 입력하세요.');
			form.u_rn.focus();
			
		} else if (form.u_email.value == '') {
			alert('이메일을 입력하세요.');
			form.u_email.focus();
			
		} else if (form.u_addr.value == '') {
			alert('주소를 입력하세요..');
			form.u_addr.focus();
			
		} else if (form.u_ph.value == '') {
			alert('전화번호를 입력하세요.');
			form.u_ph.focus();
			
		} else if (form.u_bd.value == '') {
			alert('생년월일을 입력하세요.');
			form.u_bd.focus();
			
		} else if (form.u_gender.value == '') {
			alert('성별을 입력해주세요.');
			form.u_gender.focus();
			
		} else if (form.u_focus_com.value == '') {
			alert('관심회사를 입력하세요.');
			form.u_focus_com.focus();
			
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
				<h3>개인 회원가입</h3>
			</div>
		
			<div class="create_account_form">
				<form action="<c:url value='/user/member/createAccountConfirm' />" name="create_account_form" method="post">
					<div><p>아이디</p><input type="text" name="u_id" placeholder="아이디를 입력하세요."> <br></div>
					<p id="idable"></p>
					<div><p>비밀번호</p><input type="password" name="u_pw" placeholder="비밀번호를 입력하세요."> <br></div>
					<div><p>비밀번호 재확인</p><input type="password" name="u_pw_again" placeholder="비밀번호를 다시 입력하세요."><br> </div>
					<p id="pwable"></p>
					<div><p>이름</p><input type="text" name="u_name" placeholder="이름을 입력하세요."> <br></div>
					<div><p>주민등록 번호</p><input type="text" name="u_rn" placeholder="주민등록번호를 입력하세요."> <br></div>
					<div><p>이메일</p><input type="email" name="u_email"	placeholder="이메일을 입력하세요." ><br></div>
					<div><p>주소</p><input type="text" name="u_addr"	placeholder="주소를 입력하세요." ><br></div>
					<div><p>휴대폰 번호</p><input type="text" name="u_ph"	placeholder="휴대폰 번호 '-'제외하고 입력하세요."> <br></div>
					<div><p>생년 월일</p><input type="text" name="u_bd"	placeholder="생년월일을 입력하세요."> <br></div>
					<div><p>성별</p><select name="u_gender">
						<option value="">성별을 입력하세요</option>
						<option value="M">Man</option>
						<option value="W">Woman</option>
					</select> <br></div>
					<div><p>관심 회사</p><input type="text" name="u_focus_com"	placeholder="관심회사를 입력하세요."> <br></div>
					
					<input type="button" class ="join" value="가입하기" onclick="createAccountForm();"> 
					<!-- <input type="reset" value="reset"> -->
					
				</form>
				
			</div>
			
			<%-- <div class="login">
				<a href="<c:url value='/user/member/loginForm' />">login</a>
			</div> --%>
		
		</div>
		
	</section>
	
	<jsp:include page="../../include/footer.jsp" />
	 
	 <script>
	    $.noConflict();
	    var jQ = jQuery;
	    jQ("input[name=u_pw_again]").on("input", function(){
	    	
	    	
	    	  let pw = jQ("input[name=u_pw]").val();
	    	  let pw2 = jQ(this).val();
// 	    	/*   if (pw != pw2) {
	    	    
// 	    	    jQ(this).parent().next().children().text("비밀번호가 같지 않습니다.");
// 	    	    jQ(this).parent().next().children().css({
// 	    	      color: "red",
// 	    	    });
// 	    	  } else {
	    	    
// 	    	    jQ(this).parent().next().children().text("비밀번호가 같습니다.");
// 	    	    jQ(this).parent().next().children().css({
// 	    	      color: "blue",
// 	    	    });
// 	    	  } */
	    	 if(pw!= pw2){
	    		 jQ("#pwable").text("비밀번호가 같지 않습니다.")
	    		 jQ("#pwable").css({color:"red"})
	    	 }else{
	    		 jQ("#pwable").text("비밀번호가 같습니다.")
	    		 jQ("#pwable").css({color:"blue"})
	    	 }
	    	 
	    })
	    
     	jQ("input[name=u_id]").on("input", function(){
			let amid = jQ(this).val();
			if (!amid) return;
			let form = { a_id : amid  }
			jQ.ajax({
				url:"${pageContext.request.contextPath}/user/member/idCheck/"+amid,
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