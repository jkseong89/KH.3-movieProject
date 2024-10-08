<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
	<style type="text/css">
	.error{
		color : red;
	}
	.error.id-ok{
		color : green;
	}
	.task {
		margin-top: 60px;
		margin-bottom: 20px;
	}
	</style>
</head>
<body>	
	<h1>회원가입</h1>
	<div class="task">
		<form action="<c:url value="/guest/signup"/>" method="post" id="form">
			<div class="form-group">
				<label for="id">아이디:</label>
				<input type="text" class="form-control" id="id" name="me_id">
			</div>
			<div class="form-group">
				<label for="pw">비번:</label>
				<input type="password" class="form-control" id="pw" name="me_pw">
			</div>
			<div class="form-group">
				<label for="pw2">비번 확인:</label>
				<input type="password" class="form-control" id="pw2" name="me_pw2">
			</div>
			<button type="submit" class="btn btn-outline-success col-12">회원가입</button>
		</form>
	</div>
	<script type="text/javascript">
	var flag = false;
	
	$('#form').validate({
		rules : {
			me_id : {
				required : true,
				regex : /^\w{4,15}$/
			},
			me_pw : {
				required : true,
				regex : /^[a-zA-Z0-9!@#$]{4,255}$/
			},
			me_pw2 : {
				equalTo : pw
			}
		},
		messages : {
			me_id : {
				required : '필수 항목입니다.',
				regex : '아이디는 영어, 숫자만 가능하며, 4~15자이어야 합니다.'
			},
			me_pw : {
				required : '필수 항목입니다.',
				regex : '아이디는 영어, 숫자, 특수문자(!@#$)만 가능하며, 4~255자이어야 합니다.'
			},
			me_pw2 : {
				equalTo : '비번과 일치하지 않습니다.'
			}
		},
		submitHandler : function(){
			var id = $("#id").val();
			var res = checkId(id);
			if(res == 0){
				displayCheckId(res);
				alert('이미 사용 중인 아이디입니다.');
				return false;
			}
			return true;
		}
	});
	$.validator.addMethod('regex', function(value, element, regex){
		var re = new RegExp(regex);
		return this.optional(element) || re.test(value);
	}, "정규표현식을 확인하세요.");
	
	</script>
</body>
</html>