package com.petcare.web.domains;


import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	private String userId;
	private String userAuth;
	
	private String type;
	private String keyword;
	
	private String startDate;
	private String endDate;
	private String searchId;
	
	
	public Criteria() {
		
		this.pageNum =1;
		this.amount = 5;
			
	}
	public String[] getTypeArr() {
		return type==null? new String[] {}: type.split("") ;
	}

	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			.queryParam("pageNum",this.pageNum)
			.queryParam("amount", this.getAmount())
			.queryParam("type", this.getType())
			.queryParam("keyword", this.getKeyword())
			.queryParam("startDate",this.getStartDate())
			.queryParam("endDate",this.getEndDate());
		
		return builder.toUriString();
	}
	


	
}
