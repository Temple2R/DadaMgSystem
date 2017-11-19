/**
 * Created by jian on 2017/11/11.
 */
$(function () {
    "use strict";
    $.ajax({
        type: 'GET',
        url: 'findTeacher.do',
        data: {
        },
        success: function (msg) {
         let html = '';
       	 for (var i = 0; i < msg.data.length; i++) {
                var list = msg.data[i];
                console.log(list);
                html +=`
                <tr class="">
                <td>
                    <div><input type="checkbox" class="checkbox" name='checkItem' value='${list.id}'></div>
                </td>
                <td>${list.enumber}</td>
                <td>${list.name}</td>
                <td>${list.sex}</td>
                <td>${list.skillDirection}</td>
                <td>${list.deptno}</td>
                <td>${list.position}</td>
                <td>${list.entryTime}</td>
                <td>${list.email}</td>
                <td>${list.userPhone}</td>
                <td>
                    <a target="edit-dialog" class="btn btn-primary btn-xs js-edit-staff" data-toggle="tooltip" data-placement="left"
                       title="编辑" data-id='${list.id}'><i class="glyphicon glyphicon-pencil"></i></a>
                    <button class="btn btn-danger btn-xs js-del-staff" data-toggle="tooltip" data-placement="right"
                            title="删除" data-id='${list.id}'><i class="glyphicon glyphicon-trash"></i></button>
                </td>
            </tr>
                `;
       	 };
        $(".js-tbody").html(html);
    //框    
    $(("#js-table input")).iCheck({
         checkboxClass: 'icheckbox_square-blue',
    });    
    // 添加员工
    $("#js-add-staff").click(function () {
        addStaff();
    });
    //  编辑员工
    $(".js-edit-staff").click(function () {
        editStaff($(this).attr("data-id"));
    });
    //  批量删除员工
    $(".js-batch-del").click(function () {
    	  var checkedIds=getCheckedIds();
    	  batchDelStaff(checkedIds);
    });
    //  删除单个员工员工
    $(".js-del-staff").click(function () {
        delStaff($(this).attr("data-id"));
    });
    
    (function () {
        var allSelect = $(".js-all-select");
        var inputList = $(".js-tbody input");
        allSelect.on("ifChanged ifUnchecked", function (event) {
            if (event.type == 'ifChanged') {
                inputList.iCheck("check");
            } else {
                inputList.iCheck("uncheck");
            }
        });
    })();
        },
        error: function () {

        }
    });
});

function getCheckedIds(){
	var checkedIds="";
	$(".js-tbody input[name=checkItem]").each(function(){
		if($(this).prop("checked")){
			if(checkedIds==""){
				checkedIds+=$(this).val();
			}else{
				checkedIds+=","+$(this).val();
			}
		}
	});
	console.log("得到要删除的id"+checkedIds);
	return checkedIds;
}


function addStaff() {
    BootstrapDialog.show({
        title: "添加员工",
        message: function (dialog) {
            var $message = $('<div></div>');
            var pageToLoad = dialog.getData('pageToLoad');
            $message.load(pageToLoad);
            return $message;
        },
        data: {
            'pageToLoad': 'toAddStaff.do'
        },
        buttons: [
            {
                label: "取消", cssClass: "btn-default",
                action: function (cancel) {
                    cancel.close();
                }
            },
            {
                label: "确定", cssClass: "btn-primary",
//                action:function(){
//                	$(this).submit();
//                	alert("ddd");
//                }

            },

        ]
    });
}

function editStaff(e) {
    BootstrapDialog.show({
        title: "编辑员工",
        message: function (dialog) {
            var $message = $('<div></div>');
            var pageToLoad = dialog.getData('pageToLoad');
            $message.load(pageToLoad);
            return $message;
        },
        data: {
            'pageToLoad': 'tofindStaffById.do?id='+e
        },
        buttons: [
            {
                label: "取消", cssClass: "btn-default",
                action: function (cancel) {
                    cancel.close();
                }
            },
            {
                label: "确定", cssClass: "btn-primary",

            }]
    });
}

function delStaff(e) {
    BootstrapDialog.show({
        title: "删除员工",
        message: "确认删除此员工?",
        size: BootstrapDialog.SIZE_SMALL,
        type: BootstrapDialog.TYPE_DANGER,
        buttons: [
            {
                label: "取消", cssClass: "btn-default",
                action: function (cancel) {
                    cancel.close();
                }
            }, {
                label: "确定", cssClass: "btn-primary",
                action: function (cancel) {
                	  console.log(e);
	        		  location.href="toDelStaff.do?id="+e;
	        		  cancel.close();
	        	  }
            }]
    });
}

function batchDelStaff(checkedIds) {
	var text="";
	if(checkedIds==""){
		text="请至少选择一个！";
	}else{
		text="确认删除选中的员工?";
	}
    BootstrapDialog.show({
        title: "删除员工",
        message:text,
        size: BootstrapDialog.SIZE_SMALL,
        type: BootstrapDialog.TYPE_DANGER,
        buttons: [
            {
                label: "取消", cssClass: "btn-default",
                action: function (cancel) {
                    cancel.close();
                }
            }, {
                label: "确定", cssClass: "btn-primary",
                action: function (cancel) {
                	if(checkedIds==""){
                		cancel.close();
                	}else{
                		var url="batchDelStaff.do";
                		var params={"checkedIds":checkedIds};
                		$.post(url,params,function(msg){
                			console.log("打出来看一下："+msg);
                			if(msg.state==1) 
                				location.href="toUserMge.do";
                		});
                		cancel.close();
                	}
	        	  }
            }]
    });
}