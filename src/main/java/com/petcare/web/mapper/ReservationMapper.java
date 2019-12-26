package com.petcare.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.petcare.web.domains.AnimalVO;
import com.petcare.web.domains.Criteria;
import com.petcare.web.domains.ReservationVo;
import com.petcare.web.domains.pageDTO;

@Mapper
public interface ReservationMapper {
	
	public ReservationVo read(int treatNo);
	
	public void insert(ReservationVo reser);
	
	public int update(ReservationVo reser);
	
	public int delete(int treatNo);
	
	public List<ReservationVo> getList(String userId);
	public List<ReservationVo> getList(Criteria cri);
	public List<ReservationVo> getList(pageDTO Pdto);

	public List<ReservationVo> getList(Criteria cri,String userId);
	
	public List<ReservationVo> getSearchList(String userId);

	public List<String> getSelectTime();
	
	public List<AnimalVO> getAniNo(String userId);
	
	public int pageTotalNum(Criteria cri,String userId);

	public int pageTotalNum(String userId);
	public int pageTotalNum(Criteria cri);

}

