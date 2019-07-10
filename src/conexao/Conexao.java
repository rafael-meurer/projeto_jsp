package conexao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

	//Atributo de conex�o
	public static Connection conexao;
	
	//Iniciar a conex�o
	public static void obterConexao() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conexao = DriverManager.getConnection("jdbc:mysql://localhost/01projeto", "root", "");
		

		}catch(Exception erro) {
			System.out.println("Falha ao conectar "+erro.getMessage());
		}
		
	}
	
	public static void finalizarConexao() {
		try {
			conexao.close();
		}catch(Exception erro) {}
	}
}
