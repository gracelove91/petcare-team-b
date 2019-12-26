package com.petcare.web.service;

import java.util.List;

import com.petcare.web.domains.ReservationVo;
import com.petcare.web.domains.TreatVo;

public interface TreatService {
	public List<ReservationVo> getReserList();
	
	public List<TreatVo> getTreatList();

	public TreatVo get(int treat_no);
	
	public void regist(TreatVo treatVo);
	
	public boolean modify(TreatVo treatVo);
		
	public List<String> getTime();
}
