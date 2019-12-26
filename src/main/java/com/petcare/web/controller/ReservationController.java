package com.petcare.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.petcare.web.domains.Criteria;
import com.petcare.web.domains.CustomerVO;
import com.petcare.web.domains.ReservationVo;
import com.petcare.web.domains.pageDTO;
import com.petcare.web.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	ReservationService service;

	@GetMapping("/list")
	public String list(Criteria cri,Model model,HttpSession session) {
		//@RequestParam(value="userId")String userId,
		
		CustomerVO logna =(CustomerVO)session.getAttribute("login"); 
		String userId = ((CustomerVO) logna).getUserId();
		String userAuth = (String)logna.getUserAuth();
		if(userId == null) {
		  return "/user/login";
		}
		
		cri.setUserId(userId);
		cri.setUserAuth(userAuth);
		int total =service.getTotalNum(cri);
		
		model.addAttribute("list",service.getList(cri));
		model.addAttribute("pageMaker",new pageDTO(cri,total));
		
			return "reservation/list" ;
		  
	}
		 
		 
	
	@PostMapping("/regist")
	public String register(ReservationVo Rvo,RedirectAttributes rttr,HttpSession session) {
     	
		//model.addAttribute("selectList",service.);
		CustomerVO obj = (CustomerVO)session.getAttribute("login");
		String userId = obj.getUserId();
		
		if(userId == null) {
			rttr.addFlashAttribute("msg","false");
			
		}else {
			Date today= new Date();
			SimpleDateFormat today1 = new SimpleDateFormat("HHmmss");
			int num= (int)(Math.random() * 10 + 1);
			int num1= Integer.parseInt(num +today1.format(today));
			
			Rvo.setTreatNo(num1);;
			Rvo.setUserId(userId);;
			
			service.regist(Rvo);
			
		}
		return "redirect:/reservation/list";
		
	}
	
	
	@GetMapping("/regist/{hosNo}")
	public String regist(@PathVariable String hosNo, Model model,HttpSession session) {
		//System.out.println(hosNo+"<<<<<hosNo");
		CustomerVO logna =(CustomerVO)session.getAttribute("login"); 
		String userId = logna.getUserId();
		model.addAttribute("aninoList" , service.getAniNo(userId));
		  
		
		//model.addAttribute("selectTime",service.getSelectTime());
		return "reservation/regist";
	}
	
	
	@PostMapping("/modify")
	public String modify(Criteria cri,ReservationVo vo ,RedirectAttributes rttr,Model model,HttpSession session) {
		CustomerVO user= (CustomerVO)session.getAttribute("login");
		String userId =user.getUserId();
		model.addAttribute("userId",userId);
				
		if(service.modify(vo)) {
			rttr.addFlashAttribute("modify","success");
		}
		/*
		 * rttr.addAttribute("pageNum" , cri.getPageNum()); rttr.addAttribute("amount" ,
		 * cri.getAmount()); rttr.addAttribute("type" , cri.getType());
		 * rttr.addAttribute("keyword" , cri.getKeyword());
		 */
		
		return "redirect:/reservation/list" +cri.getListLink();
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam(value="treatNo") int treatNo,Model model,HttpSession session) {
		CustomerVO logna =(CustomerVO)session.getAttribute("login"); 
		String userId = logna.getUserId();
		model.addAttribute("treatNo",treatNo);
		model.addAttribute("aninoList" , service.getAniNo(userId));
		model.addAttribute("board", service.get(treatNo));
	}
	
	@PostMapping("/remove")
	public String remove(Criteria cri,@RequestParam("treatNo") int treatNo,RedirectAttributes rttr) {
		if(service.remove(treatNo)) {
			
			rttr.addFlashAttribute("remove","success");
		}
		/*
		 * rttr.addAttribute("pageNum" , cri.getPageNum()); rttr.addAttribute("amount" ,
		 * cri.getAmount()); rttr.addAttribute("type" , cri.getType());
		 * rttr.addAttribute("keyword" , cri.getKeyword());
		 */
		
		return "redirect:/reservation/list"+cri.getListLink();
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("treatNo") int treatNo,@ModelAttribute("cri")Criteria cri ,Model model) {
		
		model.addAttribute("vo",service.get(treatNo));
	}
}
