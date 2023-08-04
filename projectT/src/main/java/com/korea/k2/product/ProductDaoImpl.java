package com.korea.k2.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SqlSessionTemplate  mybatis;
	
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public void insert(ProductVO vo) {
		mybatis.insert("PRODUCT.INSERT", vo);
		
	}

	@Override
	public List<ProductVO> selectAll(ProductVO vo) {

		return mybatis.selectList("PRODUCT.SELECTALL", vo);
	}

	@Override
	public ProductVO selectOne(ProductVO vo) {
		
		return mybatis.selectOne("PRODUCT.SELECTONE", vo);
	}

	@Override
	public void delete(ProductVO vo) {
		mybatis.delete("PRODUCT.DELETE", vo);
		
	}

	@Override
	public List<ProductReviewVO> selectReview(ProductReviewVO review) {
		return mybatis.selectList("PRODUCT.selectReview", review);
	}

	@Override
	public void insertReview(ProductReviewVO review) {
		mybatis.insert("PRODUCT.insertReview",review);
		
	}


	


}
