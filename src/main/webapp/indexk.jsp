<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<link rel="stylesheet" type="text/css" href="/assets/bootstrap3/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="/assets/bootstrap3/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css">
		<style>
			body {
				padding: 0px;
				margin: 0px;
			}
			.row {
				margin: 0 0 0 0;
			}
			.form-horizontal .form-group {
				margin-left: 0px;
				margin-right: 0px;
			}

			.form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
				 cursor: default; 
				background-color: #eeeeee;
			}
		</style>

		<div class="container-fluid" style="padding: 0px;">
			<div class="row">
				<form class="form-horizontal" id="form" action="/datas">
					<div class="form-group">
						<label for="siteid" class="col-sm-2 control-label">场站</label>
						<div class="col-sm-10">
							<select  class="form-control" id="siteid" name="siteId">
								<option value="xs">香山</option>
								<option value="sw">沙洼</option>
								<option value="stp">三台坡</option>
								<option value="ap">阿普</option>
								<option value="xyd">夏营地</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">设备id</label>
						<div class="col-sm-10">
							<select name="devid" class="form-control" id="devid" name="siteId"></select>
						</div>
					</div>
					<div class="form-group">
						<label for="siteid" class="col-sm-2 control-label">时间范围</label>
						<div class="col-sm-10">
							<input type="text" name="timerange"  class="form-control" id="start" placeholder="" readonly="true"/>
						</div>
					</div>
					
					<div class="form-group">
						<label for="siteid" class="col-sm-2 control-label">分页时间间隔(小时)</label>
						<div class="col-sm-10">
							<input type="text" name="pagecount"  class="form-control" id="pagecount" placeholder="" value="3"/>
						</div>
					</div>
					
					

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-5">
							<button type="submit" class="btn btn-default">
								查询
							</button>
							<a class="btn btn-default" onclick="window.location.href='/index.jsp'">返回主页</a>
						</div>
					</div>
					<input type="hidden" name="max"  class="form-control" id="max" placeholder="" value="-1"/>
					<input type="hidden" name="start"  class="form-control" id="inputPassword3" placeholder=""/>
					<input type="hidden" name="end"  class="form-control" id="inputPassword4" placeholder=""/>
				</form>
			</div>
		</div>

		<div class="hidden">

			<div id="xs">
				<option value=""></option>
			</div>

		</div>

		<script src="/assets/js/jquery.js"></script>
		<script src="/assets/bootstrap3/js/bootstrap.js"></script>
		<script src="/assets/bootstrap3/plugins/bootstrap-daterangepicker/moment.js"></script>
		<script src="/assets/bootstrap3/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
		<script>
            $(function() {
                function startDate() {
                    return "";
                }

                function endDate(e) {
                    alert(e);
                }

                var option = ['<option value="zhi">name</option>'].join("");
                function getOption(val, name) {
                    var $html = null;
                    html = option.replace(/zhi/g, val).replace(/name/g, name);
                    $html = $(html);
                    return $html;
                }

                function addOptions($elments, datas) {
                    for (var i = 0; i < datas.length; i++) {
                        var selected = false;
                        var elments = getOption(datas[i], datas[i]);
                        $elments.append(elments);
                    }
                }

                $devids = $("select[name='devid']");
                $('select[name="siteId"]').change(function() {
                    var site = $(this).val();
                    console.log("------------------------------------");
                    console.log(site);
                    $devids.empty();
                    if (site == "xs") {
                        addOptions($devids, [110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 120, 121, 1, 122, 2, 123, 3, 124, 4, 125, 5, 126, 6, 127, 7, 128, 8, 129, 9, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 50, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109]);
                    } else if(site == "xyd"){
                    	addOptions($devids, ['1_29','1_28','1_27','1_26','1_25','1_24','3_48','3_49','3_40','3_41','3_42','3_43','3_45','3_46','3_47','1_23','1_22','1_21','1_20','1_39','1_38','1_37','3_1','1_36','3_2','1_35','3_3','3_4','3_5','3_6','3_7','3_8','3_9','3_51','1_34','1_33','1_32','1_31','1_30','3_50','1_49','1_48','1_47','1_46','2_14','2_15','2_16','2_17','2_18','2_19','2_10','2_11','2_12','2_13','1_45','1_44','1_43','1_42','1_41','1_40','2_1','2_2','2_3','2_4','2_25','2_5','2_26','2_6','2_27','2_7','2_28','2_8','2_29','2_9','2_20','2_21','2_22','2_23','2_24','1_53','1_50','2_36','2_37','2_38','2_39','2_30','2_31','2_32','2_33','2_34','2_35','1_1','1_2','1_3','1_4','1_5','1_6','2_47','3_15','1_7','2_48','3_16','1_8','2_49','3_17','1_9','3_18','3_19','2_40','2_41','2_42','3_10','2_43','3_11','2_44','3_12','2_45','3_13','2_46','3_14','3_26','3_27','3_28','3_29','2_50','3_20','3_21','3_22','3_23','3_24','3_25','1_19','1_17','1_16','1_15','1_14','1_13','3_37','3_38','3_39','3_30','3_31','3_32','3_33','3_34','3_35','3_36','1_12','1_11','1_10']);
                    }else if(site == "ap"){
                    	addOptions($devids, [44,45,46,47,48,49,50,51,52,53,10,54,11,55,12,56,13,57,14,58,15,16,17,18,19,1,2,3,4,5,6,7,8,9,60,61,62,63,20,64,21,65,22,66,23,67,24,68,25,69,27,28,29,70,71,72,73,30,74,75,32,33,34,35,36,37,38,39,41,42]);
                    }else if(site == "stp"){
                    	addOptions($devids, [115,116,119]);
                    }else if(site == "sw"){
                        addOptions($devids, [22, 23, 24, 25, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 1, 2, 3, 4, 5, 6, 7, 8, 9, 20, 21]);
                    }

                });

                function initDate() {
                    var val = $('input[name="timerange"]').val();
                    if (val != null && val != "") {
                    	var ss = val.split("-");
                    	var start = ss[0].trim().split(' ');
                    	var end = ss[1].trim().split(' ');
                        $('input[name="start"]').val(start[0] + " " + timeChange(start));
                        $('input[name="end"]').val(end[0] + " " + timeChange(end));
                    }

                }

                function initOption() {
                    addOptions($devids, [110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 120, 121, 1, 122, 2, 123, 3, 124, 4, 125, 5, 126, 6, 127, 7, 128, 8, 129, 9, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 50, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109]);
                }

                initDate();
                initOption();
                
                function timeChange(end){
                	if(end[2] == 'PM'){
                		var ti = end[1];
                		var ts = ti.split(':');
                		var h = Number(ts[0]) + 12;
                		var ss = h + ":" + ts[1] + ":" + ts[2];
                		return ss;
                	}
                	return end[1];
                }

                var timerange = $('input[name="timerange"]').daterangepicker({
                    format : 'YYYY/MM/DD hh:mm:ss A',
                    timePicker:true,
                    timePickerIncrement: 30,
                    showDropdowns: true,  
                    startDate : '2017/06/01',
                    endDate : '2017/06/02',
                    locale : {
                        applyLabel : '确认',
                        cancelLabel : '取消',
                        fromLabel : '从',
                        toLabel : '到',
                        weekLabel : 'W',
                        customRangeLabel : 'Custom Range',
                        daysOfWeek : ["日", "一", "二", "三", "四", "五", "六"],
                        monthNames : ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
                    }
                }, function(start, end, label) {
                    // alert('A date range was chosen: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                    // $('input[name="start"]').val(start.format('YYYY/MM/DD HH:MM:ss'));
                    // $('input[name="end"]').val(end.format('YYYY/MM/DD HH:MM:ss'));
                });
                
                timerange.on("apply.daterangepicker",function(e){
                	initDate();
                });
                timerange.on("hide.daterangepicker",function(e){
                	initDate();
                });
            });

		</script>
	</body>
</html>
