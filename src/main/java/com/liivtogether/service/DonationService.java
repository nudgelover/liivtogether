package com.liivtogether.service;

import com.liivtogether.dto.Cust;
import com.liivtogether.dto.Donation;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.DonationMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class DonationService implements LIIVService<Integer, Donation> {

    @Autowired
    DonationMapper mapper;

    public void register(Donation donation) throws Exception {
        mapper.insert(donation);
    }

    @Override
    public void remove(Integer s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Donation donation) throws Exception {
        mapper.update(donation);
    }

    @Override
    public Donation get(Integer s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Donation> get() throws Exception {
        return mapper.selectall();
    }
    
    public List<Donation> getrecommend() throws Exception {
    	return mapper.selectrecommend();
    }
}
