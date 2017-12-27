<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>查询结果</title>
	</head>
	<body>
		<link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="/assets/css/bootstrap-theme.css">
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
			.datas {
				white-space: nowrap
			}
		</style>

		<div class="container-fluid" style="padding: 0px;">

			<div class="container-fluid" style="padding: 0px;">
				<div class="row">
					<div class="col-md-10 col-sm-offset-2 col-md-offset-2">
						<div class="col-md-2">
							<a class="btn btn-default" onclick="window.location.href='/indexn.jsp'">返回主页</a>
						</div>
						<div class="col-md-2">
							<span>场站</span>
							<span>${siteId}</span>
						</div>
						<div class="col-md-2">
							<span>设备id</span>
							<span>${devid}</span>
						</div>
						<div class="col-md-2">
							<span>开始时间</span>
							<span>${start}</span>
						</div>
						<div class="col-md-2">
							<span>查询行数</span>
							<span>${size}</span>
						</div>

						<div class="col-md-2">
							<a class="btn btn-default" id="nextPage">下一页</a>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-10 col-sm-offset-2 col-md-offset-2">
					<div class="table-responsive ">

						<table class="table table-bordered datas">
							<thead>
								<tr>
									<c:forEach var="tr" items="${table.headers}" >
										<th>${tr}</th>
									</c:forEach>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="rs" items="${table.datas}" >
									<tr>
										<c:forEach var="cell" items="${rs}" >
											<td>${cell}</td>
										</c:forEach>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<%--
		startRow <c:out value="${startRow}"></c:out>
		<br />

		starts <c:out value="${starts}"></c:out>
		<br />

		siteId <c:out value="${siteId}"></c:out>
		<br />

		devid <c:out value="${devid}"></c:out>
		<br />
		start <c:out value="${start}"></c:out>
		--%>
		<div id="form">
			<form id="formpages" action="/datasn" class="hidden">
				<input type="hidden" name="siteId"  class="form-control" id="siteId" placeholder="" value="${siteId}"/>
				<input type="hidden" name="devid"  class="form-control" id="devid" placeholder="" value="${devid}"/>
				<input type="hidden" name="startRow"  class="form-control" id="start" placeholder="" value="${startRow}"/>
				<input type="hidden" name="pagecount"  class="form-control" id="pagecount" placeholder="" value="${pagecount}"/>
				<input type="hidden" name="currentpage"  class="form-control" id="currentpage" placeholder="" value="${currentpage}"/>
				<input type="hidden" name="starts"  class="form-control" id="starts" placeholder="" value="${starts}"/>
			</form>
		</div>

		<script src="/assets/js/jquery.js"></script>
		<script src="/assets/js/jquery.form.js"></script>
		<script src="/assets/js/bootstrap.js"></script>

		<script>
            $(function() {
                $("#nextPage").click(function() {
                    // var pageNo = $(this).text();
                    // $("input[name='startRow']").val(startRow);
                    $("#formpages").submit();
                });
            });
		</script>
	</body>
</html>
