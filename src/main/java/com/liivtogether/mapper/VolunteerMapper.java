package com.liivtogether.mapper;

//import com.github.pagehelper.Page;
import com.liivtogether.dto.Volunteer;
import com.liivtogether.frame.LIIVMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface VolunteerMapper extends LIIVMapper<Integer, Volunteer> {
	List<Volunteer> selectrecommend();

	public List<Volunteer> getBannerList() throws Exception;

	
   public void updateViews(Integer voluId) throws Exception;

   public List<Volunteer> getBannerList() throws Exception;
	
   public List<Volunteer> getVolunteerList(Map<String, Object> params) throws Exception;

    
}
