<%@page import="model.Livro"%>
<%@page import="java.util.List"%>
<%@page import="dao.LivroDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista Livros</title>
</head>
<body>
<%
	try{
		
		LivroDao livroDao = new LivroDao();
		List<Livro> listar = livroDao.pesquisarLivros();
		
		for(int i =0; i<listar.size(); i++){
			out.print("Id: " + listar.get(i).getId());
			out.print(" Nome: " + listar.get(i).getNome() + "<br>");
			
			//foi criado o link que ele ira receber um id e o conteudo get
			out.print("<a href='frmExcluirLivro.jsp?id="
			+ listar.get(i).getId() + "&nome="
			+ listar.get(i).getNome() + "'> Excluir </a> ");
			
			out.print("<a href='frmAlterarLivro.jsp?id="
					+ listar.get(i).getId() + "&nome="
					+ listar.get(i).getNome() + "'> Alterar </a>");
			
			%><br><br><%
		}
		
	} catch(Exception e){
		e.printStackTrace();
	}
%>

</body>
</html>