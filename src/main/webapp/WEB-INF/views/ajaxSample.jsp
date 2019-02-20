<%@page import="com.kh.w7.deal.model.vo.Deal"%>
<%@page import="com.kh.w7.mypage.model.vo.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
   ArrayList<Deal> result = new ArrayList<Deal>();
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소비자 마이페이지</title>
<style type="text/css">
.bg-light{
   padding-top: 100px;
   padding-bottom: 50px;
}
 th{
    background-color:#EAEAEA;
 }
  
 .td1{
   border-right:solid 1px black;
 }
 
</style>
<script type="text/javascript">
   $(function(){
      console.log("dealnum:"+dealnum);
   });
      
  function addBtnEvent() {

   //취소 팝업에 있는 보내기 버튼 누를때
     $("#cancelBtn").click(function () {
      var textContent = $("#textContent").val();//취소사유
      var dealnum = $("#dealnum").val();
      console.log("dealnum"+dealnum);
      $.ajax({
         url:"${pageContext.request.contextPath}/cancelupdate.consumer",
         type : "get",
         data : {dealnum:dealnum, textContent:textContent},
         success : function (data) {
            selectListAp(1);
            selectListAccept();
            selectListCencel();
            
         }
      });
   }); 
   //목록에서 취소버튼 누를때
    $(".cBtn").click(function () {
         var no = $(this).parent().parent().children().eq(1).text();
         $("#dealnum").val(no);
         console.log("no:"+no);
      
      });
   
    //취소 목록에서 삭제 버튼 눌렀을때
    $(".cancelDelete").click(function () {
       var dealnum = $(this).parent().parent().children().eq(1).text();
         $.ajax({
            url:"${pageContext.request.contextPath}/canceldelete.consumer",
            type : "get",
            data : {dealnum:dealnum},
            success : function (data) {
               selectListCencel();
            }
         });
   }); 
   
   //수락 목록에서 결제 버튼 눌렀을때
    $(".dealBtn").click(function () { //두번째 버튼이 안눌림
       var dealnum = $(this).parent().parent().children().eq(1).text();
       var productno = $(this).parent().parent().children().eq(2).text();
       console.log("dealnum:"+dealnum);
       console.log("productno:"+productno);
         $.ajax({
            url:"${pageContext.request.contextPath}/selectOneProduct.de",
            type : "get",
            data : {dealnum:dealnum, productno:productno},
            success : function (data) {
                  
                  document.location.href ="/dsm/views/cash/payment.jsp"; 

            }
         });
   });
   
   //구매완료 목록에서 구매확정 버튼 눌렀을때
   $(".dealcomlete").click(function () {
      var no = $(this).parent().parent().children().eq(1).text();

       $.ajax({
         url:"${pageContext.request.contextPath}/completeUpdate.consumer",
         type : "get",
         data : {no:no},
         success : function (data) {
            selectListdealcomplete();
         }
      });
      
   });
   
   //구매완료 목록에서 구매평작성 누를때
    $(".dealreview").click(function () {
      var dealnum = $(this).parent().parent().children().eq(1).text();
      var productNo = $(this).parent().parent().children().eq(2).text();
      $("#reviewdealnum").val(dealnum);
      $("#reviewProductNo").val(productNo);
      $.ajax({
         url:"${pageContext.request.contextPath}/review.seller",
         type : "get",
         data : {dealnum:dealnum},
         success : function (data) {
            $("#reviewthumnail").attr("src", "${pageContext.request.contextPath}/image_uploadFiles/"+data[0].thumnailImg);
            $("#reviewproName").text(data[0].productName);
            $("#reviewproConten").text(data[0].productContent);
            
            
         }
      });
   }); 
   
   
   //구매평 작성 팝업 에서 보내기 클릭할때 (별점과 구매평 DB에 저장)
   $("#reviewRegist").click(function () {
      var rstar = $("#starPoint").val();
      var rtext = $("#reiviewText").val();
      var productNo = $("#reviewProductNo").val();
      
      console.log("productNo:"+productNo);
      console.log("rtext:"+rtext);
      console.log("rstar:"+rstar);
      
      $.ajax({
         url : "${pageContext.request.contextPath}/reviewstar.seller",
         type: "get",
         data : {rstar:rstar,rtext:rtext,productNo:productNo},
         success : function (data) {
            reviewStateUpdate();
            
         }
      });
   });
   
  }
      
