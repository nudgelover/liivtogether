package com.liivtogether.service;

import com.liivtogether.dto.PopularKeywords;
import com.liivtogether.dto.Search;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.PopularMapper;
import com.liivtogether.mapper.SearchMapper;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Slf4j
@Service
public class PopularService implements LIIVService<Integer, PopularKeywords> {
    @Autowired
    PopularMapper mapper;

	@Override
	public void register(PopularKeywords v) throws Exception {
		mapper.insert(v);
		
	}

	@Override
	public void remove(Integer k) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(PopularKeywords v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PopularKeywords get(Integer k) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PopularKeywords> get() throws Exception {
	
		return mapper.selectall();
	}

	

}
