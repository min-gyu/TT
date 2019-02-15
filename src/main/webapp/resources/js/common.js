/***
 * @author jy
 * @since 2019-02-14
 * @content loading bar
 * */
function fn_fakePage(type){
	if(type){
		$("#fakeLoader").fadeIn();
	}else{
		$("#fakeLoader").fadeOut();
	}
}
	
/***
 * @author jy
 * @since 2019-02-14
 * @content ajax 간편 함수
 * */
function fn_callAjax(url, data, afterFn, errorFn, loading){
	if(loading === undefined){
		loading = true;
	}
	
	if(loading){ fn_fakePage(true); }
	
	$.ajax({
         type			:"post"
        ,url			: url
	  	,data			: JSON.stringify(data)
        ,contentType	: "application/json; charset=UTF-8"
        ,success		: function(resultData, status, headers, config){
        						if(afterFn !== undefined){
	        						afterFn(resultData, status, headers, config);
        						}
					        }
        ,error 			: function(request,status,error){
					        	if(errorFn !== undefined){
        							errorFn(request, status, error);
					        	}
        					}
		,complete		: function(jqXHR){fn_fakePage(false);} // 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
    });
}

