<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ page language="java" pageEncoding="utf-8" import="com.petcare.web.domains.CustomerVO"%>
<html>
<head>
    <title>Zalbazo</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/common/template.css" />
    <link rel="stylesheet" href="/resources/css/home/home.css" />
    <!-- datapick -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
	<!-- datepicker 한국어로 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

</head>
<body>	   	
	<div id="root">
		<header>
			<%@ include file="../common/header.jsp" %>
		</header>
	</div>
	
	
<div class="row justify-content-center align-items-center">
	<div class="col-10 col-md-8 col-lg-6">
		<main class="main">
		<h3 class="section-title">수정페이지 </h3>
			<form  role="form"  method="post">
				<div class="container">
					 <p>
					  	예약날짜: <input type="text" id="datepicker" name="resDt" value="<c:out value='${board.resDt}'/>"/>
					 </p>
					 		
					 <div>
					     <p>예약시간 ${board.resTime}
					         <select id="res_time" name="resTime" class="form-control col-4">
						         <option value="09:00" <c:if test="${board.resTime == '09:00'} ">selected</c:if>>9:00</option>
					             <option value="10:00" <c:if test="${board.resTime == '10:00'} ">selected</c:if>>10:00</option>
					             <option value="11:00" <c:if test="${board.resTime == '11:00'} ">selected</c:if>>11:00</option>
					             <option value="12:00" <c:if test="${board.resTime == '12:00'} ">selected</c:if>>12:00</option>
					             <option value="14:00" <c:if test="${board.resTime == '14:00'} ">selected</c:if>>14:00</option>
					             <option value="15:00" <c:if test="${board.resTime == '15:00'} ">selected</c:if>>15:00</option>
					             <option value="16:00" <c:if test="${board.resTime == '16:00'} ">selected</c:if>>16:00</option>
					             <option value="17:00" <c:if test="${board.resTime == '17:00'} ">selected</c:if>>17:00</option>
					         </select>
					       </p>
					 </div>
					 	<div >
						 
							 <p>예약할 반려동물 :
								 <select  name="aniNo" class="form-control col-4">
									 <c:forEach items="${aninoList}" var="Nolist">
						       			<option  value="<c:out value="${Nolist.aniNo}"/>" 
						       			<c:if test="${Nolist.aniNo} == ${board.aniNo}  ">selected</c:if>>
						       			<%-- <p>${Nolist.aniNo}</p><p> ${board.aniNo}</p> --%>
						       			<c:out value="${Nolist.aniName}"/></option>
						       		</c:forEach>
								 </select>
							 </p>
						 
						</div>
						<p>증상</p>
						 <textarea cols="40" rows="3" name="resItem" class="form-control col-4"><c:out value='${board.resItem}'/></textarea>
						 <div style="margin-top:15px">
							 <button data-oper="modify" class="btn btn-info">수정완료</button>
							 <button data-oper="list" class="btn btn-info">리스트가기</button>
						 </div>
				</div>
					 	<input type="hidden" id="treatNo" name="treatNo" value="<c:out value='${treatNo}'/>">
					 	<!-- 형변환 문제 String int -->
					 	<%-- <input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
						<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>"> --%>
						<input type="hidden" name="type" value="<c:out value='${cri.type}'/>">
						<input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>">
			
			</form>
								
		</main>
	</div>
</div>
				    		    					
		

						
		
 
	<footer>
		<%@ include file="../common/footer.jsp" %>
	</footer>
	<!--button이동  -->
<script>
		$(document).ready(function(){
			
			var operForm = $('form');
			$('button').on('click',function(e){
				e.preventDefault();
				
				var operation = $(this).data("oper");
				console.log(operation);
				if(operation == "list"){
					operForm.attr("action","/reservation/list").attr("method","get");
					var pageNumTag = $("input[name='pageNum']").clone();
					var amountTag = $("input[name='amount']").clone();
					var keywordTag = $("input[name='keyword']").clone();
					var typeTag = $("input[name='type']").clone();
					
					operForm.empty();
					operForm.append(pageNumTag);
					operForm.append(amountTag);
					operForm.append(keywordTag);
					operForm.append(typeTag);
				}else{
					operForm.attr("action","/reservation/modify")
				}
				operForm.submit();
			});
			/* var operForm= $('#operForm');
			$('button[data-oper="remove"]').on('click',function(e){
				e.preventDefault();
				operForm.attr('action','/reservation/remove').attr('method','post').submit();
			});
			operForm.submit(); */
		});
</script>
				
	<!--datepicker  -->
<script>
	 $(document).ready(function(){
		$("#datepicker").datepicker({
			beforeShowDay: $.datepicker.noWeekends,
		      showButtonPanel: true, 
		      dateFormat: "yymmdd",
		      closeText: '닫기', 
		      showOn: "both", 
		      buttonImage: "/resources/img/reservation/calendar20.svg", 
		      buttonImageOnly: true,
		}) ;
		var today = new Date();
		$("#datepicker").datepicker( "option", "minDate", today );
	 });

</script>
<!-- <script >
 $(document).ready(function(){
	 var restime = document.querySelectorAll('#res_time option');
	 for(int i=0; i<restime.length; i++){
		 if(restime[i].value == ${board.resTime}){
			 $("#res_time option:eq("+i+")").attr("selected","selected");	
				break;
		 }
	 }
 })

</script> -->
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/b98d20d346.js" crossorigin="anonymous"></script>
	<script src="/resources/js/common/template.js"></script>
</body>
</html>