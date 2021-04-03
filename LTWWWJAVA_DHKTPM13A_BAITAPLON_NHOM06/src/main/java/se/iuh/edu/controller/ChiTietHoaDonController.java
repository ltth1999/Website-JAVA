package se.iuh.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import se.iuh.edu.dao.ChiTietHoaDonDAO;

@Controller
public class ChiTietHoaDonController {

	@Autowired
	ChiTietHoaDonDAO cthddao;
}
