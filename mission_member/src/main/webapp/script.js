function formCheck() {

	if(frm.id.value=="") {

		alert("아이디를 입력하세요");

		frm.id.focus();

		return false;

	}

	if(frm.pass.value=="") {

		alert("비밀번호를 입력하세요");

		frm.pass.focus();

		return false;

	}

}

 

function formCheckreg1() {

	if(frm.id.value=="") {

		alert("아이디를 입력하세요");

		frm.id.focus();

		return false;

	}

	if(frm.pass1.value=="")  {

		alert("비밀번호를 입력하세요");

		frm.pass1.focus();

		return false;

	}

	if(frm.pass2.value=="") {

		alert("비밀번호를 입력하세요");

		return false;

	}

	if(frm.pass1.value != frm.pass2.value) {

		alert("비밀번호가 서로 다릅니다");

		return false;

	}

}

 

function formCheckreg2() {

	if(frm.email.value=="") {

		alert("이메일을 입력하세요");

		frm.email.focus();

		return false;

	}

	if(frm.phone.value=="") {

		alert("번호를 입력하세요");

		frm.phone.focus();

		return false;

	}

	if(frm.birth.value=="") {

		alert("생년월일을 입력하세요");

		frm.birth.focus();

		return false;

	}

}