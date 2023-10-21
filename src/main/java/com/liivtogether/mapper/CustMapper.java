package com.liivtogether.mapper;

import com.liivtogether.dto.Cust;
import com.liivtogether.frame.LIIVMapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CustMapper extends LIIVMapper<String, Cust> {
	public void setPointree(Cust cust);
}
