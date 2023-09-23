package com.liivtogether.mapper;


import com.liivtogether.dto.Seminar;
import com.liivtogether.frame.LIIVMapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper

public interface SeminarMapper extends LIIVMapper<Integer, Seminar> {

	
   public void updateViews(Integer seminarId) throws Exception;

   public List<Seminar> getBannerList() throws Exception;
	
   public List<Seminar> getSeminarList(Map<String, Object> params) throws Exception;


}
