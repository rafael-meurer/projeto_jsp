<% 
	try{
		//Obter a mensagem
		String mensagem = request.getParameter("mensagem");
	
		//Escolha
		
		switch(mensagem){
		case "falhaCriarConta":
			out.print("<div class='alert alert-danger'>Falha ao criar a conta, tente novamente</div>");
		break;
		
		case "falhaLogin":
			out.print("<div class='alert alert-danger'>Falha ao fazer login, tente novamente</div>");
		break;
		
		case "usuarioIncorreto":
			out.print("<div class='alert alert-danger'>Usuário ou senhas incorreto</div>");
		break;
		
		case "sessaoExpirada":
			out.print("<div class='alert alert-danger'>Você precisa estar logado para acessar esta página</div>");
		break;
		
		case "usuarioCriado":
			out.print("<div class='alert alert-success'>Usuário criado com sucesso</div>");
		break;
		
		case "dadosIncorretos":
			out.print("<div class='alert alert-danger'>Usuário ou senha Incorretas</div>");
		break;
		
		case "produtoCadastrado":
			out.print("<div class='alert alert-success'>Produto cadastrado com sucesso</div>");
		break;
		
		case "produtoFalha":
			out.print("<div class='alert alert-danger'>Falha ao Cadastrar Produto</div>");
		break;		
		
		case "produtoExcluido":
			out.print("<div class='alert alert-success'>Produto Excluido com sucesso</div>");
		break;
		
		case "produtoFalhaExcluir":
			out.print("<div class='alert alert-danger'>Falha ao Excluir Produto</div>");
		break;	
		
		case "produtoAlterado":
			out.print("<div class='alert alert-success'>Produto Alterado com sucesso</div>");
		break;
		
		case "produtoFalhaAlterar":
			out.print("<div class='alert alert-danger'>Falha ao Alterar Produto</div>");
		break;	
		
		case "sair":
			out.print("<div class='alert alert-success'>Deslogado com sucesso</div>");
		break;
		}
	}catch(Exception erro){}
%>