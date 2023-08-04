package com.korea.k2.shop;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShopDaoImpl implements ShopDao  {

	@Autowired
	private SqlSessionTemplate  mybatis;
	
	@Override
	public List<MemberVO> selectAll(MemberVO vo) {
		return mybatis.selectList("ShopDao.SELECTALL", vo);
	}

	@Override
	public void insert(MemberVO vo) {
		mybatis.insert("ShopDao.INSERT", vo);
	}

	@Override
	public int custno() {		
		return mybatis.selectOne("ShopDao.CUSTNO");
	}

	@Override
	public MemberVO edit(MemberVO vo) {
		
		return mybatis.selectOne("ShopDao.EDIT", vo);
		
	}

	@Override
	public void update(MemberVO vo) {
		mybatis.update("ShopDao.UPDATE", vo);
	}

	

	@Override
	public String idCk(MemberVO vo) {
        System.out.println("ShopDaoImpl :" + vo); 
		return mybatis.selectOne("ShopDao.IDCK", vo);
	}

	@Override
	public void delete(MemberVO vo) {
		mybatis.delete("ShopDao.DELETE", vo);
		
	}

}
