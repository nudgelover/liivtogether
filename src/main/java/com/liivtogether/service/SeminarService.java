package com.liivtogether.service;

import com.liivtogether.dto.Seminar;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.SeminarMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class SeminarService implements LIIVService<String, Seminar> {

    @Autowired
    SeminarMapper mapper;

    public void register(Seminar seminar) throws Exception {
        mapper.insert(seminar);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Seminar seminar) throws Exception {
        mapper.update(seminar);
    }

    @Override
    public Seminar get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Seminar> get() throws Exception {
        return mapper.selectall();
    }

}
