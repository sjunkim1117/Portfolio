package com.korea.k2.product;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductDao  dao;
	 
	@Override
	public void insert(ProductVO vo) {
		dao.insert(vo);		
	}

	@Override
	public List<ProductVO> selectAll(ProductVO vo) {
		return dao.selectAll(vo);
	}

	@Override
	public ProductVO selectOne(ProductVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public void delete(ProductVO vo) {
		dao.delete(vo);		
	}


	@Override
	public List<ProductReviewVO> selectReview(ProductReviewVO review) {
		return dao.selectReview(review);
	}

	@Override
	public void insertReview(ProductReviewVO review) {
		dao.insertReview(review);
		
	}



}
