package se.iuh.edu.entity;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class HoaDon implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7992850464018499399L;
	private String maHD;
	private double tongTien;
	private Date ngayTT;
	private TaiKhoan tk;
	private List<ChiTietHoaDon> cthd;
	public String getMaHD() {
		return maHD;
	}
	public void setMaHD(String maHD) {
		this.maHD = maHD;
	}
	public double getTongTien() {
		return tongTien;
	}
	public void setTongTien(double tongTien) {
		this.tongTien = tongTien;
	}
	public Date getNgayTT() {
		return ngayTT;
	}
	public void setNgayTT(Date ngayTT) {
		this.ngayTT = ngayTT;
	}
	public TaiKhoan getTk() {
		return tk;
	}
	public void setTk(TaiKhoan tk) {
		this.tk = tk;
	}
	public List<ChiTietHoaDon> getCthd() {
		return cthd;
	}
	public void setCthd(List<ChiTietHoaDon> cthd) {
		this.cthd = cthd;
	}
	public HoaDon(String maHD, double tongTien, Date ngayTT) {
		super();
		this.maHD = maHD;
		this.tongTien = tongTien;
		this.ngayTT = ngayTT;
	}
	public HoaDon() {
		super();
	}
	
	
}
