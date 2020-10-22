function pwdForget(){ 
        var e = document.getElementById('useremail').value; 
        var myData = {
        				"email":e,
        			 }; 
		var Email;

        $.ajax({ 
         type:'POST', 
         url:'../UserForgetPwd_Servlet', 
         data:{jsonData:JSON.stringify(myData)}, 
         dataType:'json', 

         success:
        	 function(data){ 
				if(data.email == ""){
					alert("信箱不存在或輸入錯誤")
					location.href="UserForgetPwd_test.html";
				}else{
					alert(data.email);
				}        	 	       	 	
         	},
         error:
         	function(xhr, ajaxOptions, thrownError){
             	alert(xhr.status+"\n"+thrownError);
         	}
        }); 
       } 