package se.iuh.edu.entity;

import java.io.Serializable;

public class ChiTietHoaDon implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4105131419204991134L;
	
	private String maSP;
	private String maHD;
	private int soLuong;
	public String getMaSP() {
		return maSP;
	}
	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}
	public String getMaHD() {
		return maHD;
	}
	public void setMaHD(String maHD) {
		this.maHD = maHD;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public ChiTietHoaDon(String maSP, String maHD, int soLuong) {
		super();
		this.maSP = maSP;
		this.maHD = maHD;
		this.soLuong = soLuong;
	}
	public ChiTietHoaDon() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ChiTietHoaDon [maSP=" + maSP + ", maHD=" + maHD + ", soLuong=" + soLuong + "]";
	}
	
	


}
