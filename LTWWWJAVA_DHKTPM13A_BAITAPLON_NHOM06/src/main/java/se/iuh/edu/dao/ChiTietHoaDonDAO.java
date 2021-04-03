package se.iuh.edu.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import se.iuh.edu.entity.ChiTietHoaDon;
import se.iuh.edu.entity.HoaDon;
import se.iuh.edu.entity.SanPham;


public class ChiTietHoaDonDAO {

	@Autowired
	JdbcTemplate template;
	
	
	
	public JdbcTemplate getTemplate() {
		return template;
	}



	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}



	public List<ChiTietHoaDon> getAllCTHD(){
		return template.query("select * from ChiTietHoaDon",new RowMapper<ChiTietHoaDon>() {

			@Override
			public ChiTietHoaDon mapRow(ResultSet rs, int rowNum) throws SQLException {
			
				ChiTietHoaDon cthd = new ChiTietHoaDon();
				cthd.setMaSP(rs.getString(1).trim());
				cthd.setMaHD(rs.getString(2).trim());
				cthd.setSoLuong(rs.getInt(3));
				return cthd;
			}
			
		});	
	}
	public List<ChiTietHoaDon> getAllCTHDByMaSP(String maSP){
		return template.query("select * from ChiTietHoaDon where maSP='"+maSP+"'",new RowMapper<ChiTietHoaDon>() {

			@Override
			public ChiTietHoaDon mapRow(ResultSet rs, int rowNum) throws SQLException {
			
				ChiTietHoaDon cthd = new ChiTietHoaDon();
				cthd.setMaSP(rs.getString(1).trim());
				cthd.setMaHD(rs.getString(2).trim());
				cthd.setSoLuong(rs.getInt(3));
				return cthd;
			}
			
		});
	}
	public boolean  insertCTHD(String maSP,String maHD, int slmua) {
		ChiTietHoaDon cthd = new ChiTietHoaDon(maSP, maHD, slmua);
		String sql="insert into ChiTietHoaDon(maSP,maHD,soLuong) values('"+cthd.getMaSP()+"','"+cthd.getMaHD()+"','"+cthd.getSoLuong()+"')";
	//	String sql="insert into ChiTietHoaDon(maSP,maHD,soLuong) values(maSP, maHD, slmua)";
		return template.update(sql)>0;
	}
}
