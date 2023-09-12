package com.liivtogether.mapper;

import com.liivtogether.dto.Likes;
import com.liivtogether.frame.LIIVMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Mapper
public interface LikesMapper extends LIIVMapper<Integer, Likes> {
	   
   public Likes checkLikes(Map<String, Object> params) throws Exception;
    
}
