package com.korea.k2.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDao  dao;
	
	@Override
	public List<MemberVO> selectAll(MemberVO vo) {

		return dao.selectAll(vo);
	}

	@Override
	public void insert(MemberVO vo) {
		dao.insert(vo);
		
	}

	@Override
	public int custno() {
		return dao.custno();
	}

	@Override
	public MemberVO edit(MemberVO vo) {
		return dao.edit(vo);
		
	}

	@Override
	public void update(MemberVO vo) {
		dao.update(vo);
		
	}

	@Override
	public String idCk(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.idCk(vo);
	}

	@Override
	public void delete(MemberVO vo) {
		dao.delete(vo);
		
	}

}
