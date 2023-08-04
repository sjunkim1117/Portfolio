package com.korea.k2.cart;

import java.util.Date;

import lombok.Data;

@Data
public class OrderMoneyVO {
	private int idx;
	private int custNo;
	private int totalprice;
	private Date regdate;
	private int deli;
	

}
