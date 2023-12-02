package com.liivtogether.mapper;

//import com.github.pagehelper.Page;
import com.liivtogether.dto.Donation;
import com.liivtogether.dto.Seminar;
import com.liivtogether.frame.LIIVMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface DonationMapper extends LIIVMapper<Integer, Donation> {
    public void updateViews(Integer donaId) throws Exception;
	List<Donation> selectall();
	List<Donation> selectrecommend();
	public void setTargetIn(Donation donation);
	public List<Donation> getBannerList() throws Exception;


}
