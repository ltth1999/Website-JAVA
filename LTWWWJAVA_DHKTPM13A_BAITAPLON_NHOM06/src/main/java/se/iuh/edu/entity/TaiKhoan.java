package se.iuh.edu.entity;

import java.io.Serializable;

public class TaiKhoan implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5159370485594154426L;
	private String maTK;
	private String email;
	private String matKhau;
	private String ten;
	private String diaChi;
	private String sdt;
	private String loaiTK;
	public String getMaTK() {
		return maTK;
	}
	public void setMaTK(String maTK) {
		this.maTK = maTK;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getLoaiTK() {
		return loaiTK;
	}
	public void setLoaiTK(String loaiTK) {
		this.loaiTK = loaiTK;
	}
	
	public TaiKhoan() {
		super();
	}
	public TaiKhoan(String maTK, String email, String matKhau, String ten, String diaChi, String sdt, String loaiTK) {
		super();
		this.maTK = maTK;
		this.email = email;
		this.matKhau = matKhau;
		this.ten = ten;
		this.diaChi = diaChi;
		this.sdt = sdt;
		this.loaiTK = loaiTK;
	}
	
	
}
