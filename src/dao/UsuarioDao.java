package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.JOptionPane;

import bean.Usuario;
import conexao.Conexao;

public class UsuarioDao {

	//Cadastrar usuário
	public static boolean cadastrar(String nome, String email, String senha) {
		
		//SQL
		String sql= "INSERT INTO usuarios (nomeUsuario, emailUsuario, senhaUsuario) VALUES (?,?,MD5(?))";
		
		//Validar ação
		boolean valida = false;
		
		//iniciar conexão
		Conexao.obterConexao();
		
		//Tentativa
		try {
			
			PreparedStatement pstmt = Conexao.conexao.prepareStatement(sql);
			pstmt.setString(1, nome);
			pstmt.setString(2, email);
			pstmt.setString(3, senha);
			pstmt.execute();
			pstmt.close();
			valida = true;
			
		}catch(Exception erro) {
			System.out.println("Falha ao cadastrar o usuario: "+erro.getMessage());
			
		}finally {
			
			Conexao.finalizarConexao();
		}
		
		
		
		//retorno
		return valida;
		
	}

	//Verificar e-mail e senha
	public static int verificarUsuario(String email, String senha) {
		
		//SQL
		String sql = "SELECT COUNT(*) FROM usuarios WHERE emailUsuario=? AND senhaUsuario=MD5(?)";
		
		//Contar registros
		int contador = 0;
				
		Conexao.obterConexao();
		
		//Tentativa
		
		try {
			
			PreparedStatement pstmt = Conexao.conexao.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, senha);
			
			ResultSet rs = pstmt.executeQuery();
			
			rs.last();
			
			contador = rs.getInt(1);
			
			rs.close();
			pstmt.close();
		
			
		}catch(Exception erro) {
			System.out.println("ERRO CONEXÃO"+erro.getMessage());
		}finally {
			Conexao.finalizarConexao();
		}
				
		return contador;
		
		
	}

	//Criar um objeto Bean
	public static Usuario objUsuario(String email, String senha) {
		
		String sql = "SELECT * FROM usuarios WHERE emailUsuarios=? AND senhaUsuario=?";
		
		//Objeto da classe Bean
		Usuario obj = new Usuario();
		
		//Conexão
		Conexao.obterConexao();
		
		try {
		
			PreparedStatement pstmt = Conexao.conexao.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, senha);

			ResultSet rs = pstmt.executeQuery();
			rs.last();
			
			obj.setIdUsuario(rs.getInt(1));
			obj.setNomeUsuario(rs.getString(2));
			obj.setEmailUsuario(rs.getString(3));
			obj.setSenhaUsuario(rs.getString(4));
			
			rs.close();
			pstmt.close();
			
		}catch(Exception erro) {
			
		}finally {
			Conexao.finalizarConexao();
		}
		
		return obj;
	}
}
