<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
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
			<h3 class="section-title">상세페이지</h3>
				<div class="container">
					<p>
					  	예약아이디: <input type="text" id="datepicker" class="form-control col-4"  readonly="readonly" name="userId" value="<c:out value='${vo.userId }'/>"/>
					 </p>
					 
					 <p>
					  	예약날짜: <input type="text" id="datepicker" class="form-control col-4"  readonly="readonly" name="resDt" value="<c:out value='${vo.resDt }'/>"/>
					 </p>
					 
					 <div>
					     <p>예약시간 : <input type="text" id="datepicker"  class="form-control col-4" readonly="readonly" name="resDt" value="<c:out value='${vo.resTime }'/>"/>
					         
					       </p>
					 </div>
					 	<div >
						 <p>예약한 반려동물 :
							  <input type="text"  readonly="readonly" class="form-control col-4" name="aniName" value="<c:out value='${vo.aniName}'/>"/>
							
						 </p>
						</div>
						<p> 증상:</p>
						 <textarea cols="40" rows="3" name="resItem" readonly="readonly" class="form-control col-4"><c:out value='${vo.resItem}'/></textarea>
						 
						 <div style="margin-top:15px">
							 <button data-oper="modify" type="submit" class="btn btn-info">변경하기</button>
							 <button data-oper="remove" type="submit" class="btn btn-info">삭제하기</button>
							 <button data-oper="list" type="submit" class="btn btn-info">뒤로가기</button>
						 </div>
				</div>
			</main>
		 </div>
</div>

		<form id="operForm"  method="get">
			<input type="hidden" name="treatNo" value="<c:out value='${vo.treatNo}'/>">
			<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
			<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
			<input type="hidden" name="type" value="<c:out value='${cri.type}'/>">
			<input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>">
		</form>

		 
 
	<footer>
		<%@ include file="../common/footer.jsp" %>
	</footer>
	
	<script>
		$(document).ready(function(){
			var operForm= $('#operForm');
			$('button[data-oper="modify"]').on('click', function(e){
					operForm.attr("action","/reservation/modify").submit();
			});
			$('button[data-oper="remove"]').on('click', function(e){
				operForm.attr("action","/reservation/remove").attr("method","post").submit();
			});
				
			$('button[data-oper="list"]').on('click',function(e){
				
					operForm.find("#treatNo").remove();
					operForm.attr("action","/reservation/list");
					operForm.submit();
		
			});
		});
	
	</script>
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/b98d20d346.js" crossorigin="anonymous"></script>
	<script src="/resources/js/common/template.js"></script>
</body>
</html>