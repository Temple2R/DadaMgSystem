/**
 * Created by Administrator on 2017/11/11.
 */
$(function () {
    //加载训练营到主页面
    $.ajax({
    	 type: 'GET',
         url: 'findCamp.do',
         data: {},
         success: function (msg) {
             let html = '';
             for (var i = 0; i < msg.data.length; i++) {
                 var list = msg.data[i];
                 console.log(list);
                 html +=`
                 <li class='list-unstyled item1' >
                 <section class='col-lg-3 col-md-6 col-sm-6 col-xs-12 index-item' data-id='${list.id}'>
                     <div class='training-camp'>
                         <div class='training-camp-img'></div>
                         <div class='training-camp-title'>
                             <h3 class='pull-left'>${list.classType}</h3>
                             <div class='action text-right mr10'>
                                 <a href='findIdCamp.do?id=${list.id}' class='btn btn-primary'><i class='fa fa-edit'></i>编辑</a>
                                 <button class='btn btn-danger js-del-train-camp' data-id='${list.id}'><i class='fa fa-trash'></i>删除</button>
                             </div>
                         </div>
                         <div class='teacher'>
                             <div class='row'>
                                 <div class='col-xs-12 teacher-info text-left'>
                                     <div class='teacher-item'>
                                         <span class=''>讲 师 姓 名：</span>
                                         <span class=''>${list.teacherName}</span>
                                     </div>
                                     <div class='teacher-item'>
                                         <span class=''>讲 师 电 话：</span>
                                         <span>${list.teacherPhone}</span>
                                     </div>
                                     <div class='teacher-item'>
                                         <span class=''>所属产品线：</span>
                                         <span>${list.productLine}</span>
                                     </div>
                                     <div class='teacher-item'>
                                         <span class=''>创 建 时 间：</span>
                                         <span>${list.createdTime}</span>
                                     </div>
                                     <div class='teacher-item'>
                                         <span class=''>班 级 人 数：</span>
                                         <span>100人</span>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </section>
             </li>
             `;
             }
             $('#js-camp-ul').html(html);
             
             $(".index-item").click(function () {
            	 var id=$(this).attr('data-id');
         		location.href = "toCamp.do?id="+id;
         	 })
         	 //点击删除训练营
         	$(".js-del-train-camp").click(function (e) {
        		console.log(1111);
        		var This = $(this);
        		e.stopPropagation();
        		BootstrapDialog.show({
        			title: "删除训练营",
        			message: "确认删除此训练营?",
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
        			        		  var id=This.attr("data-id");
        			        		  location.href="toDelCamp.do?id="+id;
        			        		  cancel.close();
        			        	  }
        			          }]
        		});
        	});
         }
    });
});
