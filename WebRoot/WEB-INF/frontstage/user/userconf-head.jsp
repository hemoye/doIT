<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>爱智网</title>
		<link rel="stylesheet" href="<%=basePath %>frontstage/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=basePath %>frontstage/css/font-awesome.min.css">
	    <link rel="stylesheet" href="<%=basePath %>frontstage/css/global.css" />
	    <link rel="stylesheet" href="<%=basePath %>frontstage/css/public/userconf.css" />
	    <script type="text/javascript" src="<%=basePath %>frontstage/js/jquery-1.10.2.min.js" ></script>
	    <script src="<%=basePath %>frontstage/js/bootstrap.min.js"></script>
	    <script src="<%=basePath %>frontstage/js/global.js"></script>
	    <script type="text/javascript" src="<%=basePath %>frontstage/js/public/userconf.js" ></script>
	    <script type="text/javascript" src="<%=basePath %>frontstage/js/user/userconf.js" ></script>
	</head>
	<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	<div class="container" id="main">
		<div class="row">
			<div class="col-lg-3 col-md-3 col-xs-12" style="width: 22%;" id="sidebar">
				<ul class="list-group">
				  <li class="list-group-item"><a href="userInfo/userInfoUI.action">个人资料</a></li>
				  <li class="list-group-item active"><a href="javascript:void(0)">头像设置</a></li>
				  <li class="list-group-item"><a href="userInfo/emailUI.action">邮箱验证</a></li>
				  <li class="list-group-item"><a href="userInfo/pwdUI.action">修改密码</a></li>
				</ul>
				<div class="sidebar-sign" style="top:0px"></div>
			</div>
			<div class="col-lg-8 col-md-8 col-xs-12" id="content">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="setting-right-wrap wrap-boxes settings">
							<div id="setting-avator" class="setting-wrap setting-avator clearfix">
								<div class="avator-img pull-left">
									<div class="head-img"><img id="userHead" src="${model.userHead }" width="220" height="220"></div>
									<div class="head-change"><a class="head-change-btn" href="javascript:changeHead()"><span class="fa fa-refresh"></span>&nbsp;换一换</a></div>
								</div>
								<div class="avator-btn-group">
									<div id="avator-btns" class="avator-btn-inner">
								        <div class="avator-btn-wrap">
											<form target="uploadtarget" id="uploadHead" action="userInfo/headupload.action" method="post" enctype="multipart/form-data">
									            <a href="javascript:void(0)" hidefocus="true" class="avator-btn-fake">上传头像</a>
									            <input type="file" title="上传头像" name="myFile" id="upload" onchange="changed()" >
									            <input type="hidden" name="type" value="1">
								            </form>
							                <iframe src="about:blank" id="uploadtarget" name="uploadtarget" frameborder="0" ></iframe>
								        </div>
									</div>
									<div class="avator-upload-wrap _save" style="display:none;">
										<span hidefocus="true" id="avator-btn-save" aria-role="button" class="rlf-btn-green btn-block">保存</span>
									</div>
								</div>
							</div>
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<footer id="divFooter">
		<div class="container">
			<div class="row rowLinkLogo">
				<div class="col-md-3 col-xs-4 col-sm-3 col-lg-3 leftLink">
					<ul>
						<li><a href="#">学院概况</a>	</li>
						<li><a href="#">教育教学</a>	</li>
						<li><a href="#">科学研究</a></li>
						<li><a href="#">学生工作</a></li>
						<li><a href="#">招生就业</a></li>
						<li><a href="#">专业介绍</a></li>
					</ul>
				</div>
				<div class="col-md-6 col-xs-4 col-sm-6 col-lg-6 centerLogo">
					<center>
						<img class="img-responsive" src="img/logoBottom.png">
					</center>
					<p>0744-8358630 | 0744-8202008
						<br><a href="#">jsdxrjxy@163.com</a>
					</p>
				</div>
				<div class="col-md-3 col-xs-4 col-sm-3 col-lg-3 rightLink">
					<ul>
						<li><a href="#">吉首大学</a></li>
						<li><a href="#">中软国际</a></li>
						<li><a href="#">中软国际ETC</a></li>
						<li><a href="#">青软实训</a></li>
						<li><a href="#">苏软实训</a></li>
						<li><a href="#">深圳软酷</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="divCopyright">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12 col-lg-12">
						<center>地址：湖南省张家界市子午路 | 版权所有：吉首大学软件服务外包学院</center>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<div class="modal fade" id="userRegist" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title">
	          <span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;用户注册
	        </h4>
	      </div>
	      <form id="frmUserRegist" class="form-horizontal">
	        <div class="modal-body">
	          <div class="form-group">
	            <label for="input01" class="col-md-2 control-label">用户名</label>
	            <div class="col-md-10">
	              <input type="text" name="userName" class="form-control" id="input01" title="字母、数字、汉字皆可" 
	                  placeholder="字母、数字、汉字皆可">
	                  <span class="icon-ok"></span>
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="input02" class="col-md-2 control-label">邮箱</label>
	            <div class="col-md-10">
	              <input type="email" name="userEmail" class="form-control" id="input02" title="请输入你的邮箱" placeholder="请输入你的邮箱" >
	                <span class="icon-remove"></span>
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="input03" class="col-md-2 control-label">密码</label>
	            <div class="col-md-10">
	              <input type="password" name="userPwd" class="form-control" id="input03" title="请输入你的密码"
	                  placeholder="请输入你的密码" >
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="input04" class="col-md-2 control-label">确认密码</label>
	            <div class="col-md-10">
	              <input type="password" name="confirmPassword" class="form-control" id="input04" title="请再次输入你的密码"
	                placeholder="请再次输入你的密码" >
	            </div>
	          </div>
	          <div class="modal-footer">
	            <div class="form-group">
	              <div class="col-md-10 pull-right">
	                <input type="submit" class="btn btn-primary" value="注册">
	                <input type="reset" class="btn btn-primary" value="重置">
	              </div>
	            </div>
	          </div>
	        </div>
	      </form>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<div class="modal fade" id="userLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-xs">
	    <div class="modal-content">
	      <div class="modal-body">
	        <form id="frmUserLogin" action="#" class="form-horizontal">
	          <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	            <h4 class="modal-title">
	              <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;用户登录
	            </h4>
	          </div>
	          <div class="modal-body">
	            <div class="form-group">
	              <label for="inputuserName" class="col-md-2 control-label">用户名</label>
	              <div class="col-md-10">
	                <input type="text" name="userName" class="form-control" id="inputuserName" placeholder="用户名/手机号/邮箱账号" >
	                  <span class="icon-remove"></span>
	              </div>
	            </div>
	            <div class="form-group">
	              <label for="inputuserPwd" class="col-md-2 control-label">密码</label>
	              <div class="col-md-10">
	                <input type="password" name="userPwd" class="form-control" id="inputuserPwd" placeholder="密码" >
	                  <span class="icon-remove"></span>
	              </div>
	            </div>
	            <p>
	              <label class="checkbox-inline">
	                <input type="checkbox" />十天内免登录
	              </label>
	            </p>
	          </div>
	          <div class="modal-footer">
	            <div class="form-group">
	              <button type="submit" class="btn btn-primary" id="loginBtn" name="login">登录</button>
	            </div>
	          </div>
	        </form>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!-- 回到顶部 -->
	<div id="goTop" class="elevator">
	    <!-- <a class="elevator-diaocha" href="/activity/diaocha" target="_blank" id="feedBack"></a> -->
	    <a class="elevator-weixin" href="javascript:;">
	        <div class="elevator-weixin-box">
	        </div>
	    </a>
	    <a class="elevator-msg" href="javascript:;" target="_blank" id="feedBack"></a>
	    <a class="elevator-app" href="javascript:;">
	        <div class="elevator-app-box">
	        </div>
	    </a>
	    <a class="elevator-top" href="javascript:;" id="backTop"></a>
	</div>
	</body>
</html>
