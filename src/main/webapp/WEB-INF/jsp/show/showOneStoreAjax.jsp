<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <!DOCTYPE html>
 <html lang="zh-TW">
 <style>
 	div.mainDiv {
 	color: white;
 	}
 	img.ratingImg {
	width:20px;
	}
	figcaption.rateColor {
	color:white;
	}
	img.i {
	width: 50px;
	}
	#showcomment{
	width:500px;
	margin:20px;
 	background-color:#EFEFEF67;
 	resize:none;
 	color:#fffeee;
	}
	.comer{
	color:#d26900;
	}
	#textareaId{
	resize:none;
	}
 </style>
 <head>
 <jsp:include page="/fragment/linkCss.jsp" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script>
 	
 	window.onload = function() {
 		var mainDiv = document.getElementById("mainDiv");
 		var xhr = new XMLHttpRequest();
 		xhr.open("GET", "<c:url value='/show/showOneStore/"+ ${sid} +"' />",true);
 		xhr.send();
 		xhr.onreadystatechange = function() {
 			if (xhr.readyState == 4 && xhr.status == 200) {
 				var store = JSON.parse(xhr.responseText);
 				var rating;
				if (store.rateCount != 0) {
					rating = (store.rating / store.rateCount).toFixed(1);
				} else {
					rating = store.rating.toFixed(1);
				}
				
 				var orders = searchOrder(store.store_id); 				
 				var orderButton = "";
 				if (orders){
					orderButton = "<tr><td><button class='btn btn-primary' onclick='order("+ store.store_id +");'>點我定位</button></td></tr>";
				}
 				
 				var content = "";
					content += "<div>"+
					"<table>" +
					"<tr><td align='center'>"+ 
					"<img class='shopImg' height='500' width='625' src='<c:url value='/" +store.imgPath + "' />' />"+"</td></tr>" +
					"<tr><td>" + store.store_name +"</td></tr>" +
					"<tr><td>" + store.address_area +"</td></tr>" +
					"<tr><td>" +"營業開始："+ store.opentime_start +"</td></tr>" +
					"<tr><td>" +"營業結束："+ store.opentime_end +"</td></tr>" +
					"<tr><td>" +"地址："+ store.address_city+ store.address_area + store.address_road +"</td></tr>" +
					"<tr><td><img class='ratingImg' src='<c:url value='/images/goldenBean.png' />'>" + rating +"(" + store.rateCount + ")</td></tr>" +
					orderButton +
					"</table></div>";
					
					mainDiv.innerHTML = content;
 				
 			}
 		}
 		
 		var commentDiv = document.getElementById("commentDiv");
		var jsonData = {"store_id": ${sid}};
		var xhr1 = new XMLHttpRequest();
		xhr1.open("POST", "<c:url value='/getComment.do'/>", true);
		xhr1.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
   		xhr1.send(JSON.stringify(jsonData));
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				var comments = JSON.parse(xhr1.responseText);
				var content = "";
				for (var i=0; i < comments.length; i++) {
					content += "<label class='comer'>留言人: " + comments[i].name + "&nbsp;&nbsp;&nbsp;  留言時間: " +  comments[i].create_dt + "</label>"
							+  "<textarea class='form-control' id='showcomment' rows='5' disabled='disabled'>"+ comments[i].content +"</textarea><br>";
				}
				commentDiv.innerHTML = content;
			}
		}
 		
 		function searchOrder(store_id_in){
 	 		datas = {
 	 			store_id: store_id_in
 	 		}
 	 		var rtn;
 	 		 $.ajax({
 			  		type: 'PUT',
 			  		async:false,//因為在ajax中，須設定為同步後，將變數return出去ajax後才return出去searchOrder
 			  		url: '<c:url value="/show/searchOrder"	/>',
 			  		data: JSON.stringify(datas),
 			  		contentType:"application/json;charset=UTF-8",
 			  		dataType: 'json',

 			  		success:
 			  			function (data) {
 			  				if (data.isOk == "ok") {
 			  					rtn = true;
 			  				} else {
 			  					rtn = false;
 			  				}
 			  			},
 			  		error:
 			  			function (xhr, ajaxOptions, thrownError) {
 			  				alert(xhr.status + "\n" + thrownError);
 			  			}
 			  	});
 	 		 return rtn
 	 	}
 	}
 	function order(store_id_in){//連到UserOrderController，取出store_id訂單
	 		obj = {
	 			store_id: store_id_in
	 		};
	 		$.ajax({
		  		type: 'POST',
		  		url: '<c:url value="/show/storeOrder"	/>',
		  		data: JSON.stringify(obj),
		  		contentType:"application/json;charset=UTF-8",
		  		dataType: 'json',

		  		success:
		  			function (data) {
		  				if (data.isOk == "ok") {
		  					window.location.href = "<c:url value='/orders/Orders'	/>";
		  				} else {
		  					window.location.href = "<c:url value='/orders/Orders'	/>";
		  				}
		  			},
		  		error:
		  			function (xhr, ajaxOptions, thrownError) {
		  				alert(xhr.status + "\n" + thrownError);
		  			}
		  	});
	 	}
 	
 </script>
 </head>

 <body style="background-color: #272727;">

 	<!-- ***** Preloader Start ***** -->
 	<div id="preloader">
 		<div class="jumper">
 			<div></div>
 			<div></div>
 			<div></div>
 		</div>
 	</div>
 	<!-- ***** Preloader End ***** -->
 	<!-- 下列敘述設定變數funcName的值為XXX，topMVC.jsp 會用到此變數 -->
 	<%-- <c:set var="funcName" value="XXX" scope="session"/> --%>
 	<!-- 引入共同的頁首 -->
 	<jsp:include page="/fragment/top.jsp" />

 	<!-- Page Content -->
 	<!-- Banner Starts Here -->
 	<div class="heading-page header-text">
 		<section class="page-heading">
 			<div class="container">
 				<div class="row">
 					<div class="col-lg-12">
 						<div class="text-content">
 							<h4>search("咖啡");</h4>
 							<h2>店家詳細資訊</h2>
 						</div>
 					</div>
 				</div>
 			</div>
 		</section>
 	</div>

 	<!-- Banner Ends Here -->

 	<div align="center" id="mainDiv" class="mainDiv"></div>
 	<c:if test="${!empty member }">
 	<div align="center" id="ratingDiv">
		<p style="color: white; padding-top: 30px;">你覺得這間咖啡廳怎麼樣？</p>
		<figure>
    		<img id="img1" class="i" src="<c:url value='/images/silverBean.png' />" />
    		<img id="img2" class="i" src="<c:url value='/images/silverBean.png' />" />
    		<img id="img3" class="i" src="<c:url value='/images/silverBean.png' />" />
    		<img id="img4" class="i" src="<c:url value='/images/silverBean.png' />" />
    		<img id="img5" class="i" src="<c:url value='/images/silverBean.png' />" />
   		    <figcaption class="rateColor" id="rateId"></figcaption>
   		    <input hidden="hidden" type="text" id="ratingId">
    	</figure>
    </div>
    <script>

        $(".i").mouseenter(function(){
            let rating = $(this).index()+1;
            
            for (let i=0; i<=$(this).index(); i++) {
                $(".i").eq(i).attr("src", "<c:url value='/images/goldenBean.png' />");
            }
            for( let j=$(this).index()+1; j<4; j++) {
                $(".i").eq(j).attr("src", "<c:url value='/images/silverBean.png' />");
            }
            $("#rateId").text("評分中:  "+ rating);
        })

        $(".i").mouseleave(function(){
            for(let i=0;i<5;i++) {
                $(".i").eq(i).attr("src", "<c:url value='/images/silverBean.png' />");
            }
            $("#rateId").text("");
        })

        $(".i").mousedown(function() {
            $(".i").off("mouseenter");
            $(".i").off("mouseleave");
            let rating = $(this).index()+1;
            $(".i").off("mousedown");
            $("#ratingId").val(rating);
            if ( confirm("您的評分為:  "+rating) ) {
            	var sid = ${sid};
            	var mid = ${member.member_id};
            	obj = {
        	 			"rating": rating,
        	 			"store_id": sid,
        	 			"member_id": mid
        	 		};
        	 		$.ajax({
        		  		type: 'POST',
        		  		url: '<c:url value="/addRating.do" />',
        		  		data: JSON.stringify(obj),
        		  		contentType:"application/json;charset=UTF-8",
        		  		dataType: 'json',

        		  		success:
        		  			function (data) {
        		  				if (data.isOk == "ok") {
        		  					alert("感謝評價～");
        		  					window.location.href = "<c:url value='/show/showOneStoreAjax/"+ ${sid} +"' />";
        		  				} else {
        		  					//PutMapping 修改評論 json送mid & sid FROM RatingBean where sid =sid and mid =mid
        		  					// sb.setrating(sb.getRating - rb.getRating + rating)
        		  					// rb.setRating(rating)
        		  					alert("您已評論過此店家喔～");
        		  					window.location.href = "<c:url value='/show/showOneStoreAjax/"+ ${sid} +"' />";
        		  				}
        		  			},
        		  		error:
        		  			function (xhr, ajaxOptions, thrownError) {
        		  				alert(xhr.status + "\n" + thrownError);
        		  			}
        		  	});
            }
        })    
    </script>
    </c:if>
    <c:if test="${!empty member}">
	<div align="center">
		<form>
			<div class="" style="width: 500px; text-align: left;">
				<h3 style="color: #d26900; margin: 20px">簡短一語</h3>
				<label style="color: #d26900;">名稱</label> <input disabled="disabled"
					value="${member.name}" type="email" class="form-control" id="">
			</div>
			<br>
			<div class="" style="width: 500px;">
				<textarea class="form-control" id="textareaId" rows="5" placeholder="內容" onblur="checkText()"></textarea>
			</div>
			<input type="button" class="btn btn-dark" value="確認送出" id="btn" onclick="addComment()" />
		</form>
	</div>
	<script>
		function checkText() {
			var textarea = document.getElementById("textareaId").value;
			if( textarea == null || textarea.trim().length == 0) {
				return false;
			} else {
				return true;
			}
		}
		
		function addComment() {
			if (checkText()) {
				var textarea = document.getElementById("textareaId").value;
				var sid = ${sid};
				var mid = ${member.member_id};
				var jsonData = {
						"content": textarea,
						"store_id": sid,
						"member_id": mid
				};
				var xhr = new XMLHttpRequest();
				xhr.open("POST", "<c:url value='/addComment.do' />", true);
				xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		   		xhr.send(JSON.stringify(jsonData));
		   		
				xhr.onreadystatechange = function () {
					if (xhr.readyState == 4 && ( xhr.status == 200 || xhr.status == 201 )) {
						var result = JSON.parse(xhr.responseText);
						if (result.success) {
							alert("謝謝給店家意見！\\^o^/");
							location.href = "<c:url value='/show/showOneStoreAjax/"+ ${sid} +"' />";
						}
					}
				}
			} else {
				alert("要寫一點東西喔~! >///<");
			}
		}
	</script>
	</c:if>
	<br><br>
	<div id="commentDiv" align="center"></div>
    
    <jsp:include page="/fragment/footer.jsp" />
 </body>
 </html> 