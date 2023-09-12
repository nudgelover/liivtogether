package com.liivtogether.mapper;



import com.liivtogether.dto.Event;
import com.liivtogether.frame.LIIVMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper

public interface EventMapper extends LIIVMapper<Integer, Event> {

   public Integer checkTodayDo(String custId, String eventName, String today) throws Exception;
   
   public Integer checkThisMonthDo(String custId, String eventName, String thisMonth) throws Exception;
   
   public List<Event> getEventData(String custId, String eventName, String thisMonth) throws Exception;
  
   public void insertEventData(String custId, String eventName, int pointsAwarded) throws Exception;
}
