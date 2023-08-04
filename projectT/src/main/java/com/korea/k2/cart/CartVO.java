package com.korea.k2.cart;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
  private  int	cartId ;
  private  int	custNo  ;
  private  int	productId ;
  private  int	amount ;
  private String custname;
  private String address;
  private  String productName ; 
  private  int productPrice;
  private String productImg;
  private  String productImgStr;
  private int idx;
  private int totalprice;
  private Date regdate;
  private int deli;
  
  
}
