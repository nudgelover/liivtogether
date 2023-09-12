package com.liivtogether.service;

import com.liivtogether.dto.Seminar;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.SeminarMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service

public class SeminarService implements LIIVService<Integer, Seminar> {
    @Autowired
    SeminarMapper mapper;


	@Override
	public void register(Seminar v) throws Exception {
		mapper.insert(v);
	}

	@Override
	public void remove(Integer k) throws Exception {
		mapper.delete(k);
	}

	@Override
	public void modify(Seminar v) throws Exception {
		mapper.update(v);
	}
	
	@Override
	public Seminar get(Integer k) throws Exception {
		return mapper.select(k);
	}

	@Override
	public List<Seminar> get() throws Exception {
		return mapper.selectall();
	}

	public void updateViews(Integer k) throws Exception {
		mapper.updateViews(k);
	}
	
	public List<Seminar> getBrandNewOrder(String topicSmall, String currentDate) throws Exception {
		return mapper.getBrandNewOrder(topicSmall, currentDate);
	}

	public List<Seminar> getPopularOrder(String topicSmall, String currentDate) throws Exception {
		return mapper.getPopularOrder(topicSmall, currentDate);
	}
	
	
	public List<Seminar> getDeadlineOrder(String topicSmall, String currentDate) throws Exception {
		
		return mapper.getDeadlineOrder(topicSmall, currentDate);
	}
	
	
	public List<Seminar> getTargetInOrder(String topicSmall, String currentDate) throws Exception {
		
		return mapper.getTargetInOrder(topicSmall, currentDate);
	}
	
	
	public List<Seminar> getViewsOrder(String topicSmall, String currentDate) throws Exception {
		return mapper.getViewsOrder(topicSmall, currentDate);
	}
	
	
	public List<Seminar> getBrandNewOrderWithClosed(String topicSmall) throws Exception {
		
		return mapper.getBrandNewOrderWithClosed(topicSmall);
	}
	
	public List<Seminar> getPopularOrderWithClosed(String topicSmall) throws Exception {
		
		return mapper.getPopularOrderWithClosed(topicSmall);
	}
	
	public List<Seminar> getDeadlineOrderWithClosed(String topicSmall) throws Exception {
		
		return mapper.getDeadlineOrderWithClosed(topicSmall);
	}
	
	public List<Seminar> getTargetInOrderWithClosed(String topicSmall) throws Exception {
		
		return mapper.getTargetInOrderWithClosed(topicSmall);
	}
	
	public List<Seminar> getViewsOrderWithClosed(String topicSmall) throws Exception {
		
		return mapper.getViewsOrderWithClosed(topicSmall);
	}
	

}
