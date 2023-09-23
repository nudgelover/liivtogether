package com.liivtogether.mapper;


import com.liivtogether.dto.Apply;

import com.liivtogether.frame.LIIVMapper;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper

public interface ApplyMapper extends LIIVMapper<Integer, Apply> {

	   public Integer preCheck(String contentsId, String topicBig, String custId) throws Exception;

}
