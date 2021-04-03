package se.iuh.edu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import se.iuh.edu.dao.GioHangDAO;
import se.iuh.edu.dao.SanPhamDAO;
import se.iuh.edu.entity.GioHang;
import se.iuh.edu.entity.SanPham;

@Controller
public class GioHangController {

	@Autowired
	SanPhamDAO spdao;
	
	@RequestMapping("/themcart/{id}")
	public String themCart(@PathVariable String id,HttpServletRequest request) {
		HttpSession session = request.getSession();
		int sl = Integer.parseInt(request.getParameter("soluongmua").trim());
		GioHangDAO cartdao = null;
		SanPham sp = spdao.getSPByID(id);
		Object objCartBean = session.getAttribute("cart");
		if(objCartBean != null) {
			cartdao = (GioHangDAO) objCartBean;
		}else {
			
			cartdao = new GioHangDAO();
			session.setAttribute("cart",cartdao);
		}
		ArrayList<GioHang> list = cartdao.getAllCardItem();
		int i=1;
		for(GioHang cd : list) {
			if(cd.getMaSP().trim().equals(id)) {
				cartdao.updateCardItem(i+"", (sl+cd.getSlmua())+"");
				i=0;
				break;
			}else i++;
		}
		if(i!=0) {
			cartdao.addCardItem(sp.getMaSP().trim(),
								sp.getTenSP().trim(),
								sp.getGia()+"",
								sl+"",
								sp.getImage(),
								sp.getSoLuongTon()+"");
		}
		return "giohang";
	}
	
	@RequestMapping("/changecart/{id}")
	public String updateCart(HttpServletRequest request, @PathVariable String id) {
		HttpSession session = request.getSession();
		String soluong = request.getParameter("soluongmua").trim();
		if(soluong.equals("")) {
			session.setAttribute("upsl","chuanhap");
			return "giohang";
		}
		String slton = request.getParameter("slton").trim();
		String action = request.getParameter("action").trim();
		GioHangDAO carddao = null;
		
		Object objCardBean = session.getAttribute("cart");
		
		if(objCardBean != null) {
			carddao = (GioHangDAO) objCardBean;
		}else {
			carddao = new GioHangDAO();
		}
		int x=1;
		for(GioHang cd : carddao.getAllCardItem()) {
			if(id.trim().equals(cd.getMaSP().trim())) {
				break;
			}
			x+=1;
		}
		
		if(action.equals("Update")) {
			if(Integer.parseInt(slton)>=Integer.parseInt(soluong)) {
				carddao.updateCardItem(x+"", soluong);
			}else {
				session.setAttribute("upsl","thatbai");
			}
		}else if(action.equals("Delete")) {
			carddao.deleteCardItem(x+"");
		}
		return "giohang";
	}
	@RequestMapping("/giohang")
	public void giohang() {
		
	}
}
