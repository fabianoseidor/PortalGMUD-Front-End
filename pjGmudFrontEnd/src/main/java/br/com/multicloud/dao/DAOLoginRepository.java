package br.com.multicloud.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.multicloud.connection.SingleConnectionBanco;
import br.com.multicloud.modal.ModelLogin;


public class DAOLoginRepository {

	private Connection conexao;
	
	
	public DAOLoginRepository() {
		this.conexao = SingleConnectionBanco.getConnection();
	}
	
	public void atualizaSenhaPrimeiroAcesso( String novaSenha, String Login ) throws SQLException {
		String sqlUp = "UPDATE COLABORADORES SET SENHA = ?, PRIMEIRO_ACESSO = 1 WHERE LOGIN = ?" ;
	
		PreparedStatement prepareSql = conexao.prepareStatement( sqlUp );
		
		prepareSql.setString( 1, novaSenha ); // ID_FAMILIA_FLAVORS
		prepareSql.setString( 2, Login     ); // TAMANHO_DISCO
	
		prepareSql.executeUpdate();
		conexao.commit();

	}
	
	public void atualizaSenha( String novaSenha, String Login ) throws SQLException {
		String sqlUp = "UPDATE COLABORADORES SET SENHA = ? WHERE LOGIN = ?" ;
	
		PreparedStatement prepareSql = conexao.prepareStatement( sqlUp );
		
		prepareSql.setString( 1, novaSenha ); // ID_FAMILIA_FLAVORS
		prepareSql.setString( 2, Login     ); // TAMANHO_DISCO
	
		prepareSql.executeUpdate();
		conexao.commit();

	}
	
	public ModelLogin ValidaLogin(String login, String senha)throws SQLException {
		
		ModelLogin modellogin = null;
		
		String sql = "SELECT                                              "
				   + "        id_colaboradores                            "
				   + "      , nome                                        "
				   + "      , id_cargo                                    "
				   + "      , cep                                         "
				   + "      , endereco                                    "
				   + "      , bairro                                      "
				   + "      , numero                                      "
				   + "      , complemento                                 "
				   + "      , cidade                                      "
				   + "      , estado                                      "
				   + "      , pais                                        "
				   + "      , cpf                                         "
				   + "      , telefone                                    "
				   + "      , celular                                     "
				   + "      , email                                       "
				   + "      , login                                       "
				   + "      , senha                                       "
				   + "      , fotouser                                    "
				   + "      , useradmin                                   "
				   + "      , primeiro_acesso                             "
				   + "FROM dbo.COLABORADORES WHERE LOGIN = ? AND SENHA = ?" ;
		
		PreparedStatement statement = conexao.prepareStatement(sql);
        
		statement.setString(1, login );
        statement.setString(2, senha );

		ResultSet resut = statement.executeQuery();
	//	modelLogin.setLogin(login);
	//	modelLogin.setSenha(senha);
		if(resut.next()) {
			modellogin = new ModelLogin();
			modellogin.setId_colaboradores( resut.getLong  ("id_colaboradores") );
			modellogin.setNome            ( resut.getString("nome"            ) );
			modellogin.setId_cargo        ( resut.getLong  ("id_cargo"        ) );
			modellogin.setCep             ( resut.getString("cep"             ) );
			modellogin.setEndereco        ( resut.getString("endereco"        ) );
			modellogin.setBairro          ( resut.getString("bairro"          ) );
			modellogin.setNumero          ( resut.getString("numero"          ) );
			modellogin.setComplemento     ( resut.getString("complemento"     ) );
			modellogin.setCidade          ( resut.getString("cidade"          ) );
			modellogin.setEstado          ( resut.getString("estado"          ) );
			modellogin.setPais            ( resut.getString("pais"            ) );
			modellogin.setCpf             ( resut.getString("cpf"             ) );
			modellogin.setTelefone        ( resut.getString("telefone"        ) );
			modellogin.setCelular         ( resut.getString("celular"         ) );
			modellogin.setEmail           ( resut.getString("email"           ) );
			modellogin.setLogin           ( login                               );
			modellogin.setSenha           ( senha                               );
			modellogin.setUseradmin       ( resut.getString("useradmin"       ) );
			modellogin.setFotouser        ( resut.getString("fotouser"        ) );
			modellogin.setPrimeiro_acesso ( resut.getInt   ("primeiro_acesso" ) );
		}
	    
		return modellogin;
	}
	
	
	
	public String getNomeDataBase( )  {
		try {	
			   String sql = "SELECT DB_NAME() AS NOME_DATABESE";
			   PreparedStatement prepareSql = conexao.prepareStatement(sql);
			   ResultSet resultado = prepareSql.executeQuery();
				while (resultado.next()) return " - [" + resultado.getString("NOME_DATABESE") + "]";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			return null;
		
		}
	

	public List<ModelLogin> getSelectLogin( )throws SQLException {
		
		List<ModelLogin> modellogins = new ArrayList<ModelLogin>();
		
		String sql = "SELECT ID_COLABORADORES, LOGIN  FROM COLABORADORES" ;
		
		PreparedStatement statement = conexao.prepareStatement(sql);
		ResultSet resut = statement.executeQuery();
		while(resut.next()) {
			ModelLogin modellogin = new ModelLogin();
			modellogin.setId_colaboradores( resut.getLong  ( "ID_COLABORADORES" ) );
			modellogin.setLogin           ( resut.getString( "LOGIN"            ) );
			
			modellogins.add(modellogin);
		}
	    
		return modellogins;
	}

	
	
	
	
}
