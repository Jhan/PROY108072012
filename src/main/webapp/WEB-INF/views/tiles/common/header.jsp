<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	<header>
	<div class="container_12">
	</div></header>

	<nav id="main-nav">
		
		<ul class="container_12">
			<li page="inicio" class="home current"><a href="javascript:void(0)" title="Inicio">Inicio</a>
				<ul>
					<li class="current"><a href="javascript:void(0)" title="Inicio">Inicio</a></li>
					<!--<li><a href="javascript:void(0)" title="Mi perfil">Mi perfil</a></li> -->
				</ul>
			</li>
			<security:authorize access="hasRole('ROLE_MEDICO')">	
			<li page="pacientesAsignados" class="users"><a href="javascript:void(0)" title="Pacientes">Pacientes</a>
				<ul>
					<li><a href="javascript:void(0)" title="Browse">Pacientes</a></li>
				</ul>
			</li>
			</security:authorize>
			<li page="agenda" class="agenda"><a href="javascript:void(0)" title="Agenda">Agenda</a>
				<ul><li><a href="javascript:void(0)" title="Agenda">Agenda</a></li>
					<!--<li><a href="javascript:void(0)" title="Articles">Articles</a></li>
					<li><a href="javascript:void(0)" title="Add article">Add article</a></li>
					<li><a href="javascript:void(0)" title="Posts">Posts</a></li>
					<li><a href="javascript:void(0)" title="Add post">Add post</a></li> -->
				</ul>
			</li>
		</ul>
	</nav>
	<div id="sub-nav"><div class="container_12">
		
		<a href="javascript:void(0)" title="Help" class="nav-button"><b>Ayuda</b></a>
	
		<!-- <form id="search-form" name="search-form" method="post" action="http://www.display-inline.fr/demo/constellation/template/search.php">
			<input type="text" name="s" id="s" value="" title="Search admin..." autocomplete="off">
		</form> -->
	
	</div></div>
	<div id="status-bar"><div class="container_12">
	
		<ul id="status-infos">
			<li class="spaced">Bienvenido <strong>Admin</strong></li>
			<li>
				<a href="javascript:void(0)" class="button" title="5 messages"><img src="img/icons/fugue/mail.png" width="16" height="16"> <strong>5</strong></a>
				<div id="messages-list" class="result-block">
					<span class="arrow"><span></span></span>
					
					<ul class="small-files-list icon-mail">
						<li>
							<a href="javascript:void(0)"><strong>10:15</strong> Please update...<br>
							<small>From: System</small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Yest.</strong> Hi<br>
							<small>From: Jane</small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Yest.</strong> System update<br>
							<small>From: System</small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>2 days</strong> Database backup<br>
							<small>From: System</small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>2 days</strong> Re: bug report<br>
							<small>From: Max</small></a>
						</li>
					</ul>
					
					<p id="messages-info" class="result-info"><a href="javascript:void(0)">Go to inbox &raquo;</a></p>
				</div>
			</li>
			<li>
				<a href="javascript:void(0)" class="button" title="25 comments"><img src="img/icons/fugue/balloon.png" width="16" height="16"> <strong>25</strong></a>
				<div id="comments-list" class="result-block">
					<span class="arrow"><span></span></span>
					
					<ul class="small-files-list icon-comment">
						<li>
							<a href="javascript:void(0)"><strong>Jane</strong>: I don't think so<br>
							<small>On <strong>Post title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Ken_54</strong>: What about using a different...<br>
							<small>On <strong>Post title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Jane</strong> Sure, but no more.<br>
							<small>On <strong>Another post</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Max</strong>: Have you seen that...<br>
							<small>On <strong>Post title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Anonymous</strong>: Good luck!<br>
							<small>On <strong>My first post</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Sébastien</strong>: This sure rocks!<br>
							<small>On <strong>Another post title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>John</strong>: Me too!<br>
							<small>On <strong>Third post title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>John</strong> This can be solved by...<br>
							<small>On <strong>Another post</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Jane</strong>: No prob.<br>
							<small>On <strong>Post title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Anonymous</strong>: I had the following...<br>
							<small>On <strong>My first post</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Anonymous</strong>: Yes<br>
							<small>On <strong>Post title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Lian</strong>: Please make sure that...<br>
							<small>On <strong>Last post title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Ann</strong> Thanks!<br>
							<small>On <strong>Last post</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Max</strong>: Don't tell me what...<br>
							<small>On <strong>Post title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Gordon</strong>: Here is an article about...<br>
							<small>On <strong>My another post</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Lee</strong>: Try to reset the value first<br>
							<small>On <strong>Last title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Lee</strong>: Sure!<br>
							<small>On <strong>Second post title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Many</strong> Great job, keep on!<br>
							<small>On <strong>Third post</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>John</strong>: I really like this<br>
							<small>On <strong>First title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Paul</strong>: Hello, I have an issue with...<br>
							<small>On <strong>My first post</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>June</strong>: Yuck.<br>
							<small>On <strong>Another title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Jane</strong>: Wow, sounds amazing, do...<br>
							<small>On <strong>Another title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Esther</strong>: Man, this is the best...<br>
							<small>On <strong>Another post</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>Max</strong>: Thanks!<br>
							<small>On <strong>Post title</strong></small></a>
						</li>
						<li>
							<a href="javascript:void(0)"><strong>John</strong>: I'd say it is not safe...<br>
							<small>On <strong>My first post</strong></small></a>
						</li>
					</ul>
					
					<p id="comments-info" class="result-info"><a href="javascript:void(0)">Manage comments &raquo;</a></p>
				</div>
			</li>
			<li><a href="<%=request.getContextPath()%>/j_spring_security_logout" class="button red" title="Cerrar Sesión"><span class="smaller">Cerrar Sesión</span></a></li>
		</ul>
		
		<!-- v1.5: you can now add class red to the breadcrumb -->
		<ul id="breadcrumb">
			<li><a href="javascript:void(0)" title="Home">Inicio</a></li>
			<!-- <li><a href="javascript:void(0)" title="Dashboard">Dashboard</a></li> -->
		</ul>
	
	</div></div>
	<!-- End status bar -->
	
	<div id="header-shadow"></div>
	<!-- End header -->
	
	<!-- Always visible control bar
	<div id="control-bar" class="grey-bg clearfix"><div class="container_12">
	
		<div class="float-left">
		</div>
		
		<div class="float-right">
			<button type="button" disabled="disabled">Disabled</button>
			<button type="button" class="red">Cancel</button>
			<button type="button" class="grey">Reset</button>
			<button type="button"><img src="img/icons/fugue/tick-circle.png" width="16" height="16"> Save</button>
		</div>
			
	</div></div> -->
