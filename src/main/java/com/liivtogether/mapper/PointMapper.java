package com.liivtogether.mapper;



import com.liivtogether.dto.Point;
import com.liivtogether.frame.LIIVMapper;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper

public interface PointMapper extends LIIVMapper<Integer, Point> {

	   public Integer preCheck(String custId, String pointcoin) throws Exception;

}
