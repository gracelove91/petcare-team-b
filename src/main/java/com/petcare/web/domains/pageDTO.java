package com.petcare.web.domains;

import javax.servlet.http.HttpSession;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class pageDTO {
	private int startPage;
	private int endPage;
	
	private boolean next,prev;
	
	private Criteria cri;
	private int total;
	//private String userId;
	private int realEnd;
	
	public pageDTO(Criteria cri,int total) {
		
		//CustomerVO user=(CustomerVO)session.getAttribute("login");
		//String userI = user.getUserId();
		this.cri = cri;
		this.total = total;
		//this.userId= userId;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage = this.endPage-9;
		
		int realEnd=(int)(Math.ceil(total*1.0/cri.getAmount()));
		this.realEnd = realEnd;
		if(realEnd <this.endPage) {
			this.endPage=realEnd;
		}
		this.prev = this.startPage>1;
		this.next = this.endPage < realEnd;
	}

	/*
	 * public pageDTO(Criteria cri,int total) { this.cri = cri; this.total = total;
	 * 
	 * this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10; this.startPage =
	 * this.endPage-9;
	 * 
	 * int realEnd=(int)(Math.ceil(total*1.0)/cri.getAmount());
	 * 
	 * if(realEnd <this.endPage) { this.endPage=realEnd; } this.prev =
	 * this.startPage>1; this.next = this.endPage < realEnd; }
	 */
}
