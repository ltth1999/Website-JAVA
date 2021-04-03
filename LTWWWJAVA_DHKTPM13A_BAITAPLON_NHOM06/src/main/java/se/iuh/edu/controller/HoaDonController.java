package se.iuh.edu.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import se.iuh.edu.dao.*;
import se.iuh.edu.entity.*;
@Controller
public class HoaDonController {

	@Autowired
	HoaDonDAO hddao;
	
	@Autowired
	SanPhamDAO spdao;
	
	@Autowired
	ChiTietHoaDonDAO cthddao;
	@RequestMapping("/thanhtoan")
	public String thanhToan(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		GioHangDAO carddao = (GioHangDAO) session.getAttribute("cart");
		List<ChiTietHoaDon> listcthd = new ArrayList<ChiTietHoaDon>();
		TaiKhoan tk = (TaiKhoan) session.getAttribute("tk");
		if(tk==null) {
			return "login";
		}
		if(carddao != null && tk != null) {
			int m = hddao.getAllHD().size()+1;
			HoaDon hd = new HoaDon(m+"",carddao.getTongTienHD(),new Date());
			if(!hddao.insertHD(hd,tk.getMaTK().trim())) {
				return "giohang";
			}
			for(GioHang cd : carddao.getAllCardItem()) {
				spdao.updateSL(cd.getMaSP().trim(),cd.getSlton()-cd.getSlmua());
				int n=cthddao.getAllCTHD().size()+1;
				//ChiTietHoaDon cthd = new ChiTietHoaDon(n+"", cd.getSlmua());
				cthddao.insertCTHD(cd.getMaSP().trim(),hd.getMaHD().trim(), cd.getSlmua());
			}
			session.removeAttribute("cart");
			session.setAttribute("thanhtoan","thanhcong");
			return "giohang";
		}
		session.setAttribute("thanhtoan","thatbai");
		return "giohang";
	}
}
