package com.korea.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.k2.shop.MemberVO;
import com.korea.k2.shop.ShopService;

@Controller
public class ShopController {
	ShopController(){
		System.out.println(" ==> ShopController 확인");
	}
	
   @Autowired
   private ShopService service;

   
   
   @RequestMapping("/ShopSelectAll.do")
   String selectAll(Model model,MemberVO vo ) {
   model.addAttribute("li", service.selectAll(vo))  ; 
	return "/shop/shop_selectAll.jsp";	   
   }
   
   
   
   @RequestMapping("/IdCk.do")
   void IdCk(HttpServletResponse response ,MemberVO vo ) throws Exception   {
    
	    PrintWriter out=response.getWriter();
	    String str = service.idCk(vo);
	    System.out.println("===> str:" + str);
	    
	    if (str==null) {
	      if (vo.getId()!="") {	
	        out.print("T");
	      }
	    }else {
	      out.print("F");	
	    }
   
   }
         
   
   @RequestMapping("/ShopForm.do")
   String ShopForm( Model model ) {
	   model.addAttribute("custno", service.custno());	   
	return "/shop/shop_form.jsp";	   
	
   }   

   @RequestMapping("/ShopFormOK.do")
   String ShopFormOK(MemberVO vo) {
	   
	  String password = BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt())  ; 
	  vo.setPassword(password);	
	  
      service.insert(vo);	
     
	return "/ShopSelectAll.do";	   
		
   }
   
   @RequestMapping("/ShopUpdateOK.do")
   String ShopUpdateOK(MemberVO vo) {
     service.update(vo);		   
	return "/ShopSelectAll.do";	   
		
   }
   
   @RequestMapping("/ShopDelete.do")
   String ShopDelete(MemberVO vo) {
     service.delete(vo);		   
	return "/ShopSelectAll.do";	   
		
   }
   
   
   @RequestMapping("/ShopEdit.do")
   String ShopEdit(MemberVO vo, HttpSession session) {     		  
	   session.setAttribute("m", service.edit(vo));
	return "/shop/shop_edit.jsp";	   
		
   }
   
}
