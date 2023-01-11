<%@page import="dao.LivroDao"%>
<%@page import="model.Livro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Excluir Livro</title>
</head>
<body>
<%
	try {
		Livro livro = new Livro();
		livro.setId(Long.parseLong(request.getParameter("id")));

		LivroDao livroDao = new LivroDao();
		livroDao.excluirLivro(livro);

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	
</body>
</html>