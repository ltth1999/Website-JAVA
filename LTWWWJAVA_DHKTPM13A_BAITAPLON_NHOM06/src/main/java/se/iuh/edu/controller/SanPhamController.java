package se.iuh.edu.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import se.iuh.edu.dao.*;
import se.iuh.edu.entity.*;

@Controller
public class SanPhamController {

	@Autowired
	SanPhamDAO spdao;
	@Autowired
	TaiKhoanDAO tkdao;
	@Autowired
	HoaDonDAO hddao;
	@Autowired
	ChiTietHoaDonDAO cthddao;

	
	@RequestMapping("/")
	public ModelAndView getDSSP() {
		List<SanPham> list = spdao.getAllSPLonHon0();
		return new ModelAndView("index","listsp",list);
	}
	@RequestMapping(value="/dssanpham/{loaiSP}")
	public ModelAndView getDSSPByLoaiSP(@PathVariable String loaiSP) {
		List<SanPham> list = spdao.getAllSPByLoai(loaiSP);
		return new ModelAndView("sanpham","listspbyloai",list);
	}
	@RequestMapping(value="/spbyid/{id}")
	public ModelAndView getSPByID(@PathVariable String id) {
		SanPham sp = spdao.getSPByID(id);
		return new ModelAndView("chitietsp","sp",sp);
	}
	@RequestMapping(value="/findsp")
	public ModelAndView findSP(HttpServletRequest request) {
		String tim = request.getParameter("tim").trim();
		List<SanPham> sp = spdao.timKiemSP(tim);
		return new ModelAndView("timsp","listsptim",sp);
	}
	@RequestMapping(value="/themsanpham")
	public String themSP(HttpServletRequest request,Model model) {
		model.addAttribute("dstk",tkdao.getAllTKKH());
		model.addAttribute("dshd",hddao.getAllHD());
		model.addAttribute("listsp",spdao.getAllSP());
		String ten = request.getParameter("ten").trim();
		String loaiSP = request.getParameter("loaisp").trim();
		double dongia = Double.parseDouble(request.getParameter("dongia").trim());
		String mota = request.getParameter("mota").trim();
		int sl = Integer.parseInt(request.getParameter("sl").trim());
		String image = request.getParameter("image").trim();
		List<SanPham> listsp = spdao.getAllSP();
		int x=1;
		for(SanPham sp1 :listsp) {
			int x1=Integer.parseInt(sp1.getMaSP().trim());
			if(x<x1) x=x1;
		}
		int n = x+1;
		HttpSession session = request.getSession();
		
		SanPham sp = new SanPham(n+"",ten,loaiSP, mota, dongia, sl, "/resources/images/"+image);
		
		if(spdao.insertSP(sp)) {
			model.addAttribute("listsp",spdao.getAllSP());
			session.setAttribute("addsp","thanhcong");
			return "admin";
		}else {
			session.setAttribute("addsp","thatbai");
			return "themsp";
		}
	}
	@RequestMapping(value="/themsp")
	public void themsp() {
	}
	@RequestMapping(value="/updatesanpham/{masp}")
	public String updateSP(@PathVariable String masp, Model model) {
		SanPham sp = spdao.getSPByID(masp);
		model.addAttribute("sp",sp);
		return "updateSP";
	}
	
	@RequestMapping(value="/updatesp/{masp}",method=RequestMethod.POST)
	public String sPDaUpdate(HttpServletRequest request,@PathVariable String masp,Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("dstk",tkdao.getAllTKKH());
		model.addAttribute("dshd",hddao.getAllHD());
		model.addAttribute("listsp",spdao.getAllSP());
		GioHangDAO cartdao = null;
		Object objCartBean = session.getAttribute("cart");
		if(objCartBean != null) {
			cartdao = (GioHangDAO) objCartBean;
			for(GioHang cd : cartdao.getAllCardItem()) {
				if(cd.getMaSP().trim().equals(masp)) {
					session.setAttribute("upsp","thatbai");
					return "admin";
				}
			}
		}else {
			
			cartdao = new GioHangDAO();
			session.setAttribute("cart",cartdao);
		}
		
		String tenSP = request.getParameter("ten").trim();
		double dongia = Double.parseDouble(request.getParameter("dongia").trim());
		int soluong = Integer.parseInt(request.getParameter("soluong").trim());
		String mota = request.getParameter("mota").trim();
		String image = "/resources/images/"+request.getParameter("image").trim();
		String imagecu = request.getParameter("imagecu").trim();
		if(image.equals("/resources/images/")) {
			image = imagecu;
		}
		String loaiSP = request.getParameter("loaisp").trim();
		
		SanPham sp = new SanPham(masp, tenSP,loaiSP, mota, dongia, soluong, image);
		
		if(spdao.updateSP(sp)) {
			model.addAttribute("listsp",spdao.getAllSP());
			session.setAttribute("upsp","thanhcong");
			return "admin";
		}else {
			session.setAttribute("upsp","thatbai");
			return "admin"; 
		}
		
	}
	
	@RequestMapping(value="/deletesp/{masp}",method=RequestMethod.GET)
	public String deleteSP(HttpServletRequest request,@PathVariable String masp,Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("dstk",tkdao.getAllTKKH());
		model.addAttribute("dshd",hddao.getAllHD());
		model.addAttribute("listsp",spdao.getAllSP());
		GioHangDAO cartdao = null;
		Object objCartBean = session.getAttribute("cart");
		if(objCartBean != null) {
			cartdao = (GioHangDAO) objCartBean;
			for(GioHang cd : cartdao.getAllCardItem()) {
				if(cd.getMaSP().trim().equals(masp)) {
					session.setAttribute("dlsp","thatbai");
					return "admin";
				}
			}
		}else {
			
			cartdao = new GioHangDAO();
			session.setAttribute("cart",cartdao);
		}
		for(ChiTietHoaDon cthd : cthddao.getAllCTHDByMaSP(masp)) {
			session.setAttribute("dlsp","dacohd");
			return "admin";
		}
		if(spdao.deleteSP(masp)) {
			model.addAttribute("listsp",spdao.getAllSP());
			session.setAttribute("dlsp","thanhcong");
			return "admin";
		}else {
			session.setAttribute("dlsp","dacohd");
			return "admin"; 
		}
		
	}
}
