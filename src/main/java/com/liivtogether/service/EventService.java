package com.liivtogether.service;

import com.liivtogether.dto.Event;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.EventMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service

public class EventService implements LIIVService<String, Event> {
    @Autowired
    EventMapper mapper;

	@Override
	public void register(Event v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(String k) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(Event v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Event get(String k) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Event> get() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	public int checkTodayDo(String custId, String eventName, String today) throws Exception {
	
		return mapper.checkTodayDo(custId, eventName, today);
	}
	
	public int checkThisMonthDo(String custId, String eventName, String thisMonth) throws Exception {
		
		return mapper.checkThisMonthDo(custId, eventName, thisMonth);
	}
	
	public List<Event> getEventData(String custId, String eventName, String thisMonth) throws Exception {
		return mapper.getEventData(custId, eventName, thisMonth);
	}
	
	
	public void insertEventData(String custId, String eventName, int pointsAwarded) throws Exception {
		mapper.insertEventData(custId, eventName, pointsAwarded);
		
	}
 
	

}
