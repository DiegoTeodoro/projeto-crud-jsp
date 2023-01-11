package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.SingleConnection;
import model.Livro;

public class LivroDao {

	private Connection connection;

	public LivroDao() {

		connection = SingleConnection.getConnection();
	}

	public void salvarLivro(Livro livro) {

		try {
			String sql = " insert into livro(nome) values (?)";
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, livro.getNome());
			pst.execute();
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}

	}

	public List<Livro> pesquisarLivros() throws SQLException {
		List<Livro> list = new ArrayList<>();
		String sql = "select * from livro";

		PreparedStatement pst = connection.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();

		while (rs.next()) {
			Livro livro = new Livro();
			livro.setId(rs.getLong("id"));
			livro.setNome(rs.getString("nome"));

			list.add(livro);
		}

		return list;
	}

	public void excluirLivro(Livro livro) {

		try {
			String sql = "delete from livro where id = ?";
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setLong(1, livro.getId());
			pst.execute();
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}

	public void alterarLivro(Livro livro) {
		try {
			String sql = "update livro set nome = ? where id = " + livro.getId();
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, livro.getNome());
			
			pst.execute();
			connection.commit();
		} catch (Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}

}
