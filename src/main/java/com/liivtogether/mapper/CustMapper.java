package com.liivtogether.mapper;

//import com.github.pagehelper.Page;
import com.liivtogether.dto.Cust;
import com.liivtogether.frame.LIIVMapper;
//import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
//@Mapper
public interface CustMapper extends LIIVMapper<String, Cust> {
    public void withdraw(String cust_id) throws Exception;
    public Cust selectphone(String phone) throws Exception;
    public Cust selectemail(String email) throws Exception;
}
