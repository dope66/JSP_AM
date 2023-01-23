<%@ page import= "java.util.List" %>
<%@ page import= "java.util.Map" %>
<%@ page import= "java.time.LocalDateTime" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<Map<String,Object>> articleRows = (List<Map<String,Object>>)request.getAttribute("articleRows");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시물 리스트</title>
</head>
<body>
<h1>board list </h1>
<ul>
	<li><%= (int)articleRows.get(0).get("id") %>,<%= (LocalDateTime)articleRows.get(0).get("regDate") %>,<%= (String)articleRows.get(0).get("title") %></li>
	<li><%= (int)articleRows.get(1).get("id") %>,<%= (LocalDateTime)articleRows.get(1).get("regDate") %>,<%= (String)articleRows.get(1).get("title") %></li>
	<li><%= (int)articleRows.get(2).get("id") %>,<%= (LocalDateTime)articleRows.get(2).get("regDate") %>,<%= (String)articleRows.get(2).get("title") %></li>
</ul>
<h1>board list v2 using for</h1>
<ul>
	<%for (int i = 0; i<3; i++) {%>
	<li><%= (int)articleRows.get(i).get("id") %>,<%= (LocalDateTime)articleRows.get(0).get("regDate") %>,<%= (String)articleRows.get(i).get("title") %></li>
	<%} %>
</ul>

<h1>board list v3 </h1>
<ul>
	<%
	for (int i = 0; i<3; i++) {
		Map<String, Object> articleRow = articleRows.get(i);
	%>
	<li><%= (int)articleRow.get("id") %>,<%= (LocalDateTime)articleRow.get("regDate") %>,<%= (String)articleRow.get("title") %></li>
	<%} %>
</ul>
<h1>board list v4 </h1>
<ul>
	<%
	for (int i = 0; i< articleRows.size(); i++) {
		Map<String, Object> articleRow = articleRows.get(i);
	%>
	<li><%= (int)articleRow.get("id") %>,<%= (LocalDateTime)articleRow.get("regDate") %>,<%= (String)articleRow.get("title") %></li>
	<%} %>
</ul>


<h1>board list v5 </h1>
<ul>
	<%
	for (Map<String, Object> articleRow : articleRows) {
		
	%>
	<li><%= (int)articleRow.get("id") %>,<%= (LocalDateTime)articleRow.get("regDate") %>,<%= (String)articleRow.get("title") %></li>
	<%} %>
</ul>
</body>
</html>

