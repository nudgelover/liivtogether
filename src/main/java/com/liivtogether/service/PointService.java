package com.liivtogether.service;



import com.liivtogether.dto.Point;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.PointMapper;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


@Slf4j
@Service

public class PointService implements LIIVService<Integer, Point> {
    @Autowired
    PointMapper mapper;

	@Override
	public void register(Point v) throws Exception {
		mapper.insert(v);
		
	}

	@Override
	public void remove(Integer k) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(Point v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Point get(Integer k) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Point> get() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Integer preCheck(String custId,String pointcoin) throws Exception {
		//이건 포인트 히스토리에서 가져오는게 아니라, CUST MAPPER 에서 가져오는거임!!
		return mapper.preCheck(custId, pointcoin);
	}

}
