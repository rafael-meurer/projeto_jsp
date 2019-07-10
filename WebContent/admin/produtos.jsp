<!-- Incluir Topo -->
<%@page import="bean.Produto"%>
<%@page import="dao.ProdutoDao"%>
<%@ include file="topo.jsp" %>

	<!-- Tentar obter o idProduto via GET -->
	<%
		//Criar idProduto
		int idProduto = 0;
	
		Produto prod = null;
	
		//Tentar obter o idProduto
		try{
			idProduto = Integer.parseInt(request.getParameter("idProduto"));
			prod = ProdutoDao.selecionarProduto(idProduto);
		}catch(Exception erro){}
	%>
	
	<!-- Formulário -->
	<form class="formularioProduto" method="post" action="../requisicoes/<% if(idProduto == 0){out.print("cadastrarProdutos");}else{out.print("alterarProduto");} %>.jsp">
	
	<%@ include file="../mensagem.jsp" %>
		<%
			if(idProduto != 0){
				out.print("<input type=\"hidden\" value=\""+idProduto+"\" name=\"id\">");
			}
		%>
		<input type="text" placeholder="Produto" value="<%if(idProduto != 0){out.print(prod.getNomeProduto());} %>" class="form-control" name="produto">
		<input type="text" placeholder="Valor" value="<%if(idProduto != 0){out.print(prod.getValorProduto());} %>" class="form-control" name="valor">
		
		<%
			if(idProduto == 0){
				out.print("<input type=\"submit\" class=\"btn btn-primary\">");
			}else{
				out.print("<input type=\"submit\" class=\"btn btn-warning\" value=\"Alterar\">");
				out.print("<a href=\"produtos.jsp\" class=\"btn btn-secondary\" >Cancelar</a>");
			}
		%>
		
	</form>
	
	<!-- Tabela -->
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Código</th>
				<th>Produto</th>
				<th>Valor</th>
				<th>Alterar</th>
				<th>Excluir</th>
			</tr>
		</thead>
		
		<tbody>
		
		<% out.print(ProdutoDao.selecionar()); %>
		
		</tbody>
	</table>
</body>
</html>