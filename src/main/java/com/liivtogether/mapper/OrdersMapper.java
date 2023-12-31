package com.liivtogether.mapper;

//import com.github.pagehelper.Page;
import com.liivtogether.dto.Orders;
import com.liivtogether.frame.LIIVMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface OrdersMapper extends LIIVMapper<String, Orders> {
    
}
