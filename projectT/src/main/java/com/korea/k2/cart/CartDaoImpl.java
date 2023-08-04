package com.korea.k2.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	private SqlSessionTemplate  mybatis;
	
	@Override
	public void insert(CartVO vo) {
		mybatis.insert("CART.INSERT", vo);		
	}

	@Override
	public List<CartVO> selectAll(CartVO vo) {
		return mybatis.selectList("CART.SELECT", vo);
	}

	@Override
	public void delete(CartVO vo) {
		mybatis.delete("CART.DELETE", vo);
	}

	@Override
	public void deleteAll(CartVO vo) {
		mybatis.delete("CART.DELETEALL", vo);
		
	}

	@Override
	public void update(CartVO vo) {
		mybatis.update("CART.UPDATECART",vo);
		
	}

	@Override
	public void insertOrderList(OrderListVO vo) {
		mybatis.insert("CART.INSERTORDERLIST",vo);
		
	}

	@Override
	public void insertOrderMoney(OrderMoneyVO vo) {
		mybatis.insert("CART.INSERTORDERMONEY",vo);
		
	}

	@Override
	public int ordergroup(OrderMoneyVO vo) {
		return mybatis.selectOne("CART.ordergroup", vo);
	}

	@Override
	public List<OrderMoneyVO> selectMoney(OrderMoneyVO vo) {
		return mybatis.selectList("CART.ordermoney",vo);
	}

	@Override
	public List<OrderListVO> selectOrderList(OrderListVO vo) {
		return mybatis.selectList("CART.orderlist",vo);
	}

	

}
