package com.petcare.web.domains;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Component
@AllArgsConstructor
@NoArgsConstructor
public class HosInfoCodeVo  implements Serializable{
	private static final long serialVersionUID= 1L;
	
	private int hosInfoCode;
	private String codeName;
	
}
