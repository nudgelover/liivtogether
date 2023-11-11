package com.liivtogether.mapper;

import com.liivtogether.dto.Donation;
//import com.github.pagehelper.Page;
import com.liivtogether.dto.Volunteer;
import com.liivtogether.frame.LIIVMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface VolunteerMapper extends LIIVMapper<Integer, Volunteer> {
	List<Volunteer> selectrecommend();
    
}
