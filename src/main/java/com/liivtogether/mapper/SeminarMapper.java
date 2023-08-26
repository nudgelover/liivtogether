package com.liivtogether.mapper;


import com.liivtogether.dto.Seminar;
import com.liivtogether.frame.LIIVMapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper

public interface SeminarMapper extends LIIVMapper<Integer, Seminar> {

   public void updateViews(Integer seminarId) throws Exception;

   public List<Seminar> getBrandNewOrder(String topicSmall, String currentDate)throws Exception;

   public List<Seminar> getPopularOrder(String topicSmall,  String currentDate) throws Exception;
   
   public List<Seminar> getDeadlineOrder(String topicSmall, String currentDate) throws Exception;
   
   public List<Seminar> getTargetInOrder(String topicSmall, String currentDate) throws Exception;
   
   public List<Seminar> getViewsOrder(String topicSmall, String currentDate) throws Exception;
   
  
   public List<Seminar> getBrandNewOrderWithClosed(String topicSmall) throws Exception;
   
   public List<Seminar> getPopularOrderWithClosed(String topicSmall) throws Exception;
   
   public List<Seminar> getDeadlineOrderWithClosed(String topicSmall) throws Exception;
   
   public List<Seminar> getTargetInOrderWithClosed(String topicSmall) throws Exception;
   
   public List<Seminar> getViewsOrderWithClosed(String topicSmall) throws Exception;
  
}
