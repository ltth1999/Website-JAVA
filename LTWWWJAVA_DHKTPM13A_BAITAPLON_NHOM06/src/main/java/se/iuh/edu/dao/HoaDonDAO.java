package se.iuh.edu.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import se.iuh.edu.entity.HoaDon;


public class HoaDonDAO {

	@Autowired
	JdbcTemplate template;
	
	
	
	public JdbcTemplate getTemplate() {
		return template;
	}



	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}



	public List<HoaDon> getAllHD(){
		return template.query("select * from HoaDon",new RowMapper<HoaDon>() {

			@Override
			public HoaDon mapRow(ResultSet rs, int rowNum) throws SQLException {
			
				HoaDon hd = new HoaDon(rs.getString(1).trim(),rs.getDouble(2),rs.getDate(3));				
				return hd;
			}
			
		});
	}
	public List<HoaDon> getAllHDByTK(String maTK){
		return template.query("select * from HoaDon where maTK='"+maTK+"'",new RowMapper<HoaDon>() {

			@Override
			public HoaDon mapRow(ResultSet rs, int rowNum) throws SQLException {
			
				HoaDon hd = new HoaDon(rs.getString(1).trim(),rs.getDouble(2),rs.getDate(3));				
				return hd;
			}
			
		});
	}
	
	public List<HoaDon> getHDByTK(String maTK){
		return template.query("select * from SanPham where maTK='"+maTK+"'",new RowMapper<HoaDon>() {

			@Override
			public HoaDon mapRow(ResultSet rs, int rowNum) throws SQLException {
			
				HoaDon hd = new HoaDon(rs.getString(1).trim(),rs.getDouble(2),rs.getDate(3));				
				return hd;
			}
			
		});
	}
	
	
	public boolean insertHD(HoaDon hd,String maTK) {
		String sql = "insert into HoaDon(maHD,tongTien,ngayTT,maTK) values('"+hd.getMaHD()+"',"+hd.getTongTien()+",'"+new java.sql.Date(hd.getNgayTT().getTime())+"','"+maTK+"')";
		return template.update(sql)>0;	
	}
	
	
}
