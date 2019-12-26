package com.petcare.web.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.petcare.web.domains.AnimalVO;
import com.petcare.web.domains.Criteria;
import com.petcare.web.domains.ReservationVo;
import com.petcare.web.domains.pageDTO;


public interface ReservationService {
	
	public ReservationVo get(int treatNo);
	
	public void regist(ReservationVo reser);
	
	public boolean modify(ReservationVo reser);
	
	public boolean remove(int treatNo);
	
	//public List<ReservationVo> getList();

	public List<ReservationVo> getList(String userId);
	public List<ReservationVo> getList(Criteria cri);
	public List<ReservationVo> getList(pageDTO Pdto);
	
	public List<ReservationVo> getSearchList(String userId);

	public List<String> getSelectTime();
	
	public List<AnimalVO> getAniNo(String userId);

	public List<ReservationVo> getList(Criteria cri, String userId);
	
	public Integer getTotalNum(Criteria cri ,String userId);

	public int getTotalNum(String userId);
	public int getTotalNum(Criteria cri);
}
