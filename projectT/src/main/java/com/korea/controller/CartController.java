package com.korea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.korea.k2.cart.CartService;
import com.korea.k2.cart.CartVO;
import com.korea.k2.cart.OrderListVO;
import com.korea.k2.cart.OrderMoneyVO;


@Controller
public class CartController {

	@Autowired
	private CartService  service;
	
	@RequestMapping("/cartUpdate.do")
	String  cartUpdate(
			@RequestParam String[] custNo,  
			@RequestParam String[] cartId, 
			@RequestParam String[] productId, 
			@RequestParam String[] amount) throws Exception { 
		CartVO vo = new CartVO();
		for(int i=0; i<cartId.length;i++) {
		
			vo.setCartId(Integer.parseInt(cartId[i]));
			vo.setAmount(Integer.parseInt(amount[i]));
			service.update(vo);
		}
		return "redirect:/cartList.do?custNo="+custNo[custNo.length-1];		
	}
	
	@RequestMapping("/cartOrder.do")
	String  cartOrder(
			@RequestParam String[] custNo,  
			@RequestParam String[] cartId, 
			@RequestParam String[] productId, 
			@RequestParam String[] amount,
			@RequestParam String[] productname,
			OrderMoneyVO Mvo
			) throws Exception { 
		Mvo.setCustNo(Integer.parseInt(custNo[0]));
		Mvo.setDeli(Mvo.getDeli());
		Mvo.setTotalprice(Mvo.getTotalprice());
		service.insertOrderMoney(Mvo);
		int ordergroup = service.ordergroup(Mvo);
		OrderListVO Ovo = null;
		int custNoStr = 0;
		for(int i=0; i<cartId.length;i++) {
			Ovo = new OrderListVO();
			custNoStr = Integer.parseInt(custNo[i]);
			Ovo.setCustNo(Integer.parseInt(custNo[i]));
			Ovo.setCartId(Integer.parseInt(cartId[i]));
			Ovo.setProductId(Integer.parseInt(productId[i]));
			Ovo.setProductName(productname[i]);
			Ovo.setAmount(Integer.parseInt(amount[i]));
			Ovo.setOrdergroup(ordergroup);
			service.insertOrderList(Ovo);
		}
		CartVO cartVO = new CartVO();
		cartVO.setCustNo(custNoStr);
		service.deleteAll(cartVO);
		return "/orderMoney.do";		
	}
	

	@RequestMapping("/orderMoney.do")
	String orderMoney( OrderMoneyVO vo, Model model  ) throws Exception { 
    	model.addAttribute("ol",service.selectMoney(vo) );
		return "/cart/orderMoney.jsp";		
	}
	
	@RequestMapping("/orderList.do")
	String orderList( OrderListVO vo, Model model  ) throws Exception { 
    	model.addAttribute("li",service.selectOrderList(vo) );
		return "/cart/orderList.jsp";		
	}
	
	
	
    @RequestMapping("/cartInsert.do")
	String  cartInsert( CartVO vo  ) throws Exception { 
    	System.out.println("cartInsert:" + vo);
    	service.insert(vo);
		return "/cartList.do";		
	}
    
    @RequestMapping("/cartDelete.do")
   	String  cartDelete( CartVO vo  ) throws Exception { 
       	service.delete(vo);
   		return "/cartList.do";		
   	}
    
    @RequestMapping("/cartList.do")
	String  cartList( CartVO vo, Model model  ) throws Exception { 
 
    	model.addAttribute("li",service.selectAll(vo) );
    	
		return "/cart/cartList.jsp";		
	}
    
    @RequestMapping("/cartDeleteAll.do")
   	String  cartDeleteAll( CartVO vo  ) throws Exception { 
       	service.deleteAll(vo);
   		return "/cartList.do";		
   	}
    
    
    
}
