function CheckAddArticle() {
	
	var articleId=document.getElementById("articleId");
	var name=document.getElementById("name");
	var description=document.getElementById("description");
	
	
	// 후기글 이름 체크
	if (name.value.length < 4 || name.value.length > 50) {
		alert("[도서명]\n최소 4자에서 최대 50자까지 입력하세요");
		name.focus();
		return false;
	}
	
	// 상세 설명 체크
	if (description.value.length < 100) {
		alert("[상세설명]\n최소 100자 이상 입력하세요");
		description.focus();
		return false;
	}
	
	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.focus();
		return false;
	}
	
	document.newArticle.submit()
}