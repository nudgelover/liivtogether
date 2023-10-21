package com.liivtogether.service;

import com.liivtogether.dto.Cust;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.CustMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class CustService implements LIIVService<String, Cust> {

    @Autowired
    CustMapper mapper;

	@Override
	public void register(Cust v) throws Exception {
		mapper.insert(v);
	}

	@Override
	public void remove(String k) throws Exception {
		mapper.delete(k);
	}

	@Override
	public void modify(Cust v) throws Exception {
		mapper.update(v);
	}

	@Override
	public Cust get(String k) throws Exception {
		return mapper.select(k);
	}

	@Override
	public List<Cust> get() throws Exception {
		return mapper.selectall();
	}

	public void setPointree(Cust cust) throws Exception {
		mapper.setPointree(cust);
	}

}
