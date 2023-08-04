package com.korea.k2.cart;

import java.util.List;

public interface CartDao {
  // 1. 장바구니 추가
  void  insert(CartVO vo);
  
  // 2. 장바구니 목록보기
  List<CartVO> selectAll(CartVO vo); 
  
  // 3. 장바구니 삭제
  void delete(CartVO vo);
  
  // 4. 장바구니 전체삭제
  void deleteAll(CartVO vo);
  
  // 5. 장바구니 수량 수정
  void update(CartVO vo);
  
  void insertOrderList(OrderListVO vo);

  void insertOrderMoney(OrderMoneyVO vo);
  
  int ordergroup(OrderMoneyVO vo);
  
  List<OrderMoneyVO> selectMoney(OrderMoneyVO vo);
  
  List<OrderListVO> selectOrderList(OrderListVO vo);
}
