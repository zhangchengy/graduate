$("#save").click(function(){ 
		$.ajax({ 
		    type: "POST", 	
			url: "login",
			data: {
				cname: $.trim($("#cname").val()), 
				cpassword: $("#cpassword").val(), 
				birthday: dojo.widget.byId("birthday").getValue()
				
			},
			dataType: "json",
			success: function(data){
				
					$("#show-in").html("<br>编号："+data.cid);
					$("#show-in").append("<br>姓名："+data.cname);
					$("#show-in").append("<br>密码："+data.cpassword);
					$("#show-in").append("<br>生日："+data.birthday.substring(0,10));
			
			},
			error: function(jqXHR){     
			   alert("发生错误：" + jqXHR.status);  
			}   
		});
	});