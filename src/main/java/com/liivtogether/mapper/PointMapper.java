package com.liivtogether.mapper;



import com.liivtogether.dto.Point;
import com.liivtogether.frame.LIIVMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper

public interface PointMapper extends LIIVMapper<Integer, Point> {

	   public Integer preCheck(String custId, String pointcoin) throws Exception;
	   public List<Point> getMyList(String custId, String pointcoin) throws Exception;
	   public Point getMyTotal(String custId, String pointcoin) throws Exception;
}
