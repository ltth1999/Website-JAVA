package se.iuh.edu.entity;

import java.io.Serializable;

public class SanPham implements Serializable{

	private String maSP;
	private String tenSP;
	private String loaiSP;
	private String moTa;
	private double gia;
	private int soLuongTon;
	private String image;
	public String getMaSP() {
		return maSP;
	}
	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}
	public String getTenSP() {
		return tenSP;
	}
	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}
	public String getLoaiSP() {
		return loaiSP;
	}
	public void setLoaiSP(String loaiSP) {
		this.loaiSP = loaiSP;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public double getGia() {
		return gia;
	}
	public void setGia(double gia) {
		this.gia = gia;
	}
	public int getSoLuongTon() {
		return soLuongTon;
	}
	public void setSoLuongTon(int soLuongTon) {
		this.soLuongTon = soLuongTon;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public SanPham() {
		super();
	}
	
	public SanPham(String maSP, String tenSP, String loaiSP, String moTa, double gia, int soLuongTon, String image) {
		super();
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.loaiSP = loaiSP;
		this.moTa = moTa;
		this.gia = gia;
		this.soLuongTon = soLuongTon;
		this.image = image;
	}
	
	
}
