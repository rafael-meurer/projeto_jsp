<%@page import="bean.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	try{
	//Verificar se existe sessão
	Usuario sessao = (Usuario) session.getAttribute("sessao_usuario");
	
	if(sessao == null){
		response.sendRedirect("../index.jsp?mensagem=sessaoExpirada");
	}
	
	}catch(Exception erroLogin){
		response.sendRedirect("../index.jsp?mensagem=sessaoExpirada");
	}
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Área Administrativa</title>
	
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="../css/estilos.css">
</head>
<body>
		<!-- Logo -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <a class="navbar-brand" href="#">ADMIN</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	<!-- Links -->
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Início</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="produtos.jsp">Produtos</a>
      </li>
      
        <li class="nav-item">
        <a class="nav-link" href="conta.jsp">Conta</a>        
      </li>
      
        <li class="nav-item">
        <a class="nav-link" href="sair.jsp">Sair</a>
      </li>
         </ul>
  </div>
</nav>
