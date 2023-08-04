package com.korea.k2.product;

import java.util.Date;

import lombok.Data;

@Data
public class ProductReviewVO {
    private String reviewId;
    private int productId;
    private String reviewText;
    private Date reviewDate;
    private int starRating;
}