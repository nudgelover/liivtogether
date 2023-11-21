package com.liivtogether.service;


import com.liivtogether.dto.Apply;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.ApplyMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


@Slf4j
@Service

public class ApplyService implements LIIVService<Integer, Apply> {
    @Autowired
    ApplyMapper mapper;

	@Override
	public void register(Apply v) throws Exception {
		mapper.insert(v);
		
	}

	@Override
	public void remove(Integer k) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(Apply v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Apply get(Integer k) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Apply> get() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Apply> getMyList(String custId, String topicBig) throws Exception {
		return mapper.getMyList(custId,topicBig);
	}
	
	public List<Apply> getMyAttendCount(String custId) throws Exception {
		return mapper.getMyAttendCount(custId);
	}
	

	public Integer preCheck(String contentsId, String topicBig, String custId) throws Exception {
		return mapper.preCheck(contentsId,topicBig,custId);
	}
	
	
	public Apply getJoinComplete(String custId, Integer contentsId) throws Exception {
		
		return mapper.getJoinComplete(custId, contentsId);
		
	}

}
