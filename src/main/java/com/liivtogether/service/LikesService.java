package com.liivtogether.service;

import com.liivtogether.dto.Likes;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.LikesMapper;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service

public class LikesService implements LIIVService<String, Likes> {
    @Autowired
    LikesMapper mapper;

	@Override
	public void register(Likes v) throws Exception {
		mapper.insert(v);
		
	}

	@Override
	public void remove(String k) throws Exception {
		
		
	}

	@Override
	public void modify(Likes v) throws Exception {
		mapper.update(v);
		
	}

	@Override
	public Likes get(String k) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Likes> get() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	public Likes checkLikes(Integer contentsId, String custId) throws Exception {
	    Map<String, Object> params = new HashMap<>();
	    params.put("contentsId", contentsId);
	    params.put("custId", custId);
		
	    return mapper.checkLikes(params);
	}


}
