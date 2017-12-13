/**
 * Created by jian on 2017/10/29.
 */
 function getUrlParam(name){  
        //构造一个含有目标参数的正则表达式对象  
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");  
        //匹配目标参数  
        var r = window.location.search.substr(1).match(reg);  
        //返回参数值  
        if (r!=null) return unescape(r[2]);  
        return null;  
    }  
$(()=> {
    "use strict";
    var id=getUrlParam('id');
    console.log("训练营id:"+id);
    let flag = true;
    let obj = {
        // 随机生成座位表
        randomStudentInfo() {
            const addStudentInfo = $("#js-seat-list");
            let str = '';
            // 生成随机数
            let random = Math.floor(Math.random() * 20 + 10);

            for (let i = 0; i < random; i++) {
                str += `<li><div class='student-item'></div><p class='student-name'>小明${i + 1}</p></li>`;
            }
            addStudentInfo.html(str);
        },
        // 编辑学员信息
        editSeatInfo() {
            let flag = true;
            let inputList = $("#js-student-detail input");
            $("#js-edit-seat-info").click(function () {
                inputList.addClass("edit");
                inputList.attr("disabled", false);
                if (flag) {
                    $(".js-info-title").html("编辑学员信息");
                    $(this).html("保存信息");
                    $(".js-seat-num").parent().addClass("hidden");
                    $(".js-stage").parent().addClass("hidden");
                    $(".js-source").parent().addClass("hidden");
                    $(".js-student-type").removeClass("hidden");
                    $(".js-select-stage").removeClass("hidden");
                } else {
                    $(this).html("编辑订座");
                    inputList.removeClass("edit");
                    inputList.attr("disabled", true);
                    $(".js-info-title").html("学员详细信息");

                    $(".js-seat-num").parent().removeClass("hidden");
                    $(".js-stage").parent().removeClass("hidden");
                    $(".js-source").parent().removeClass("hidden");
                    $(".js-student-type").addClass("hidden");
                    $(".js-select-stage").addClass("hidden");
                }
                flag = !flag;
            });
        },
        /*
         *  @params  leftWidth:     左侧宽度
         *  @params  rightWidth:   右侧宽度
         *  @params  leftNum:       左侧数量
         *  @params   rightNum:    右侧侧数量
         * */
        // 显示教室座位
        showClassRoom(leftWidth, rightWidth, leftNum, rightNum){
            let html1 = "",
                html2 = "";
            // 动态生成左侧座位数
            for (let i = 0; i < leftNum; i++) {
                html1 += ` <li><div class='student-item' data-id='-1'></div><p class='student-name' data-id='${i+1}'>空位</p></li>`;
            }
            $("#js-seat-left").width(leftWidth);
            $("#js-seat-left").html(html1);
            // 动态生成右侧座位数
            for (let i = 0; i < rightNum; i++) {
                html2 += ` <li><div class='student-item'data-id='-1'></div><p class='student-name'data-id='${i+14}'>空位</p></li>`;
            }
            $("#js-seat-right").width(rightWidth);
            $("#js-seat-right").html(html2);

            // 添加生成座位动画
            // $("#js-seat-list li").addClass("animated fadeIn ");
        },
        // 更改教室类型
        changeClassRoom() {
            // 获取游览器宽
            let clientWidth = $(window).width();
            if (flag) {
                // 游览器宽度大于1200
                if (clientWidth > 1200) {
                    this.showClassRoom(200, 300, 14, 21)
                } else if (clientWidth > 767 && clientWidth < 1199) {
                    this.showClassRoom(180, 270, 14, 21);
                } else if (clientWidth < 767) {
                    this.showClassRoom(120, 180, 14, 21);
                }
                flag = false;
            } else {
                if (clientWidth > 1200) {
                    this.showClassRoom(300, 200, 21, 14)
                } else if (clientWidth > 767 && clientWidth < 1199) {
                    this.showClassRoom(270, 180, 21, 14);
                } else if (clientWidth < 767) {
                    this.showClassRoom(180, 120, 21, 14);
                }
                flag = true;
            }
        },

    };
    
    $.ajax({
    	type:"get",
    	url:"tofindSeat.do?id="+id,
    	success:function(msg){
    		console.log(msg.data);
    		var result=msg.data;
    		for(var i=0;i<result.length;i++){
    			var list=result[i];
    			$('#js-seat-list ul li .student-name').each(function(){
    				var idd=$(this).attr("data-id");
    				if(idd==list.seatNumber){
    					$(this).html(list.cadetName);
    					$(this).prev().attr("data-id",list.cadetId);
    					$(this).prev().css('background','green');
    				}
    			});
    		}
    		//点击选中哪个学生
    	    $("#js-seat-list ul li .student-item").on("click",function () {
    	    	let This = $(this);
    	    	let seatNum=This.next().attr("data-id");
    	    	console.log("打出点击的座位号："+seatNum);
    	        let idd=This.attr("data-id");
    	        $('#js-del-seat-info').attr("data-id",idd);
    	        $('#js-edit-seat-info').attr("data-id",idd);
    	        let teacher=$("#staffId").attr("data-id");
    	        	if(idd==-1){
    	        		$(".js-student-type").val("");//学员类型
    	        		$(".js-seat-num").val(seatNum);//座位号
        				$(".js-student-name").val("");//学生名字
        				$(".js-teacher-name").val("");//老师名字
        				$(".js-certificate").val("");//学历
        				$(".js-major").val("");//专业
        				$(".js-is-primary").val("");//是否有基础
        				$(".js-source").val("");//信息来源
        				$(".js-situation").val("");//情况
        				$(".js-study-time").val("0天");//学习时长
        				$(".js-stage").val("");//阶段
    	        	}else{
    	        		$.ajax({
    	        			type:"get",
    	        			url:"findCadetById.do?cadetId="+idd,
    	        			data:{
    	        				
    	        			},
    	        			dataType:"json",
    	        			success:function(msg){
    	        				var list=msg.data;
    	        				var getTime=new Date(list.createdTime);
    	        				var date=Math.ceil((new Date()-getTime)/1000/60/60/24);
    	        				$("#id").val(list.id);//学员id
    	        				$(".js-student-type").val(list.type);//学员类型
    	        				$(".js-seat-num").val(list.seatNumber);//学员类型
    	        				$(".js-student-name").val(list.name);//学生名字
    	        				$(".js-teacher-name").val(list.conTeacher);//老师名字
    	        				$(".js-certificate").val(list.educational);//学历
    	        				$(".js-major").val(list.profession);//专业
    	        				$(".js-is-primary").val(list.isbasics);//是否有基础
    	        				$(".js-source").val(list.source);//信息来源
    	        				$("#tt").val(list.source);
    	        				$(".js-situation").val(list.info);//情况
    	        				$(".js-study-time").val(date+'天');//学习时长
    	        				$(".js-stage").val(list.stage);//阶段
    	        				$("#dd").val(list.stage);//阶段
    	        			}
    	        		});
    	        	}
   	        	
    	        });
    	    
    	    $('#js-del-seat-info').on('click',function(){
    	    	var cadetId=$(this).attr('data-id');
    	    	console.log("输出学员id:"+cadetId);
    	    	$.ajax({
    	    		type:"post",
    	    		url:"toDelCadet.do",
    	    		data:{
    	    			id:cadetId
    	    		},
    	    		success:function(msg){
    	    			if(msg.state==1){
    	    				alert("删除成功！")
    	    				location.href="toCamp.do?id="+id;
    	    			}
    	    		}
    	    	});
    	    });
    	    //提交编辑信息
    	    $('#js-edit-seat-info').on('click',function(){
    	    	var params={
    	    	"type":$(".js-student-type").val(),//学员类型
    	        "seatNumber":$(".js-seat-num").val(),//座位号
        		"name":$(".js-student-name").val(),//学生名字
        		"conTeacher":$(".js-teacher-name").val(),//老师名字
        		"educational":$(".js-certificate").val(),//学历
        		"profession":$(".js-major").val(),//专业
        		"isbasics":$(".js-is-primary").val(),//是否有基础
        		"info":$(".js-situation").val(),//情况
        		"source":$("#tt").children('option:selected').val(),//信息来源
        		"stage":$("#dd").children('option:selected').val(),//阶段
        		"trainingCampId":id
    	    	};
    	    	console.log($('#js-edit-seat-info').html());
    	    	if($(".js-seat-num").val()==null||$(".js-seat-num").val()==""){
    	    		alert("请选择座位！");
    	    		location.href="toCamp.do?id="+id;
    	    	}
    	    	if($('#js-edit-seat-info').html()=='编辑订座'){
    	    		var cadetId=$('#js-edit-seat-info').attr('data-id')
//    	    		alert("cadetId:"+cadetId);
    	    		if(cadetId==-1){
    	    			var url="toInsertCadet.do";
    	    			$.post(url,params,function(result){
    	    				console.log(result);
    	    				if(result.state==1){
    	    					location.href="toCamp.do?id="+id;
    	    				}else{
    	    					alert("创建失败");
    	    				}
    	    			});
    	    		}else{
    	    			params.id=$("#id").val();//学员id
    	    			var url="toChangeCadet.do";
    	    			$.post(url,params,function(result){
    	    				console.log(result);
    	    				if(result.state==1){
    	    					location.href="toCamp.do?id="+id;
    	    				}else{
    	    					alert("修改失败");
    	    				}
    	    			});
    	    		}
    	        }///点击结束
    	    });
    	},
  	error:function(e){
    		
    	}
  });
    // 监听游览器窗口缩放后重新刷新页面防止页面失真
    $(window).resize(function () {
        // obj.changeClassRoom();
        location.reload();
    });

    // 座位点击事件

 // obj.randomStudentInfo();
    obj.editSeatInfo();
    obj.changeClassRoom();
});
