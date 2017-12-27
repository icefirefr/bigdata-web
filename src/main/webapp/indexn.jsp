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
				<form class="form-horizontal" id="form" action="/datasn">
					<div class="form-group">
						<label for="siteid" class="col-sm-2 control-label">场站</label>
						<div class="col-sm-10">
							<select  class="form-control" id="siteid" name="siteId">
								<option value="xs">香山</option>
								<option value="sw">沙洼</option>
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
						<label for="siteid" class="col-sm-2 control-label">数据量</label>
						<div class="col-sm-10">
							<input type="text" name="pagecount"  class="form-control" id="pagecount" placeholder="" value="100"/>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
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
                    $devids.empty();
                    if (site == "xs") {
                        addOptions($devids, [110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 120, 121, 1, 122, 2, 123, 3, 124, 4, 125, 5, 126, 6, 127, 7, 128, 8, 129, 9, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 50, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109]);
                    } else {
                        addOptions($devids, [22, 23, 24, 25, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 1, 2, 3, 4, 5, 6, 7, 8, 9, 20, 21]);
                    }

                });

                function initDate() {
                    var val = $('input[name="timerange"]').val();
                    if (val != null && val != "") {
                        var ss = val.split("-");
                        var start = ss[0].trim().split(' ');
                        // var end = ss[1].trim().split(' ');
                        $('input[name="start"]').val(start[0] + " " + timeChange(start));
                        // $('input[name="end"]').val(end[0] + " " + timeChange(end));
                    }
                }

                function initOption() {
                    addOptions($devids, [110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 120, 121, 1, 122, 2, 123, 3, 124, 4, 125, 5, 126, 6, 127, 7, 128, 8, 129, 9, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 50, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109]);
                }

                function defaultDate() {
                    $('input[name="timerange"]').val(moment().format('YYYY/MM/DD hh:mm:ss A'));
                }

                defaultDate();

                initDate();
                initOption();

                function timeChange(end) {
                    if (end[2] == 'PM') {
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
                    timePicker : true,
                    singleDatePicker : true,
                    timePickerIncrement : 30,
                    showDropdowns : true,
                    startDate : '2017/06/01',
                    defaultDate : new Date(),

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

                timerange.on("apply.daterangepicker", function(e) {
                    initDate();
                });
                timerange.on("hide.daterangepicker", function(e) {
                    initDate();
                });

            });

		</script>
	</body>
</html>
