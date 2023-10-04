package com.liivtogether.service;

import com.liivtogether.dto.Search;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.SearchMapper;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Slf4j
@Service
public class SearchService implements LIIVService<Integer, Search> {
    @Autowired
    SearchMapper mapper;

	@Override
	public void register(Search v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Integer k) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(Search v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Search get(Integer k) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Search> get() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	

	public List<Search> getkewordList(String keyword) throws Exception {
		return mapper.getkewordList(keyword);
	}

}