//구매평 후 상태변경   
function reviewStateUpdate() {
   var dealnum =$("#reviewdealnum").val();
   
   $.ajax({
      url : "${pageContext.request.contextPath}/reviewstate.seller",
      type: "get",
      data : {dealnum:dealnum},
      success : function (data) {
         selectListdealcomplete(1);
      }
   });
}
 



//신청 리스트 ajax
function selectListAp(pg) {
   
   $.ajax({
      url : "${pageContext.request.contextPath}/selectList.ap",
      type :"get",
      data : {currentPage : pg},
      success : function (data) {
         console.log(data);
         
         var apListHtml = [];
         var no =0;
         for(var i=0; i<data.aplist.length; i++){
            apListHtml.push('<tr>');
            apListHtml.push('   <th scope="row">' + (i+1) + '</th>');
            apListHtml.push('   <td class="td1" style="display: none">' +data.aplist[i].dealNo + '</td>');
            apListHtml.push('   <td class="td1">' +data.aplist[i].member_id + '</td>');
            apListHtml.push('   <td class="td1">' +data.aplist[i].productName+ '</td>');
            apListHtml.push('   <td>' +data.aplist[i].dealListaddMsg1 + '</td>');
            apListHtml.push('    <td style="width: 30px"><button type="button" class="btn btn-secondary cBtn" data-toggle="modal" data-target="#cencelModal">취소</button></td>');
            apListHtml.push('</tr>');
            
            
         }
         $("#applylist").html("");//이전틀 지우고
         $("#applylist").append(apListHtml.join(""));//""를 기준으로 배열에 담긴 데이터 꺼내오기
         
         //페이징 처리
          var apPageHtml= [];
         apPageHtml.push('<button onclick="selectListAp(1)"><<</button>');
         if(pg <=1){
            apPageHtml.push('<button disabled><</button>');
         }else{
            apPageHtml.push('<button onclick="selectListAp(' + (pg-1) + ')"><</button>');
         }
         for(var p = data.startPage; p<= data.endPage; p++) {
            if(p == pg){
            apPageHtml.push('<button disabled>'+p+'</button>');
            }else{
               apPageHtml.push('<button onclick="selectListAp('+p+')">'+p+'</button>');
               }
            }
         if(pg >= data.maxPage){ 
            apPageHtml.push('<button disabled>></button>');
         }else{
            apPageHtml.push('<button onclick="selectListAp('+(pg+1)+')">></button>');
         }
            apPageHtml.push('<button onclick="selectListAp('+data.maxPage +')">>></button>');
         
            $("#ApplyPagingArea").html("");
            $("#ApplyPagingArea").append(apPageHtml.join(""));
             
         
          addBtnEvent();//버튼 함수 불러오기
          
          
          
      }
   });
}
 //취소 목록 ajax
 function selectListCencel(pg) {
      
      $.ajax({
         url : "${pageContext.request.contextPath}/selectList.Can",
         type :"get",
         success : function (data) {
            console.log(data);
            
            var ccListHtml = [];
            var no =0;
            for(var i=0; i<data.cclist.length; i++){
               ccListHtml.push('<tr>');
               ccListHtml.push('   <th scope="row">' + (i+1) + '</th>');
               ccListHtml.push('   <td class="td1" style="display: none">' +data.cclist[i].dealNo +'</td>');
               ccListHtml.push('   <td class="td1">' +data.cclist[i].member_id + '</td>');
               ccListHtml.push('   <td class="td1">' +data.cclist[i].productName+ '</td>');
               ccListHtml.push('   <td class="td1">' +data.cclist[i].dealListaddMsg1 + '</td>');
               ccListHtml.push('   <td>' +data.cclist[i].dealListaddMsg2 + '</td>');
               ccListHtml.push('   <td style="width: 10px"><button type="button" class="btn btn-secondary cancelDelete">삭제</button></td>');
               ccListHtml.push('</tr>');
               
               
            }
            $("#cancelList").html("");//이전틀 지우고
            $("#cancelList").append(ccListHtml.join(""));//""를 기준으로 배열에 담긴 데이터 꺼내오기
            
            //페이징 처리
             var ccPageHtml= [];
             ccPageHtml.push('<button onclick="selectListCencel(1)"><<</button>');
            if(pg <=1){
               ccPageHtml.push('<button disabled><</button>');
            }else{
               ccPageHtml.push('<button onclick="selectListCencel(' + (pg-1) + ')"><</button>');
            }
            for(var p = data.startPage; p<= data.endPage; p++) {
               if(p == pg){
                  ccPageHtml.push('<button disabled>'+p+'</button>');
               }else{
                  ccPageHtml.push('<button onclick="selectListCencel('+p+')">'+p+'</button>');
                  }
               }
            if(pg >= data.maxPage){ 
               ccPageHtml.push('<button disabled>></button>');
            }else{
               ccPageHtml.push('<button onclick="selectListCencel('+(pg+1)+')">></button>');
            }
            ccPageHtml.push('<button onclick="selectListCencel('+data.maxPage +')">>></button>');
            
               $("#CancelPagingArea").html("");
               $("#CancelPagingArea").append(ccPageHtml.join(""));
                
                
            
             addBtnEvent();//버튼 함수 불러오기
             
             
             
         }
      });
   }
 //수락 목록 ajax
 function selectListAccept(pg) {
      
      $.ajax({
         url : "${pageContext.request.contextPath}/selectList.Acc",
         type :"get",
         success : function (data) {
            
            var accListHtml = [];
            var no =0;
            for(var i=0; i<data.aclist.length; i++){
               accListHtml.push('<tr>');
               accListHtml.push('   <th scope="row">' + (i+1) + '</th>');
               accListHtml.push('   <td class="td1" style="display: none">' +data.aclist[i].dealNo + '</td>');
               accListHtml.push('   <td class="td1" style="display: none">' +data.aclist[i].productNo + '</td>');
               accListHtml.push('   <td class="td1">' +data.aclist[i].member_id + '</td>');
               accListHtml.push('   <td class="td1">' +data.aclist[i].productName+ '</td>');
               accListHtml.push('   <td class="td1">' +data.aclist[i].dealListaddMsg1 + '</td>');
               accListHtml.push('   <td>' +data.aclist[i].dealListaddMsg2 + '</td>');
               accListHtml.push('   <td style="width: 10px; padding-right: 0px"><button type="button" class="btn btn-warning dealBtn">결제하기</button></td>');
               accListHtml.push('   <td style="width: 5px"><button type="button" class="btn btn-secondary cBtn"data-toggle="modal" data-target="#cencelModal">취소</button></td>');
               accListHtml.push('</tr>');
               
               
            }
            $("#acceptList").html("");//이전틀 지우고
            $("#acceptList").append(accListHtml.join(""));//""를 기준으로 배열에 담긴 데이터 꺼내오기
            
            //페이징 처리
             var accPageHtml= [];
                accPageHtml.push('<button onclick="selectListAccept(1)"><<</button>');
            if(pg <=1){
               accPageHtml.push('<button disabled><</button>');
            }else{
               accPageHtml.push('<button onclick="selectListAccept(' + (pg-1) + ')"><</button>');
            }
            for(var p = data.startPage; p<= data.endPage; p++) {
               if(p == pg){
                  accPageHtml.push('<button disabled>'+p+'</button>');
               }else{
                  accPageHtml.push('<button onclick="selectListAccept('+p+')">'+p+'</button>');
                  }
               }
            if(pg >= data.maxPage){ 
               accPageHtml.push('<button disabled>></button>');
            }else{
               accPageHtml.push('<button onclick="selectListAccept('+(pg+1)+')">></button>');
            }
            accPageHtml.push('<button onclick="selectListAccept('+data.maxPage +')">>></button>');
            
               $("#AcceptPagingArea").html("");
               $("#AcceptPagingArea").append(accPageHtml.join(""));
                
                
            
             addBtnEvent();//버튼 함수 불러오기
             
             
             
         }
      });
   }
 //구메완료 목록 ajax
 function selectListdealcomplete(pg) {
      
      $.ajax({
         url : "${pageContext.request.contextPath}/selectList.dc",
         type :"get",
         success : function (data) {
            
            var dcListHtml = [];
            var no =0;
            for(var i=0; i<data.length; i++){
               dcListHtml.push('<tr>');
               dcListHtml.push('   <th scope="row">' + (i+1) + '</th>');
               dcListHtml.push('   <td class="td1" style="display: none">' +data[i].dealNo + '</td>');
               dcListHtml.push('   <td class="td1" style="display: none">' +data[i].productNo + '</td>');
               dcListHtml.push('   <td class="td1">' +data[i].member_id + '</td>');
               dcListHtml.push('   <td class="td1">' +data[i].productName+ '</td>');
               dcListHtml.push('   <td class="td1">' +data[i].dealListaddMsg1 + '</td>');
               dcListHtml.push('   <td>' +data[i].dealListaddMsg2 + '</td>');
               if(data[i].dealListCategory==3){
               dcListHtml.push('   <td style="width: 40px"><button type="button" class="btn btn-secondary dealcomlete">구매확정</button></td>');
               dcListHtml.push('   <td style="width: 40px"><button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#reviewModal" style="display: none">구매평 작성</button></td>');
               }else if(data[i].dealListCategory==4){
               dcListHtml.push('   <td style="width: 40px"><button type="button" class="btn btn-secondary dealcomlete" disabled>구매확정</button></td>');
               dcListHtml.push('   <td style="width: 40px"><button type="button" class="btn btn-secondary dealreview" data-toggle="modal" data-target="#reviewModal" >구매평 작성</button></td>');
               }else{
               dcListHtml.push('   <td style="width: 40px"><button type="button" class="btn btn-secondary dealcomlete" disabled>구매확정</button></td>');
               dcListHtml.push('   <td style="width: 40px"><button type="button" class="btn btn-secondary dealreview" data-toggle="modal" data-target="#reviewModal" disabled>구매평 작성</button></td>');
               }
               dcListHtml.push('</tr>');
               
               
            }
            $("#dealcomplete").html("");//이전틀 지우고
            $("#dealcomplete").append(dcListHtml.join(""));//""를 기준으로 배열에 담긴 데이터 꺼내오기
            
            
                
            
             addBtnEvent();//버튼 함수 불러오기
             
             
             
         }
      });
   }

