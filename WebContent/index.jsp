<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Projeto 01</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<!-- CSS -->
	<link rel="stylesheet" href="css/estilos.css">
</head>

<body>

	<!-- Mensagem -->
	<%@ include file="mensagem.jsp" %>

	<!-- FomulÃ¡rios -->
	<section class="container-fluid formularioLogin">
		<div class="row">
		
			<!-- Cadastro -->
			<div class="col-md-6 col-12">
			<h1 class="card">Faça sua conta</h1>
				<form action="requisicoes/cadastrarUsuario.jsp" method="post">
					<input type="text" placeholder="Nome" name="nome" class="form-control">
					<input type="text" placeholder="E-mail" name="email" class="form-control">
					<input type="password" placeholder="Senha" name="senha1" class="form-control">
					<input type="password" placeholder="Repetir Senha" name="senha2" class="form-control">
					<input type="submit" placeholder="Criar conta" class="btn btn-primary">
				</form>
			
			</div>
			
			<!-- Login -->
			<div class="col-md-6 col-12">
			<h1 class="card">Acesse sua conta</h1>
				<form action="requisicoes/login.jsp" method="post">
					<input type="text" placeholder="E-mail" name="email" class="form-control">
					<input type="password" placeholder="Senha" name="senha" class="form-control">
					<input type="submit" placeholder="Acessar" class="btn btn-primary">
				</form>
			
			</div>
		</div>
	</section>

</body>
</html>