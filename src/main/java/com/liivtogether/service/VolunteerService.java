package com.liivtogether.service;

import com.liivtogether.dto.Volunteer;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.VolunteerMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class VolunteerService implements LIIVService<String, Volunteer> {

    @Autowired
    VolunteerMapper mapper;

    public void register(Volunteer volunteer) throws Exception {
        mapper.insert(volunteer);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Volunteer volunteer) throws Exception {
        mapper.update(volunteer);
    }

    @Override
    public Volunteer get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Volunteer> get() throws Exception {
        return mapper.selectall();
    }

}
