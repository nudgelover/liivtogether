package com.liivtogether.mapper;



import com.liivtogether.dto.Search;
import com.liivtogether.frame.LIIVMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;



@Repository
@Mapper

public interface SearchMapper extends LIIVMapper<String, Search> {

	public List<Search> getkewordList(String keyword) throws Exception;


}
