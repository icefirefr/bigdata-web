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
					<div class="col-md-2">
						<a class="btn btn-default" onclick="window.location.href='/indexk.jsp'">返回主页</a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-sm-offset-2 col-md-offset-2">
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
							<span>结束时间</span>
							<span>${end}</span>
						</div>
						<div class="col-md-4">
							<span>查询行数</span>
							<span>${size}</span>
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
		pagecount <c:out value="${pagecount}"></c:out>
		<br />

		size <c:out value="${pages}"></c:out>
		<br />

		siteId <c:out value="${siteId}"></c:out>
		<br />

		devid <c:out value="${devid}"></c:out>
		<br />
		currentpage <c:out value="${currentpage}"></c:out>
		<br />

		start <c:out value="${start}"></c:out>--%>

		<nav aria-label="Page navigation" id="nav">
			<ul class="pagination">
				<c:forEach var="page" begin="1" end="${pages}" >
					<li>
						<a href="#" class="active">${page}</a>
					</li>
				</c:forEach>
				<li>
					<a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a>
				</li>
			</ul>
		</nav>

		<div id="form">
			<form id="formpages" action="/pages" class="hidden">
				<input type="hidden" name="siteId"  class="form-control" id="siteId" placeholder="" value="${siteId}"/>
				<input type="hidden" name="devid"  class="form-control" id="devid" placeholder="" value="${devid}"/>
				<input type="hidden" name="start"  class="form-control" id="start" placeholder="" value="${start}"/>
				<input type="hidden" name="pagecount"  class="form-control" id="pagecount" placeholder="" value="${pagecount}"/>
				<input type="hidden" name="currentpage"  class="form-control" id="currentpage" placeholder="" value="${currentpage}"/>
				<input type="hidden" name="pages"  class="form-control" id="pages" placeholder="" value="${pages}"/>
			</form>
		</div>

		<script src="/assets/js/jquery.js"></script>
		<script src="/assets/js/jquery.form.js"></script>
		<script src="/assets/js/bootstrap.js"></script>

		<script>
            $(function() {
                $("#nav ul li a").click(function() {
                    var pageNo = $(this).text();
                    $("input[name='currentpage']").val(pageNo);
                    $("#formpages").submit();
                });
            });
		</script>
	</body>
</html>
