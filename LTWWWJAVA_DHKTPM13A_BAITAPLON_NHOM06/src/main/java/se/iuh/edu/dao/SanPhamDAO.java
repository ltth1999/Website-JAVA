package se.iuh.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import se.iuh.edu.entity.SanPham;

@Repository
public class SanPhamDAO {
	@Autowired
	JdbcTemplate template;
	
	
	
	public JdbcTemplate getTemplate() {
		return template;
	}



	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}



	public List<SanPham> getAllSPLonHon0(){
		return template.query("select * from SanPham where soLuongTon > 0",new RowMapper<SanPham>() {

			@Override
			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
			
				SanPham sp = new SanPham();
				sp.setMaSP(rs.getString(1).trim());
				sp.setTenSP(rs.getString(2).trim());
				sp.setSoLuongTon(rs.getInt(3));
				sp.setMoTa(rs.getString(4).trim());
				sp.setImage(rs.getString(5).trim());
				sp.setLoaiSP(rs.getString(6).trim());
				sp.setGia(rs.getDouble(7));
				return sp;
			}
			
		});
	}
	public List<SanPham> getAllSP(){
		return template.query("select * from SanPham",new RowMapper<SanPham>() {

			@Override
			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
			
				SanPham sp = new SanPham();
				sp.setMaSP(rs.getString(1).trim());
				sp.setTenSP(rs.getString(2).trim());
				sp.setSoLuongTon(rs.getInt(3));
				sp.setMoTa(rs.getString(4).trim());
				sp.setImage(rs.getString(5).trim());
				sp.setLoaiSP(rs.getString(6).trim());
				sp.setGia(rs.getDouble(7));
				return sp;
			}
			
		});
	}
	
	public List<SanPham> getAllSPByLoai(String loaiSP){
		return template.query("select * from SanPham where loaiSP='"+loaiSP+"' and soLuongTon > 0",new RowMapper<SanPham>() {

			@Override
			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
			
				SanPham sp = new SanPham();
				sp.setMaSP(rs.getString(1).trim());
				sp.setTenSP(rs.getString(2).trim());
				sp.setSoLuongTon(rs.getInt(3));
				sp.setMoTa(rs.getString(4).trim());
				sp.setImage(rs.getString(5).trim());
				sp.setLoaiSP(rs.getString(6).trim());
				sp.setGia(rs.getDouble(7));
				return sp;
			}
			
		});
	}
	
	public List<SanPham> timKiemSP(String tim){
		return template.query("select * from SanPham where tenSP like N'%"+tim+"%'",new RowMapper<SanPham>() {

			@Override
			public SanPham mapRow(ResultSet rs, int rowNum) throws SQLException {
			
				SanPham sp = new SanPham();
				sp.setMaSP(rs.getString(1).trim());
				sp.setTenSP(rs.getString(2).trim());
				sp.setSoLuongTon(rs.getInt(3));
				sp.setMoTa(rs.getString(4).trim());
				sp.setImage(rs.getString(5).trim());
				sp.setLoaiSP(rs.getString(6).trim());
				sp.setGia(rs.getDouble(7));
				return sp;
			}
			
		});
	}
	
	
	public SanPham getSPByID(String maSP) {
		String sql = "select * from SanPham where maSP=?";
		return template.queryForObject(sql, new Object[] {maSP},new BeanPropertyRowMapper<SanPham>(SanPham.class));
	}
	
	public boolean insertSP(SanPham sp) {
		String sql="insert into SanPham(maSP,tenSP,soLuongTon,moTa,image,loaiSP,gia) values('"+sp.getMaSP()
																						+"',N'"+sp.getTenSP()
																						+"',"+sp.getSoLuongTon()
																						+",N'"+sp.getMoTa()
																						+"','"+sp.getImage()
																						+"','"+sp.getLoaiSP()
																						+"',"+sp.getGia()+")";
		return template.update(sql)>0;
	}
	
	public boolean updateSP(SanPham sp) {
		String sql="Update SanPham set tenSP=N'"+sp.getTenSP()
									+"',soLuongTon="+sp.getSoLuongTon()
									+",moTa=N'"+sp.getMoTa()
									+"',image='"+sp.getImage()
									+"',loaiSP='"+sp.getLoaiSP()
									+"',gia="+sp.getGia()
									+" where maSP='"+sp.getMaSP()+"'";
																					
		return template.update(sql)>0;
	}
	public boolean updateSL(String maSP,int sl) {
		String sql="Update SanPham set soLuongTon="+sl+" where maSP='"+maSP+"'";
																					
		return template.update(sql)>0;
	}
	public boolean deleteSP(String maSP) {
		String sql="Delete from SanPham where maSP='"+maSP+"'";
																					
		return template.update(sql)>0;
	}
}