//마이페이지 실행시에 뷰페이지 만들고 데이터 뿌려주는 ajax 메인(함수 호출 여기서)
    $(function () {
       selectListAp(1);
       selectListCencel(1);
       selectListAccept(1);
       selectListdealcomplete(1);
   }); 
</script>
</head>
<body>
<!-- 네비게이션 바 -->
      <%@ include file = "../common/menubar.jsp" %>
      <%@ include file = "../common/CancelPopUp.jsp" %>
      <%@ include file = "../common/ReviewPopUp.jsp" %>
      <%@ include file = "../common/AskPopUp.jsp" %>
<!-- 신청목록 -->
    <section class="bg-light" id="portfolio">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 text-left">
               <h2 class="section-heading text-uppercase">신청 목록 </h2>
               <h3 class="section-subheading text-muted">
                  <hr style="border: solid 1px darkgray">
               </h3>
            </div>
         </div>
         <div class="row">
          <table class="table table-hover">
           <thead>
             <tr>
               <th scope="col">No</th>
               <th scope="col" class="td1" style="display: none">거래번호</th>
               <th scope="col" class="td1">판매자ID</th>
               <th scope="col" class="td1">구매상품명</th>
               <th scope="col" >신청 내용</th>
               <th scope="col"></th>
             </tr>
           </thead>
          
           <tbody id="applylist">
            <!-- ajax에서 도는부분 -->
           </tbody>
            
         
         </table>
         </div>
            <div class="pagingArea" align="center" id="ApplyPagingArea">
            <!-- ajax에서 도는부분 -->
            </div>
      </div>
   </section>
  <!-- 수락 목록 -->
   <section class="bg-light" id="portfolio">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 text-left">
               <h2 class="section-heading text-uppercase">수락 목록 </h2>
               <h3 class="section-subheading text-muted">
                  <hr style="border: solid 1px darkgray">
               </h3>
            </div>
         </div>
         <div class="row">
          <table class="table table-hover">
           <thead>
             <tr>
               <th scope="col">No</th>
               <th scope="col" class="td1" style="display: none">거래번호</th>
               <th scope="col" class="td1" style="display: none">제품번호</th>
               <th scope="col" class="td1">판매자ID</th>
               <th scope="col" class="td1">구매 상품명</th>
               <th scope="col" class="td1">신청 내용</th>
               <th scope="col">수락 내용</th>
               <th scope="col"></th>
               <th scope="col"></th>
             </tr>
           </thead>
           <tbody id="acceptList">
               <!-- ajax도는 부분 -->             
           </tbody>
         </table>
         </div>
               <div class="pagingArea" align="center" id="AcceptPagingArea">
            <!-- ajax에서 도는부분 -->
            </div>
      </div>
   </section>
    
    <!-- 취소된 목록 -->
   <section class="bg-light" id="portfolio">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 text-left">
               <h2 class="section-heading text-uppercase">취소 목록 </h2>
               <h3 class="section-subheading text-muted">
                  <hr style="border: solid 1px darkgray">
               </h3>
            </div>
         </div>
         <div class="row">
          <table class="table table-hover">
           <thead>
             <tr>
               <th scope="col">No</th>
               <th scope="col" class="td1" style="display: none">거래번호</th>
               <th scope="col" class="td1">판매자ID</th>
               <th scope="col" class="td1">구매상품명</th>
               <th scope="col" class="td1" >신청 내용</th>
               <th scope="col" >취소 사유</th>
               <th scope="col"></th>
             </tr>
           </thead>
           <tbody id="cancelList">
            <!-- ajax도는 부분 -->
           </tbody>
         </table>
         </div>
               <div class="pagingArea" align="center" id="CancelPagingArea">
            <!-- ajax에서 도는부분 -->
            </div>
      </div>
   </section>
   <!-- 구매완료 목록 -->
   <section class="bg-light" id="portfolio">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 text-left">
               <h2 class="section-heading text-uppercase">구매완료 목록 </h2>
               <h3 class="section-subheading text-muted">
                  <hr style="border: solid 1px darkgray">
               </h3>
            </div>
         </div>
         <div class="row">
          <table class="table table-hover">
           <thead>
             <tr>
              <th scope="col">No</th>
              <th scope="col" class="td1" style="display: none">거래번호</th>
              <th scope="col" class="td1" style="display: none">상품번호</th>
               <th scope="col" class="td1">판매자ID</th>
               <th scope="col" class="td1">구매 상품명</th>
               <th scope="col" class="td1">신청 내용</th>
               <th scope="col">수락 내용</th>
               <th scope="col">진행상황</th>
               <th scope="col"></th>
             </tr>
           </thead>
           <tbody id="dealcomplete">
             <!-- ajax도는 부분 -->
          </tbody>
         </table>
         </div>
                <div class="pagingArea" align="center" id="CompletePagingArea">
            <!-- ajax에서 도는부분 -->
            </div>
      </div>
   </section>
  
  <!-- 밑 공백주기용 -->
    <section class="bg-light" id="portfolio" >
      <div style="height: 200px">
      </div>
   </section>
  
<!-- Footer -->
      <%@ include file = "../common/footer.jsp" %>
   
</body>
</html>