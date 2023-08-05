<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">

	<h6>간편가입</h6>
	<button>카카오톡으로 가입하기</button>
	<button>네이버로 가입하기</button>
	<button>구글로 가입하기</button>
	
	
	<h6>이메일 회원가입</h6>
	<form>
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Email
				address</label> <input type="email" class="form-control"
				id="exampleInputEmail1" aria-describedby="emailHelp">
			<div id="emailHelp" class="form-text">We'll never share your
				email with anyone else.</div>
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">Password</label>
			<input type="password" class="form-control"
				id="exampleInputPassword1">
			<div id="passwordHelpBlock" class="form-text">Your password
				must be 8-20 characters long, contain letters and numbers, and must
				not contain spaces, special characters, or emoji.</div>
		</div>
		<div class="mb-3 form-check">
			<input type="checkbox" class="form-check-input" id="exampleCheck1">
			<label class="form-check-label" for="exampleCheck1">Check me
				out</label>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>