package com.liivtogether.mapper;


import com.liivtogether.dto.Esgshop;
import com.liivtogether.frame.LIIVMapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper

public interface EsgshopMapper extends LIIVMapper<Integer, Esgshop> {

	
   public void updateViews(Integer esgshopId) throws Exception;

   public List<Esgshop> getBannerList() throws Exception;
	
   public List<Esgshop> getEsgshopList(Map<String, Object> params) throws Exception;


}
