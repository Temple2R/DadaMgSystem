/**
 * Created by jian on 2017/10/29.
 */
$(()=> {
    "use strict";
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
                    $(this).html("保存");
                } else {
                    $(this).html("编辑");
                    inputList.removeClass("edit");
                    inputList.attr("disabled", true);
                }
                flag = !flag;
            });
        },
        /*
         *  @param  leftWidth:     左侧宽度
         *  @param  rightWidth:   右侧宽度
         *  @param  leftNum:       左侧数量
         *  @param   rightNum:    右侧侧数量
         * */
        // 显示教室座位
        showClassRoom(leftWidth, rightWidth, leftNum, rightNum){
            let html1 = "",
                html2 = "";
            // 动态生成左侧座位数
            for (let i = 0; i < leftNum; i++) {
                html1 += ` <li><div class='student-item'></div><p class='student-name'>小明${i + 1}</p></li>`;
            }
            $("#js-seat-left").width(leftWidth);
            $("#js-seat-left").html(html1);
            // 动态生成右侧座位数
            for (let i = 0; i < rightNum; i++) {
                html2 += ` <li><div class='student-item'></div><p class='student-name'>小明${i + 1}</p></li>`;
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
                    this.showClassRoom(200, 300, 10, 15)
                } else if (clientWidth > 767 && clientWidth < 1199) {
                    this.showClassRoom(180, 270, 10, 15);
                } else if (clientWidth < 767) {
                    this.showClassRoom(120, 180, 10, 15);
                }
                flag = false;
            } else {
                if (clientWidth > 1200) {
                    this.showClassRoom(300, 200, 15, 10)
                } else if (clientWidth > 767 && clientWidth < 1199) {
                    this.showClassRoom(270, 180, 15, 10);
                } else if (clientWidth < 767) {
                    this.showClassRoom(180, 120, 15, 10);
                }
                flag = true;
            }
        },

    };
    // 监听游览器窗口缩放后重新刷新页面防止页面失真
    $(window).resize(function () {
        // obj.changeClassRoom();
        location.reload();
    });

    // 座位点击事件

    // obj.randomStudentInfo();
    obj.editSeatInfo();
    obj.changeClassRoom();
    let seatNumV = $(".js-seat-num");//座位号
    let studentNameV = $(".js-student-name");//学生名字
    let teacherNameV = $(".js-teacher-name");//老师名字
    let certificateV = $(".js-certificate");//学历
    let majorV = $(".js-major");//专业
    let isPrimaryV = $(".js-is-primary");//是否有基础
    let sourceV = $(".js-source");//信息来源
    let situationV = $(".js-situation");//情况
    let studyTimeV = $(".js-study-time");//学习时长
    let stageV = $(".js-stage");//阶段
    let random = Math.floor(Math.random() * 1000);

    $("#js-seat-list ul li .student-item").each(function (i) {
        let This = $(this);
        This.click(function () {
//          This.addClass("disabled");
            console.log(i);
            
        });
    });

   
});