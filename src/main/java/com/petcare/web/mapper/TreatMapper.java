package com.petcare.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.petcare.web.domains.ReservationVo;
import com.petcare.web.domains.TreatVo;

@Mapper
public interface TreatMapper {
	
	public List<ReservationVo> getReserList();
	
	public List<TreatVo> getTreatList(); //? 진료완료 목록?
		
	public TreatVo read(int treat_no);
	
	public void insert(TreatVo treatVo);
	
	public int update(TreatVo treatVo);
	
	public List<String> getTime();
	
}
