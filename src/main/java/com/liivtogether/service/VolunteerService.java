package com.liivtogether.service;


import com.liivtogether.dto.Donation;
import com.liivtogether.dto.Seminar;
import com.liivtogether.dto.Volunteer;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.VolunteerMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class VolunteerService implements LIIVService<Integer, Volunteer> {

    @Autowired
    VolunteerMapper mapper;

    public void register(Volunteer volunteer) throws Exception {
        mapper.insert(volunteer);
    }

    @Override
    public void remove(Integer s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Volunteer volunteer) throws Exception {
        mapper.update(volunteer);
    }

    @Override
    public Volunteer get(Integer s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Volunteer> get() throws Exception {
        return mapper.selectall();
    }
    
    public List<Volunteer> getrecommend() throws Exception {
        return mapper.selectrecommend();
    }

	public void updateViews(Integer k) throws Exception {
		mapper.updateViews(k);
	}
	

	public List<Volunteer> getBannerList()throws Exception {
		
		return mapper.getBannerList();
	}

   public List<Volunteer> getVolunteerList(String topicSmall, String currentDate, boolean includeClosed, String order, Integer offset)throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("topicSmall", topicSmall);
        params.put("currentDate", currentDate);
        params.put("includeClosed", includeClosed);
        params.put("order", order);
        
        // offset이 null이 아닌 경우에만 params에 추가
        if (offset != null) {
            params.put("offset", offset);
        }

        return mapper.getVolunteerList(params);
    }


}
