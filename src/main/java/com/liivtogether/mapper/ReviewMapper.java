package com.liivtogether.mapper;

//import com.github.pagehelper.Page;
import com.liivtogether.dto.Review;
import com.liivtogether.frame.LIIVMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ReviewMapper extends LIIVMapper<String, Review> {

	public Integer preCheck(Integer applyId) throws Exception;
	
    public List<Review> getMyList() throws Exception;

	public List<Review> getMyReview(String s)throws Exception;
}
