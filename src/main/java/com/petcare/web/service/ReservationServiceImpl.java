package com.petcare.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.domains.AnimalVO;
import com.petcare.web.domains.Criteria;
import com.petcare.web.domains.ReservationVo;
import com.petcare.web.domains.pageDTO;
import com.petcare.web.mapper.ReservationMapper;
@Service
public class ReservationServiceImpl implements ReservationService{

	
	@Autowired
	ReservationMapper mapper;

	@Override
	public ReservationVo get(int treatNo) {
		return mapper.read(treatNo);
	}

	@Override
	public void regist(ReservationVo reser) {
		mapper.insert(reser);
	}

	@Override
	public boolean modify(ReservationVo reser) {
		return mapper.update(reser)==1;
	}

	@Override
	public boolean remove(int treatNo) {
		return mapper.delete(treatNo)==1;
	}

	

	@Override
	public List<ReservationVo> getList(Criteria cri,String userId) {
		return mapper.getList(cri, userId);
	}

	@Override
	public List<String> getSelectTime() {
		
		return mapper.getSelectTime();
	}

	@Override
	public List<AnimalVO> getAniNo(String userId) {
		return mapper.getAniNo(userId);
	}

	@Override
	public List<ReservationVo> getSearchList(String userId) {
		return mapper.getSearchList(userId);
	}

	@Override
	public Integer getTotalNum(Criteria cri,String userId) {
		  
		return mapper.pageTotalNum(cri , userId);
	}

	@Override
	public List<ReservationVo> getList(String userId) {
		return mapper.getList(userId);
	}

	@Override
	public int getTotalNum(String userId) {
		return mapper.pageTotalNum(userId);
	}

	@Override
	public List<ReservationVo> getList(Criteria cri) {
		return mapper.getList(cri);
	}

	@Override
	public List<ReservationVo> getList(pageDTO Pdto) {
		return mapper.getList(Pdto);
	}

	@Override
	public int getTotalNum(Criteria cri) {
		return mapper.pageTotalNum(cri);
	}

	
}
