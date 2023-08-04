package com.korea.k2.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.korea.k2.shop.MemberVO;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	private SqlSessionTemplate  mybatis;
	
	@Override
	public MemberVO loginOne(MemberVO vo) {
		return mybatis.selectOne("ShopDao.LOGIN", vo);
	}

}
