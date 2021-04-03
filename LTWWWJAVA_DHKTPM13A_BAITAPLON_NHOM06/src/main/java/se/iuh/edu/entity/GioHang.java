package se.iuh.edu.entity;

import java.io.Serializable;

public class GioHang implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2191474304255830670L;
	private String maSP;
	private String ten;
	private double dongia;
	private int slmua;
	private int slton;
	private String hinhAnh;
	private double tongTien;
	
	public String getMaSP() {
		return maSP;
	}
	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public double getDongia() {
		return dongia;
	}
	public void setDongia(double dongia) {
		this.dongia = dongia;
	}
	public int getSlmua() {
		return slmua;
	}
	public void setSlmua(int slmua) {
		this.slmua = slmua;
	}
	public double getTongTien() {
		return tongTien;
	}
	public void setTongTien(double tongTien) {
		this.tongTien = tongTien;
	}
	
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	
	public int getSlton() {
		return slton;
	}
	public void setSlton(int slton) {
		this.slton = slton;
	}
	public GioHang() {
		super();
	}
	public GioHang(String maSP, String ten, double dongia, int slmua, int slton, String hinhAnh, double tongTien) {
		super();
		this.maSP = maSP;
		this.ten = ten;
		this.dongia = dongia;
		this.slmua = slmua;
		this.slton = slton;
		this.hinhAnh = hinhAnh;
		this.tongTien = tongTien;
	}

}
