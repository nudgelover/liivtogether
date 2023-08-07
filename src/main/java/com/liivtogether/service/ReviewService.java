package com.liivtogether.service;

import com.liivtogether.dto.Review;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.ReviewMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ReviewService implements LIIVService<String, Review> {

    @Autowired
    ReviewMapper mapper;

    public void register(Review review) throws Exception {
        mapper.insert(review);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Review review) throws Exception {
        mapper.update(review);
    }

    @Override
    public Review get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Review> get() throws Exception {
        return mapper.selectall();
    }

}
