package se.iuh.edu.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import se.iuh.edu.entity.SanPham;
import se.iuh.edu.entity.TaiKhoan;


public class TaiKhoanDAO {

	@Autowired
	JdbcTemplate template;
	
	
	
	public JdbcTemplate getTemplate() {
		return template;
	}



	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}



	public List<TaiKhoan> getAllTK(){
		return template.query("select * from TaiKhoan",new RowMapper<TaiKhoan>() {

			@Override
			public TaiKhoan mapRow(ResultSet rs, int rowNum) throws SQLException {
			
				TaiKhoan tk = new TaiKhoan(rs.getString(1),rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
				return tk;
			}
			
		});
	}
	
	public List<TaiKhoan> getAllTKKH(){
		return template.query("select * from TaiKhoan where loaiTK != 'Nhan Vien'",new RowMapper<TaiKhoan>() {

			@Override
			public TaiKhoan mapRow(ResultSet rs, int rowNum) throws SQLException {
			
				TaiKhoan tk = new TaiKhoan(rs.getString(1),rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
				return tk;
			}
			
		});
	}
		
	public List<TaiKhoan> ktDangNhap(String email,String pass ) {
		String sql = "select * from TaiKhoan where email='"+email+"' and matKhau='"+pass+"'";
		return template.query(sql,new RowMapper<TaiKhoan>() {

			@Override
			public TaiKhoan mapRow(ResultSet rs, int rowNum) throws SQLException {
			
				TaiKhoan tk = new TaiKhoan(rs.getString(1),rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
				return tk;
			}
			
		});
	}
	
	public boolean insertTK(TaiKhoan tk) {
		String sql="insert into TaiKhoan(maTK,email,matKhau,ten,diaChi,sdt,loaiTK) values('"+tk.getMaTK()
																						+"','"+tk.getEmail()
																						+"','"+tk.getMatKhau()
																						+"',N'"+tk.getTen()
																						+"','"+tk.getDiaChi()
																						+"','"+tk.getSdt()
																						+"','"+tk.getLoaiTK()+"')";
		return template.update(sql)>0;
	}
	
	public boolean updateTK(TaiKhoan tk) {
		String sql="Update TaiKhoan set email='"+tk.getEmail()
									+"',matKhau='"+tk.getMatKhau()
									+"',ten=N'"+tk.getTen()
									+"',diaChi=N'"+tk.getDiaChi()
									+"',sdt='"+tk.getSdt()
									+"',loaiTK='"+tk.getLoaiTK()
									+"' where maTK='"+tk.getMaTK()+"'";
																					
		return template.update(sql)>0;
	}
}
