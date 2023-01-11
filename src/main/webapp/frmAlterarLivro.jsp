<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP Page</title>
</head>
<body>
<form action="alterarLivro.jsp" method="POST">
	
	<label>Codigo do Livro:</label> <br>
	<input type="text" name="id" valeu="<%=request.getParameter("id")%>"> <br>
	
	<label>Nome do Livro:</label> <br>
	<input type="text" name="nome" valeu="<%=request.getParameter("nome")%>"> <br>
	
	<button type="submit">Alterar</button>
	
	</form>
</body>
</html>