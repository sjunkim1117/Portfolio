package com.korea.k2.cart;

import lombok.Data;

@Data
public class OrderListVO {
	private int idx;
	private int custNo;
	private int cartId;
	private int productId;
	private String productName;
	private int amount;
	private String regdate;
	private int ordergroup;

	
}
