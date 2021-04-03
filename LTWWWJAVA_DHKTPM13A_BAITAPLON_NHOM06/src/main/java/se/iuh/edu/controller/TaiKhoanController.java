package se.iuh.edu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import se.iuh.edu.dao.*;
import se.iuh.edu.entity.*;

@Controller
public class TaiKhoanController {

	@Autowired
	TaiKhoanDAO tkdao;
	@Autowired
	SanPhamDAO spdao;
	@Autowired
	HoaDonDAO hddao;
	@Autowired
	ChiTietHoaDonDAO cthddao;
	@RequestMapping(value="/dangnhap",method=RequestMethod.POST)
	public String dangNhap(HttpServletRequest request,Model model) {
		
		HttpSession session = request.getSession();
		String email = request.getParameter("email").trim();
		String pass = request.getParameter("password").trim();
		TaiKhoan tk = null;
		List<TaiKhoan> listtk = tkdao.getAllTK();
		for(TaiKhoan tk1 : listtk) {
			if(tk1.getEmail().trim().equals(email) && tk1.getMatKhau().trim().equals(pass)) {
				tk = tk1;
				break;
			}
		}
		
		if(tk!=null) {
			session.setAttribute("tk", tk);
			if(tk.getLoaiTK().trim().equals("Nhan Vien")) {
				model.addAttribute("dstk",tkdao.getAllTKKH());
				model.addAttribute("dshd",hddao.getAllHD());
				model.addAttribute("listsp",spdao.getAllSP());
				return "admin";
			}else {
				model.addAttribute("dshdbytk",hddao.getAllHDByTK(tk.getMaTK().trim()));
				return "customer";
			}
		}else {
			session.setAttribute("dn","thatbai");
			return "login";
		}
	}
	
	@RequestMapping(value="/dangky")
	public void dangky() {
	}
	@RequestMapping(value="/login")
	public void login() {
	}
	@RequestMapping(value="/customer")
	public void customer(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		TaiKhoan tk = (TaiKhoan) session.getAttribute("tk");
		model.addAttribute("dshdbytk",hddao.getAllHDByTK(tk.getMaTK().trim()));
	}
	@RequestMapping(value="/admin")
	public void admin(Model model) {
		model.addAttribute("dstk",tkdao.getAllTKKH());
		model.addAttribute("dshd",hddao.getAllHD());
		model.addAttribute("listsp",spdao.getAllSP());
	}
	@RequestMapping(value="/updatecustomer")
	public void updatecustomer() {
	}
	@RequestMapping(value="/dangxuat")
	public String dangxuat(HttpServletRequest request) {
		request.getSession().removeAttribute("tk");
		return "login";
	}
	@RequestMapping(value="/dangkytaikhoan",method=RequestMethod.POST)
	public String dangkyTKKH(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String email = request.getParameter("email").trim();
		String matKhau = request.getParameter("password").trim();
		String ten = request.getParameter("ten").trim();
		String diaChi = request.getParameter("diachi").trim();
		String sdt = request.getParameter("sdt").trim();
		List<TaiKhoan> listtk = tkdao.getAllTK();
		int x=1;
		for(TaiKhoan tk1 :listtk) {
			if(email.equals(tk1.getEmail().trim())) { 
				session.setAttribute("dk","thatbai");
				return "dangky";
			}else {
				int x1=Integer.parseInt(tk1.getMaTK().trim());
				if(x<x1) x=x1;
			}
		}
		int n = x+1;

		TaiKhoan tk = new TaiKhoan(n+"", email, matKhau, ten, diaChi, sdt,"Khach Hang");
		
		if(tkdao.insertTK(tk)) {
			session.setAttribute("dk","thanhcong");
			return "login";
		}else {
			session.setAttribute("dk","thatbai");
			return "dangky";	
		}	
	}
	
	@RequestMapping(value="/updatett",method=RequestMethod.POST)
	public String updateTKKH(HttpServletRequest request,Model model) {
		
		HttpSession session = request.getSession();
		String ten = request.getParameter("ten").trim();
		String matKhau = request.getParameter("password").trim();
		String diaChi = request.getParameter("diachi").trim();
		String sdt = request.getParameter("sdt").trim();
		TaiKhoan tk = (TaiKhoan) session.getAttribute("tk");
		tk.setTen(ten);
		tk.setDiaChi(diaChi);
		tk.setMatKhau(matKhau);;
		tk.setSdt(sdt);
		if(tkdao.updateTK(tk)) {
			if(tk.getLoaiTK().trim().equals("Nhan Vien")) {
				model.addAttribute("dstk",tkdao.getAllTKKH());
				model.addAttribute("dshd",hddao.getAllHD());
				model.addAttribute("listsp",spdao.getAllSP());
				return "admin";
			}else {
				model.addAttribute("dshdbytk",hddao.getAllHDByTK(tk.getMaTK().trim()));
				return "customer";
			}
		}
		
		session.setAttribute("update","thatbai");
		return "updatecustomer";
	}
}
