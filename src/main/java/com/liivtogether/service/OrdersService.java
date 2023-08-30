package com.liivtogether.service;

import com.liivtogether.dto.Orders;
import com.liivtogether.frame.LIIVService;
import com.liivtogether.mapper.OrdersMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class OrdersService implements LIIVService<String, Orders> {

    @Autowired
    OrdersMapper mapper;

    public void register(Orders orders) throws Exception {
        mapper.insert(orders);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Orders orders) throws Exception {
        mapper.update(orders);
    }

    @Override
    public Orders get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Orders> get() throws Exception {
        return mapper.selectall();
    }

}
