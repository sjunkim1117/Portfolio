package com.korea.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.korea.k2.login.LoginService;
import com.korea.k2.shop.MemberVO;

@Controller
public class LoginController {

	@Autowired
	private LoginService  service;
	
	 @RequestMapping(value = "/login.do", method = RequestMethod.POST)
	    public ResponseEntity<String> login(MemberVO vo, HttpSession session) {
	        MemberVO m = service.loginOne(vo);
	        if (m == null) {
	            return new ResponseEntity<>("id_not_found", HttpStatus.OK);
	        } else {
	            if (BCrypt.checkpw(vo.getPassword(), m.getPassword())) {
	                session.setAttribute("m", m);
	                return new ResponseEntity<>("login_success", HttpStatus.OK);
	            } else {
	                return new ResponseEntity<>("wrong_password", HttpStatus.OK);
	            }
	        }
	    }
    
    @RequestMapping("/logout.do")
	String  logout( HttpSession session ) 
			                    throws Exception {
    	session.invalidate();
    	return "/index.jsp";     	
	}
	
}
