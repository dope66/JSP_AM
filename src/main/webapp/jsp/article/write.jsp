<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>
	<h1>게시물 작성</h1>
	<form action="doWrite" method="get">
	<div>
		제목 : <input name = "title" placeholder="제목을 입력해주세요" type="text" />
	</div>
	<div>
		내용 : <textarea name = "body" placeholder="내용을 입력해주세요" type="text" ></textarea>
	</div>
	<input type="submit" value="글쓰기"/>
	<button type="submit">
		작성
	</button>
	
	</form>
	<div><a href="list">list</a></div>
</body>
</html>