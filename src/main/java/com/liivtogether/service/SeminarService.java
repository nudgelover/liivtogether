package com.liivtogether.service;

import com.liivtogether.dto.Seminar;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.LikesMapper;
import com.liivtogether.mapper.SeminarMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service

public class SeminarService implements LIIVService<Integer, Seminar> {
    @Autowired
    SeminarMapper mapper;
    
    @Autowired
    LikesMapper likesMapper;


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
	
//	public Seminar checkLikes(Integer seminarId, String custId) throws Exception {
//	    Map<String, Object> params = new HashMap<>();
//        params.put("seminarId", seminarId);
//        params.put("custId", custId);
//		
//		return mapper.checkLikes(params);
//	}


	public List<Seminar> getBannerList()throws Exception {
		
		return mapper.getBannerList();
	}

   public List<Seminar> getSeminarList(String topicSmall, String currentDate, boolean includeClosed, String order, Integer offset)throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("topicSmall", topicSmall);
        params.put("currentDate", currentDate);
        params.put("includeClosed", includeClosed);
        params.put("order", order);
        
        // offset이 null이 아닌 경우에만 params에 추가
        if (offset != null) {
            params.put("offset", offset);
        }

        return mapper.getSeminarList(params);
    }
	
	
	

}
