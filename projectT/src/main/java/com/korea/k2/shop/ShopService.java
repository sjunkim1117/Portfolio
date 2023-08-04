package com.korea.k2.shop;

import java.util.List;

public interface ShopService {
   List<MemberVO> selectAll(MemberVO vo);
   void  insert(MemberVO vo);
   void  update(MemberVO vo);
   void  delete(MemberVO vo);
   MemberVO  edit(MemberVO vo);
   int custno();
  
   String idCk(MemberVO vo);
}
