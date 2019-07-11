package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.Produto;
import conexao.Conexao;

public class ProdutoDao {
	
	//Cadastro
	public static boolean cadastrar(String produto, double valor) {
		
		String sql = "INSERT INTO produtos (nomeProduto, valorProduto) VALUES (? , ?)";
		
		//Validar
		boolean valida = false;
		
		//Conexão
		Conexao.obterConexao();
		
		try {
			
			PreparedStatement pstmt = Conexao.conexao.prepareStatement(sql);
			pstmt.setString(1, produto);
			pstmt.setDouble(2, valor);
			pstmt.execute();
			pstmt.close();
			
			valida = true;
			
		}catch(Exception erro) {
			
		}finally {
			Conexao.finalizarConexao();
		}
		
		return valida;
		
	}
	
	public static String selecionar(){
		
		//Estrutura
		String estrutura = "";
		
		String sql = "SELECT * FROM produtos";
		
		Conexao.obterConexao();
		
		try {
			
			Statement stmt = Conexao.conexao.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
		
			while(rs.next()) {		
			estrutura += "<tr>";
				estrutura += "<td>"+rs.getInt(1)+"</td>";
				estrutura += "<td>"+rs.getString(2)+"</td>";
				estrutura += "<td>"+rs.getString(3)+"</td>";
				estrutura += "<td><a href='produtos.jsp?idProduto="+rs.getInt(1)+"'class='btn btn-warning'>Alterar</a></td>";
				estrutura += "<td><a href='../requisicoes/excluirProduto.jsp?idProduto="+rs.getInt(1)+"' class=\"btn btn-danger\">Excluir</a></td>";		
			estrutura += "</tr>";
			}
			
		}catch(Exception erro) {
			System.out.println("Falha ao listar produtos"+erro.getMessage());
		}finally {
			Conexao.finalizarConexao();
		}
		//retoro
		return estrutura;
	}
	
	
	public static boolean excluir(int idProduto) {
		
		String sql = "DELETE FROM produtos WHERE idProduto=?";
		
		Conexao.obterConexao();
		
		boolean valida = false;
		
		try {
		PreparedStatement pstmt = Conexao.conexao.prepareStatement(sql);
		pstmt.setInt(1, idProduto);
		pstmt.execute();
		
		pstmt.close();
		
		valida = true;
		}catch(Exception erro) {
			
		}finally {
			Conexao.finalizarConexao();
		}
		
		return valida;
	}

	//Obter dados de um produto especifico 
	public static Produto selecionarProduto(int idProduto) {
		
		//Objeto da classe produto (Bean)
		Produto prod = new Produto();
		
		String sql = "SELECT * FROM produtos WHERE idProduto=?";
		
		Conexao.obterConexao();
		
		try {
			
			PreparedStatement pstmt = Conexao.conexao.prepareStatement(sql);
			pstmt.setInt(1, idProduto);
			
			ResultSet rs = pstmt.executeQuery();
			rs.last();
			
			prod.setIdProduto(rs.getInt(1));
			prod.setNomeProduto(rs.getString(2));
			prod.setValorProduto(rs.getDouble(3));
			
			pstmt.close();
			rs.close();
			
		} catch (SQLException e) {
			
			System.out.println("Falha ao obter o produto"+e.getMessage());
			
		}finally {
			Conexao.finalizarConexao();
		}
		
		return prod;
	}
	
	//Alterar
	
	public static boolean alterar(int idProduto, String nomeProduto, double valorProduto) {
		
		//Valida
		boolean valida = false;
		
		String sql = "UPDATE produtos SET nomeProduto = ?, valorProduto = ? WHERE idProduto = ?";
		
		Conexao.obterConexao();
		
		try {
		PreparedStatement pstmt = Conexao.conexao.prepareStatement(sql);
		pstmt.setString(1, nomeProduto);
		pstmt.setDouble(2, valorProduto);
		pstmt.setInt(3, idProduto);
		pstmt.execute();
		pstmt.close();
		
		valida = true;
		}catch(Exception e) {
			System.out.println("Erro sql"+e.getMessage());
		}finally {
			Conexao.finalizarConexao();
		}
		
		//Retorno
		return valida;
		
	}
}
