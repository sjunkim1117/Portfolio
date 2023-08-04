package com.korea.k2.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDao  dao;
	
	@Override
	public void insert(CartVO vo) {
		dao.insert(vo);
		
	}

	@Override
	public List<CartVO> selectAll(CartVO vo) {
		return dao.selectAll(vo);
	}

	@Override
	public void delete(CartVO vo) {
		dao.delete(vo);
	}

	@Override
	public void deleteAll(CartVO vo) {
		dao.deleteAll(vo);
	}

	@Override
	public void update(CartVO vo) {
		dao.update(vo);
		
	}

	@Override
	public void insertOrderList(OrderListVO vo) {
		dao.insertOrderList(vo);
		
	}

	@Override
	public void insertOrderMoney(OrderMoneyVO vo) {
		dao.insertOrderMoney(vo);
		
	}

	@Override
	public int ordergroup(OrderMoneyVO vo) {
		return dao.ordergroup(vo);
	}

	@Override
	public List<OrderMoneyVO> selectMoney(OrderMoneyVO vo) {
		return dao.selectMoney(vo);
	}

	@Override
	public List<OrderListVO> selectOrderList(OrderListVO vo) {
		return dao.selectOrderList(vo);
	}



}
