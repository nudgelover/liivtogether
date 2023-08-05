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

    public void register(Cust cust) throws Exception {
        mapper.insert(cust);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Cust cust) throws Exception {
        mapper.update(cust);
    }
    public void withdraw(String cust_id) throws Exception {
        mapper.withdraw(cust_id);
    }

    @Override
    public Cust get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Cust> get() throws Exception {
        return mapper.selectall();
    }
    public Cust getPhone(String s) throws Exception {
        return mapper.selectphone(s);
    }
    public Cust getEmail(String s) throws Exception {
        return mapper.selectemail(s);
    }
}
