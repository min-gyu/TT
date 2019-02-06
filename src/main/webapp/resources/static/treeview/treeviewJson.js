
var treeviewJson = {
	adminJson : [
					{
						text: "관리자"
					   ,nodes: [
						   
								{ 
								   text: "사원 관리"
								  ,nodes: [ 
										     {text: "사원 추가", href: "/semi/views/admin/user/addUserForm.jsp"}
										    ,{text: "사원 조회", href: "/semi/memberList.me"} 
										    ,{text: "휴가 조회", href: "/semi/vacList.va"} 
								  		  ]
								}
							   ,{ 
								  text: "기초 정보"
								 ,nodes: [
									 		{text: "부서 관리", href: "/semi/depList.dp"}
									 	   ,{text: "직책 관리", href: "/semi/posList.po"}
								 		]
								}
						 ]
						   
					}
			]

}