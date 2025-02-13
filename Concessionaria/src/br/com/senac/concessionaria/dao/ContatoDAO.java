package br.com.senac.concessionaria.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.senac.concessionaria.modelo.Contato;
import br.com.senac.concessionaria.util.DAO;

public class ContatoDAO extends DAO {
private Connection conn;
	
	public ContatoDAO() {
		
	}
	
	public void gravar(List<Contato> contato) throws SQLException{
		
		
		abreConexao();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			
			for(Contato c : contato) {
				pstmt = conn.prepareStatement("insert into contato values(null, ?, ?)",  PreparedStatement.RETURN_GENERATED_KEYS);
				pstmt.setString(1, c.getTelefone());
				pstmt.setObject(2, c.getUsuario().getId_usuario());
				
			
		
			int flag = pstmt.executeUpdate();

			if(flag == 0) {
				throw new SQLException("Erro ao gravar no banco!");
				
			}else {
				rs = pstmt.getGeneratedKeys();
				rs.next();
				c.setId_contato(rs.getInt(1));
				
			}
		  }
		} finally {
			if(conn != null) {
				conn.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(rs != null) {
				rs.close();
			}
		}
		}
	
	public List<Contato> listar() throws SQLException{
		abreConexao();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from contato");
			rs = pstmt.executeQuery();
			
			List<Contato> contatos = new ArrayList<Contato>();
			while(rs.next()) {
				contatos.add(criaContato(rs));
			}
			return contatos;
			
		} finally {
			if(conn != null) {
				conn.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(rs != null) {
				rs.close();
			}
		}
		
	}
	
public List<Contato> busca(int id) throws SQLException {
		
		abreConexao();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from contato where id_contato = ?");
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			List<Contato> c = new ArrayList<>();
			while(rs.next()) {
				c.add(criaContato(rs));
				
				
				
			}
			
			return c;
		} finally {
			if(conn != null) {
				conn.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(rs != null) {
				rs.close();
			}
		}
	}

public void deletaContato(int id) throws SQLException {
	abreConexao();
	
	PreparedStatement pstmt = null;
	
	try {
		pstmt = conn.prepareStatement("delete from contato where id_contato = ?");
		pstmt.setInt(1, id);
		
		int flag = pstmt.executeUpdate();
		
		if(flag == 0) {
			throw new SQLException("Erro ao excluir o contato: " + id + " do banco!");
		}

	} finally {
		if(conn != null) {
			conn.close();
		}
		if(pstmt != null) {
			pstmt.close();
		}
	}
}


public void editarContato(Contato contato) throws SQLException {
	abreConexao();

	PreparedStatement pstmt = null;
	
	try {
		pstmt = conn.prepareStatement("update contato set telefone = ? where id_contato = ?");
		
		pstmt.setString(1, contato.getTelefone());
		pstmt.setInt(2, contato.getId_contato());
		
		int flag = pstmt.executeUpdate();
		
		if(flag == 0) {				
			throw new SQLException("Erro ao atualizar o contato: " + contato.getId_contato() + " no banco!");
		}
		
	} finally {
		if(conn != null) {
			conn.close();
		}
		if(pstmt != null) {
			pstmt.close();
		}
	}
}
		
	
	
	private void abreConexao() {
		try {
			conn = getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Erro ao tentar abrir a conex�o");
		}
	}
	
	private Contato criaContato(ResultSet rs) throws SQLException {
		Contato contato;
		contato = new Contato();
		contato.setId_contato(rs.getInt(1));
		contato.setTelefone(rs.getString(2));
		return contato;
	}
}
