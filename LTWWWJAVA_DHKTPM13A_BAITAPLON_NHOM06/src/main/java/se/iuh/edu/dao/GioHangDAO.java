package se.iuh.edu.dao;

import java.util.ArrayList;

import se.iuh.edu.entity.GioHang;


public class GioHangDAO {
	private ArrayList<GioHang> allCardItems = new ArrayList<GioHang>();
	private double tongTienHD;
	
	public int getSLLoaiSPMua() {
		return allCardItems.size();
	}
	
	public void deleteCardItem(String vitrixoa) {
		int itemIndex=0;
		try {
			itemIndex = Integer.parseInt(vitrixoa);
			allCardItems.remove(itemIndex-1);
			tinhTongTienHD();
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}
	
	public void updateCardItem(String vitri,String soluongmua) {
		double tongTien = 0.0;
		double dongia = 0.0;
		int soluong = 0;
		int itemIndex = 0;
		GioHang cardItemBean = null;
		
		try {
			itemIndex = Integer.parseInt(vitri);
			soluong = Integer.parseInt(soluongmua);
			if(soluong>0) {
				cardItemBean = allCardItems.get(itemIndex-1);
				dongia=cardItemBean.getDongia();
				tongTien= soluong * dongia;
				cardItemBean.setSlmua(soluong);
				cardItemBean.setTongTien(tongTien);
				tinhTongTienHD();
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}
	public GioHang getCardItem(int itemIndex) {
		
		GioHang cardItemBean =  null;
		if(allCardItems.size()>itemIndex) {
			cardItemBean = allCardItems.get(itemIndex);
		}
		return cardItemBean;
	}
	public int getCardItemByMaSP(String maSP) {
		
		for(GioHang cd : allCardItems) {
			if(maSP.equals(cd.getMaSP().trim())) {
				return cd.getSlmua();
			}
		}
		return 0;
	}
	
	public ArrayList<GioHang> getAllCardItem(){
		return allCardItems;
	}
	
	public void setCardItems(ArrayList<GioHang> allCardItems) {
		this.allCardItems=allCardItems;
	}

	public double getTongTienHD() {
		return tongTienHD;
	}

	public void setTongTienHD(double tongTienHD) {
		this.tongTienHD = tongTienHD;
	}
	protected void tinhTongTienHD() {
		double tongTien=0.0;
		for(int i=0;i<allCardItems.size();i++) {
			GioHang cardItemBean = allCardItems.get(i);
			tongTien+=cardItemBean.getTongTien();
		}
		setTongTienHD(tongTien);
	}
	public void addCardItem(String maSP,String tenSP,String gia,String soluong,String hinhAnh,String slton) {
		double tongTien = 0.0;
		double  dongia= 0.0;
		int soluongso=0;
		GioHang cardItemBean = new GioHang();
		try {
			dongia = Double.parseDouble(gia);
			soluongso = Integer.parseInt(soluong);
			if(soluongso>0) {
				tongTien = dongia*soluongso;
				cardItemBean.setMaSP(maSP);
				cardItemBean.setTen(tenSP);
				cardItemBean.setDongia(dongia);
				cardItemBean.setSlmua(soluongso);
				cardItemBean.setHinhAnh(hinhAnh);
				cardItemBean.setTongTien(tongTien);
				cardItemBean.setSlton(Integer.parseInt(slton.trim()));
				allCardItems.add(cardItemBean);
				tinhTongTienHD();
			}
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}
}

