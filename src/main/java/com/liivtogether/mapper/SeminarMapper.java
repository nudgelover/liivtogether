package com.liivtogether.mapper;

//import com.github.pagehelper.Page;
import com.liivtogether.dto.Seminar;
import com.liivtogether.frame.LIIVMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface SeminarMapper extends LIIVMapper<String, Seminar> {
    
}
