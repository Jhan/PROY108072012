<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<html lang="es">
<head>

	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><tiles:getAsString name="title" /></title>
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="<%=request.getContextPath()%>/css/mini3537.css?files=reset,common,form,standard,960.gs.fluid,simple-lists,block-lists,planning,table,calendars,wizard,gallery" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
	<link rel="icon" type="<%=request.getContextPath()%>/img/png" href="favicon-large.png">
	<script src="<%=request.getContextPath()%>/js/libs/modernizr.custom.min.js"></script>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>
</html>