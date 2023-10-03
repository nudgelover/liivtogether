package com.liivtogether.mapper;

import com.liivtogether.dto.Apply;

import com.liivtogether.frame.LIIVMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper

public interface ApplyMapper extends LIIVMapper<Integer, Apply> {

	public List<Apply> getMyList(String custId, String topicBig) throws Exception;

	public Integer preCheck(String contentsId, String topicBig, String custId) throws Exception;

	public Apply getJoinComplete(String custId, Integer contentsId) throws Exception;
}
